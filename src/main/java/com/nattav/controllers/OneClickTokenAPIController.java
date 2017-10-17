package com.nattav.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nattav.models.OttModel;

@Controller
public class OneClickTokenAPIController {

	
	@RequestMapping(value = "/otc-index")
	public ModelAndView initOneTimeToken() {
		ModelAndView model = new ModelAndView("onetime-token/oneTimeTokenPage");
		model.addObject("ottModel", new OttModel());
		return model;
	}
}
