package com.nattav.controllers;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@Configuration
@EnableWebMvc
public class HomeController {
	
	
	@RequestMapping(value="/",method= RequestMethod.GET)
	public ModelAndView indexindex2() throws Exception{
		
		
		
		ModelAndView mv = new ModelAndView("index");
		
		System.out.println("ok0");
		
		
		return mv;
	}
	
}
