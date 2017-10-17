package com.nattav.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nattav.models.PaymentModel;

@Controller
public class HomeController {
	
	
	@RequestMapping(value="/")
	public ModelAndView index() throws Exception{
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	@RequestMapping(value="/createOrder",method = RequestMethod.GET)
	public ModelAndView paymentInfo() {
		ModelAndView mv = new ModelAndView("create-order");
		PaymentModel paymentModel = new PaymentModel();
		mv.addObject("paymentModel",paymentModel);
		return mv;
	}
}
