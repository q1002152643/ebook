package com.ebook.sso.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ebook.sso.service.UserService;
import com.ebook.sso.utils.CookieUtils;

@Controller
@RequestMapping("/page")
public class PageController {

	@Autowired
	private UserService userService;

	@RequestMapping("/register")
	public String showRegister() {
		return "register";
	}

	@RequestMapping("/login")
	public String showLogin(String redirect, Model model) {
		model.addAttribute("redirect", redirect);
		return "login";
	}

	@GetMapping("/logout/{token}")
	public String userLogout(@PathVariable String token) {
		userService.userLogout(token);
		return "login";
	}

	@RequestMapping("/verifycode")
	public void verifycode(HttpServletRequest request, HttpServletResponse response) {
		int width = 80;
		int height = 32;
		// create the image
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		// set the background color
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, width, height);
		// draw the border
		g.setColor(Color.black);
		g.drawRect(0, 0, width - 1, height - 1);
		// create a random instance to generate the codes
		Random rdm = new Random();
		String hash1 = Integer.toHexString(rdm.nextInt());
		// make some confusion
		for (int i = 0; i < 50; i++) {
			int x = rdm.nextInt(width);
			int y = rdm.nextInt(height);
			g.drawOval(x, y, 0, 0);
		}
		// generate a random code
		String capstr = hash1.substring(0, 4);
		// write in cookie
		CookieUtils.setCookie(request, response, "verifycode", capstr);

		g.setColor(new Color(0, 100, 0));
		g.setFont(new Font("Candara", Font.BOLD, 24));
		g.drawString(capstr, 8, 24);
		g.dispose();
		response.setContentType("image/jpeg");
		OutputStream strm;
		try {
			strm = response.getOutputStream();
			ImageIO.write(image, "jpeg", strm);
			strm.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
