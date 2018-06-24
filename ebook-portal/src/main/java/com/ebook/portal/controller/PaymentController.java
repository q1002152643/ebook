package com.ebook.portal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ebook.portal.service.OrderService;
import com.ebook.portal.utils.PaymentUtil;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private OrderService orderService;

	@Value("${yeepay.switch}")
	private boolean yeepay_switch;

	@Value("${callback_url}")
	private String callback_url;

	/**
	 * 支付准备
	 */
	@RequestMapping("/paymentPre")
	public String paymentPre(String orderId, String total, HttpServletRequest request) {
		if (StringUtils.isNoneBlank(orderId, total)) {
			request.setAttribute("orderId", orderId);
			request.setAttribute("total", total);
			return "home/pay";
		} else {
			return null;
		}
	}

	/**
	 * 支付方法
	 * 
	 */
	@RequestMapping("/payment")
	public String payment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
		 * 1. 准备13个参数
		 */
		String p0_Cmd = "Buy";// 业务类型，固定值Buy
		String p1_MerId = "10001126856";// 商号编码，在易宝的唯一标识
		String p2_Order = req.getParameter("oid");// 订单编码
		String p3_Amt = "0.01";// 支付金额
		String p4_Cur = "CNY";// 交易币种，固定值CNY
		String p5_Pid = "";// 商品名称
		String p6_Pcat = "";// 商品种类
		String p7_Pdesc = "";// 商品描述
		String p8_Url = callback_url;// 在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";// 送货地址
		String pa_MP = "";// 扩展信息
		String pd_FrpId = req.getParameter("yh");// 支付通道
		String pr_NeedResponse = "1";// 应答机制，固定值1

		// 支付通道未打开
		if (!yeepay_switch) {
			return "redirect:/payment/back?oid=" + p2_Order;
		}

		/*
		 * 2. 计算hmac 需要13个参数 需要keyValue 需要加密算法
		 */
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc,
				p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);

		/*
		 * 3. 重定向到易宝的支付网关
		 */
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);

		resp.sendRedirect(sb.toString());
		return null;
	}

	/**
	 * 回馈方法 当支付成功时，易宝会访问这里 用两种方法访问： 1. 引导用户的浏览器重定向(如果用户关闭了浏览器，就不能访问这里了) 2.
	 * 易宝的服务器会使用点对点通讯的方法访问这个方法。（必须回馈success，不然易宝服务器会一直调用这个方法）
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/back")
	public String back(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 支付通道未打开
		if (!yeepay_switch) {
			orderService.updateOrderStatusById(Long.parseLong(req.getParameter("oid")), 2);
			req.setAttribute("code", "success");
			req.setAttribute("msg", "恭喜，支付成功！");
			return "home/msg";
		}

		/*
		 * 1. 获取12个参数
		 */
		String p1_MerId = req.getParameter("p1_MerId");
		String r0_Cmd = req.getParameter("r0_Cmd");
		String r1_Code = req.getParameter("r1_Code");
		String r2_TrxId = req.getParameter("r2_TrxId");
		String r3_Amt = req.getParameter("r3_Amt");
		String r4_Cur = req.getParameter("r4_Cur");
		String r5_Pid = req.getParameter("r5_Pid");
		String r6_Order = req.getParameter("r6_Order");
		String r7_Uid = req.getParameter("r7_Uid");
		String r8_MP = req.getParameter("r8_MP");
		String r9_BType = req.getParameter("r9_BType");
		String hmac = req.getParameter("hmac");
		/*
		 * 2. 获取keyValue
		 */
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		/*
		 * 3. 调用PaymentUtil的校验方法来校验调用者的身份 >如果校验失败：保存错误信息，转发到msg.ftl >如果校验通过： *
		 * 判断访问的方法是重定向还是点对点，如果要是重定向 修改订单状态，保存成功信息，转发到msg.ftl *
		 * 如果是点对点：修改订单状态，返回success
		 */
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid,
				r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		if (!bool) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "不好意思，支付失败！");
			return "home/msg";
		}
		if (r1_Code.equals("1")) {
			orderService.updateOrderStatusById(Long.parseLong(r6_Order), 2);
			if (r9_BType.equals("1")) {
				req.setAttribute("code", "success");
				req.setAttribute("msg", "恭喜，支付成功！");
				return "home/msg";
			} else if (r9_BType.equals("2")) {
				resp.getWriter().print("success");
			}
		}
		return null;
	}

}
