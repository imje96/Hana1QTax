package com.kopo.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JspController {
	@GetMapping("/index")
	public String getIndex() {
		return "index";
	}

}
