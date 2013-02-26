package com.trc.service;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.trc.exception.service.RefundServiceException;
import com.tscp.mvne.Account;
import com.tscp.mvne.KenanPayment;

public interface RefundServiceModel {

	public List<KenanPayment> getPayments(Account account) throws RefundServiceException;
	
	 public void refundPayment(int accountNo, String amount, int trackingId, String refundBy, int refundCode, String notes) throws RefundServiceException;

}