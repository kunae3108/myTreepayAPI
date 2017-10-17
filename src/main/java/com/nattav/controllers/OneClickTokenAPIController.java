package com.nattav.controllers;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nattav.models.PaymentModel;

@Controller
public class OneClickTokenAPIController {

	@RequestMapping(value = "/oct-process")
	public ModelAndView octProcess(@ModelAttribute("paymentModel") PaymentModel paymentModel) {
		ModelAndView model = new ModelAndView("oneclick-token/oneClickTokenResult");

		try {
			System.out.println("\ntoken_no: " + paymentModel.getToken_no());
			String secure_key = paymentModel.getSecure_key();
			String pay_type = paymentModel.getPay_type();
			String order_no = paymentModel.getOrder_no();
			String trade_mony = paymentModel.getTrade_mony();
			String site_cd = paymentModel.getSite_cd();
			String token_no = paymentModel.getToken_no();
			String user_id = paymentModel.getUser_id();
			String passwd = paymentModel.getPasswd();

			/* Hash data */
			String hash_data = "";
			String hash_string = pay_type + order_no + trade_mony + site_cd + secure_key + user_id + passwd + token_no;
			System.out.println("pay_type:" + pay_type + " order_no:" + order_no + " trade_mony:" + trade_mony
					+ " site_cd:" + site_cd + " secure_key:" + secure_key + " token_no:" + token_no + " user_id:"
					+ user_id + " passwd:" + passwd);
			MessageDigest md_sha2 = MessageDigest.getInstance("SHA-256");

			// Make hash data
			md_sha2.update(hash_string.getBytes("UTF-8"));

			byte byteData[] = md_sha2.digest();

			// Convert to Hex
			for (int i = 0; i < byteData.length; i++) {
				hash_data += Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1);
			}

			System.out.println("hash_data :: " + hash_data);

			// put data to json
			JSONObject param = new JSONObject();
			param.put("site_cd", site_cd);
			param.put("tp_langFlag", "th");
			param.put("currency", "764");
			param.put("pay_type", pay_type);
			param.put("hash_data", hash_data);
			param.put("order_no", order_no);
			param.put("order_first_name", "thom");
			param.put("order_email", "anusorn@treepay.co.th");
			param.put("good_name", "test product");
			param.put("trade_mony", trade_mony);
			param.put("user_id", user_id);
			param.put("passwd", passwd);
			param.put("ret_url", "http://localhost:8080/myTreepayAPI/pay-success");
			param.put("token_no", token_no);
			param.put("fp_id", paymentModel.getFp_id());

			String json = param.toJSONString();

			System.out.println("json :: " + json);

			// Connection to treepay api for test
			URL url = new URL("https://paytest.treepay.co.th/api/octApprove.api");

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

			String message = sb.toString();
			model.addObject("message", message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/oct-index")
	public ModelAndView initOneTimeToken(@ModelAttribute("paymentModel") PaymentModel paymentModel) {
		ModelAndView model = new ModelAndView("oneclick-token/oneClickTokenIndex");

		model.addObject("paymentModel", null != paymentModel ? paymentModel : new PaymentModel());

		return model;
	}

}
