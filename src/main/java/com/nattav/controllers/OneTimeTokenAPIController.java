package com.nattav.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OneTimeTokenAPIController {
	
	@RequestMapping(value="onetime-token")
	public ModelAndView initOneTimeToken() {
		return new ModelAndView("onetime-token/oneTimeTokenPage");
	}

}
