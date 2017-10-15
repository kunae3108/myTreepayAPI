package com.nattav.models;

public class PaymentModel {
	private String res_cd;
	private String res_msg;
	private String tno;
	private String trade_mony;
	private String trade_ymd;
	private String trade_hms;
	private String card_no;
	private String auth_no;
	private String auth_ymd;
	private String auth_hms;

	public String getRes_cd() {
		return res_cd;
	}

	public void setRes_cd(String res_cd) {
		this.res_cd = res_cd;
	}

	public String getRes_msg() {
		return res_msg;
	}

	public void setRes_msg(String res_msg) {
		this.res_msg = res_msg;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTrade_mony() {
		return trade_mony;
	}

	public void setTrade_mony(String trade_mony) {
		this.trade_mony = trade_mony;
	}

	public String getTrade_ymd() {
		return trade_ymd;
	}

	public void setTrade_ymd(String trade_ymd) {
		this.trade_ymd = trade_ymd;
	}

	public String getTrade_hms() {
		return trade_hms;
	}

	public void setTrade_hms(String trade_hms) {
		this.trade_hms = trade_hms;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getAuth_no() {
		return auth_no;
	}

	public void setAuth_no(String auth_no) {
		this.auth_no = auth_no;
	}

	public String getAuth_ymd() {
		return auth_ymd;
	}

	public void setAuth_ymd(String auth_ymd) {
		this.auth_ymd = auth_ymd;
	}

	public String getAuth_hms() {
		return auth_hms;
	}

	public void setAuth_hms(String auth_hms) {
		this.auth_hms = auth_hms;
	}

	@Override
	public String toString() {
		return "PaymentModel [res_cd=" + res_cd + ", res_msg=" + res_msg + ", tno=" + tno + ", trade_mony=" + trade_mony
				+ ", trade_ymd=" + trade_ymd + ", trade_hms=" + trade_hms + ", card_no=" + card_no + ", auth_no="
				+ auth_no + ", auth_ymd=" + auth_ymd + ", auth_hms=" + auth_hms + "]";
	}

}
