package com.gongcha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	//@Autowired
	//private AdminService adminService;
	
	@RequestMapping("/admin_main")
	public String admin_main() {
		return "/admin/admin_main";
	}
}
