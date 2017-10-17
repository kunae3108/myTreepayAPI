package com.nattav.controllers;

import java.security.MessageDigest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nattav.models.PaymentModel;

@Controller
public class PaymentController {

	@RequestMapping(value = "/beforePay")
	public ModelAndView beforePay(@ModelAttribute("paymentModel") PaymentModel paymentModel) {

		ModelAndView mv = new ModelAndView("beforePay");

		String pay_type = paymentModel.getPay_type();
		String order_no = paymentModel.getOrder_no();
		String trade_mony = paymentModel.getTrade_mony();
		String site_cd = paymentModel.getSite_cd();
		String secure_key = paymentModel.getSecure_key();
		String user_id = paymentModel.getUser_id();
		String bill_end = paymentModel.getBill_end();
		String bill_freq = paymentModel.getBill_end();

		String hash_data = "";
		String hash_string = "";

		if ("PACA".equals(pay_type) ) {
			hash_string = pay_type + order_no + trade_mony + site_cd + secure_key + user_id;
		} else {
			hash_string = pay_type + order_no + trade_mony + site_cd + secure_key + user_id + bill_end + bill_freq;
		}

		System.out.println(pay_type);
		System.out.println(order_no);
		System.out.println(trade_mony);
		System.out.println(site_cd);
		System.out.println(secure_key);
		System.out.println(user_id);

		try {
			MessageDigest md_sha2 = MessageDigest.getInstance("SHA-256");
			md_sha2.update(hash_string.getBytes("UTF-8"));
			byte byteData[] = md_sha2.digest();
			// Convert to Hex
			for (int i = 0; i < byteData.length; i++) {
				hash_data += Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1);
			}
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + hash_data);
			paymentModel.setHash_data(hash_data);
			
			mv.addObject("paymentModel",paymentModel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
