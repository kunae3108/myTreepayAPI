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
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nattav.models.OttModel;

@Controller
public class OneTimeTokenAPIController {

	@RequestMapping(value = "/ott-index")
	public ModelAndView initOneTimeToken() {
		ModelAndView model = new ModelAndView("onetime-token/oneTimeTokenPage");
		model.addObject("ottModel", new OttModel());
		return model;
	}

	@RequestMapping(value = "/ott-process", method = RequestMethod.POST)
	public ModelAndView ottProcess(@ModelAttribute("ottModel") OttModel ottModel) {

		System.out.println("model : " + ottModel.toString());

		ModelAndView model = new ModelAndView("onetime-token/oneTimeTokenResult");

		String hash_data = "";
		String hash_string = ottModel.getPay_type() + ottModel.getOrder_no() + ottModel.getTrade_mony()
				+ ottModel.getSite_cd() + ottModel.getSecure_key() + ottModel.getOtt();

		System.out.println("\npay_type:" + ottModel.getPay_type() + " order_no:" + ottModel.getOrder_no()
				+ " trade_mony:" + ottModel.getTrade_mony() + " site_cd:" + ottModel.getSite_cd() + " secure_key:"
				+ ottModel.getSecure_key() + " ott:" + ottModel.getTrade_mony());
		try {
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
			param.put("ver", ottModel.getVer());
			param.put("cvn", ottModel.getCvn());
			param.put("site_cd", ottModel.getSite_cd());
			param.put("tp_langFlag", ottModel.getTp_langFlag());
			param.put("currency", ottModel.getCurrency());
			param.put("pay_type", ottModel.getPay_type());
			param.put("ott", ottModel.getOtt());
			param.put("hash_data", hash_data);
			param.put("order_no", ottModel.getOrder_no());
			param.put("order_addr", ottModel.getOrder_addr());
			param.put("order_first_name", ottModel.getOrder_first_name());
			param.put("order_last_name", ottModel.getOrder_last_name());
			param.put("order_city", ottModel.getOrder_city());
			param.put("order_country", ottModel.getOrder_country());
			param.put("order_email", ottModel.getOrder_email());
			param.put("order_tel", ottModel.getOrder_tel());
			param.put("order_post_code", ottModel.getOrder_post_code());

			param.put("recv_addr", ottModel.getRecv_addr());
			param.put("recv_first_name", ottModel.getRecv_first_name());

			param.put("recv_last_name", ottModel.getRecv_last_name());
			param.put("recv_tel", ottModel.getRecv_tel());
			param.put("recv_email", ottModel.getRecv_email());
			param.put("recv_post_code", ottModel.getRecv_email());
			param.put("good_name", ottModel.getGood_name());
			param.put("trade_mony", ottModel.getTrade_mony());

			param.put("ret_url", ottModel.getRet_url());

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
