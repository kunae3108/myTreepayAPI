package com.nattav.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nattav.models.PaymentModel;

@Controller
public class OneTimeTokenAPIController {

	@RequestMapping(value = "/ott-index")
	public ModelAndView initOneTimeToken(@ModelAttribute("paymentModel") PaymentModel paymentModel) {
		ModelAndView model = new ModelAndView("onetime-token/oneTimeTokenIndex");
		model.addObject("ottModel", null!=paymentModel?paymentModel:new PaymentModel());
		return model;
	}

	@RequestMapping(value = "/ott-process", method = RequestMethod.POST)
	public ModelAndView ottProcess(@ModelAttribute("paymentModel") PaymentModel paymentModel) {

		System.out.println("model : " + paymentModel.toString());

		ModelAndView model = new ModelAndView("onetime-token/oneTimeTokenResult");

		String hash_data = "";

//		String secureKey = "0alx7PU-l5C5DyXdc5uuPFz5T3lbOfYQ6BMro-8AV14cuw8vGVc92mHEqY-sHauNy6Is4bA4lNjqEEOBjKkfAc8ECWhIKb2rNWJo5r-swvc95yncWI42uDgZX1F15yUFruzIA1OrcwtesS9e8ALnLx5JVbBCiqx.P1CbE0UgkGMWKUUc4SFPijYSKEwA3nkwm-KbvuGKHK9dWT7JSHuYEfCPsS93XVxWpp4vXsqNPtouicZzZqSctCggVvWMpnkXtazqHoBanPWMZcOwWFsAIZjmxc8C92ACMvXfE2yu3CZHfZg0verROuU5LNtp7wpW5idytJ3GKcBLJT2T8xpuf-u__";
		String secureKey = paymentModel.getSecure_key();

		String hash_string = paymentModel.getPay_type() + paymentModel.getOrder_no() + paymentModel.getTrade_mony()
				+ paymentModel.getSite_cd() + secureKey + paymentModel.getOtt();
		
		System.out.println("\npay_type:" + paymentModel.getPay_type() + " order_no:" + paymentModel.getOrder_no()
				+ " trade_mony:" + paymentModel.getTrade_mony() + " site_cd:" + paymentModel.getSite_cd() + " secure_key:"
				+ secureKey + " ott:" + paymentModel.getTrade_mony());

		try {
			MessageDigest md_sha2 = MessageDigest.getInstance("SHA-256");
			byte byteData[] = null;
			// Make hash data
			md_sha2.update(hash_string.getBytes("UTF-8"));
			byteData = md_sha2.digest();

			for (int i = 0; i < byteData.length; i++) {
				hash_data += Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1);
			}

			System.out.println("hash_data :: " + hash_data);

			// put data to json
			JSONObject param = new JSONObject();
			
			param.put("ver", paymentModel.getVer());
			param.put("cvn", paymentModel.getCvn());
			param.put("site_cd", paymentModel.getSite_cd());
			param.put("tp_langFlag", paymentModel.getTp_langFlag());
			param.put("currency", paymentModel.getCurrency());
			
			param.put("pay_type", paymentModel.getPay_type());
			param.put("ott", paymentModel.getOtt());
			param.put("hash_data", hash_data);
			param.put("order_no", paymentModel.getOrder_no());
			param.put("order_addr", paymentModel.getOrder_addr());
			
			param.put("order_first_name", paymentModel.getOrder_first_name());
			param.put("order_last_name", paymentModel.getOrder_last_name());
			param.put("order_city", paymentModel.getOrder_city());
			param.put("order_country", paymentModel.getOrder_country());
			param.put("order_email", paymentModel.getOrder_email());
			
			param.put("order_tel", paymentModel.getOrder_tel());
			param.put("order_post_code", paymentModel.getOrder_post_code());
			param.put("recv_addr", paymentModel.getRecv_addr());
			param.put("recv_first_name", paymentModel.getRecv_first_name());
			param.put("recv_last_name", paymentModel.getRecv_last_name());
			
			param.put("recv_tel", paymentModel.getRecv_tel());
			param.put("recv_email", paymentModel.getRecv_email());
			param.put("recv_post_code", paymentModel.getRecv_post_code());
			param.put("good_name", paymentModel.getGood_name());
			param.put("trade_mony", paymentModel.getTrade_mony());
			
			param.put("ret_url", paymentModel.getRet_url());

			String json = param.toJSONString();

			System.out.println("json :: " + json);
			// Connection to treepay api for test
			URL url = new URL("https://paytest.treepay.co.th/api/ottApprove.api");

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoInput(true);
			conn.setDoOutput(true);

			OutputStreamWriter output = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			output.write(json);
			output.flush();

			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line = "";
			StringBuffer sb = new StringBuffer();
			while ((line = rd.readLine()) != null) {
				if (!line.trim().equals("")) {
					sb.append(line);
				}
			}
			rd.close();
			conn.disconnect();

			model.addObject("message", sb.toString());

		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
}
