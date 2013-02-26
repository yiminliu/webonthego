package com.trc.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;

import com.trc.domain.refund.RefundCode;
import com.trc.domain.refund.RefundRequest;
import com.trc.exception.management.RefundManagementException;
import com.trc.exception.service.RefundServiceException;
import com.trc.manager.UserManager;
import com.trc.service.RefundService;
import com.trc.user.User;

import com.tscp.util.logger.LogLevel;
import com.tscp.util.logger.aspect.Loggable;

@Component
public class RefundManager implements RefundManagerModel {
  //@Autowired
  //private PaymentService paymentService;
  @Autowired
  private RefundService refundService;
  @Autowired
  private UserManager userManager;

  /*public PaymentTransaction getPaymentTransaction(int custId, int transId) throws PaymentManagementException {
    try {
      return paymentService.getPaymentTransaction(custId, transId);
    } catch (PaymentServiceException e) {
      throw new PaymentManagementException(e);
    }
  }
   

  @Loggable(value = LogLevel.TRACE)
  @PreAuthorize("isAuthenticated() and hasPermission(#user, 'canRefund')")
  public void refundPayment(int accountNo, String amount, String trackingId, RefundCode refundCode, String notes) throws PaymentManagementException {
    try {
      refundService.refundPayment(accountNo, amount, Integer.parseInt(trackingId), userManager.getCurrentUser(), refundCode, notes);
    } catch (PaymentServiceException e) {
      throw new PaymentManagementException(e.getMessage(), e.getCause());
    }
  }
  */
  @Loggable(value = LogLevel.TRACE)
  @PreAuthorize("isAuthenticated() and hasPermission(#user, 'canRefund')")
  public void refundPayment(int accountNo, String amount, String trackingId, User user, RefundCode refundCode, String notes) throws RefundManagementException {
    try {
        refundService.refundPayment(accountNo, amount, Integer.parseInt(trackingId), user.getUsername(), refundCode.getValue(), notes);
    } 
    catch (RefundServiceException e) {
      throw new RefundManagementException(e.getMessage(), e.getCause());
    }
  }
    
  public void refundPayment(User user, RefundRequest paymentRefund) throws RefundManagementException {
    refundPayment(paymentRefund.getPaymentTransaction().getAccountNo(), paymentRefund.getPaymentTransaction().getPaymentAmount(), 
    		      String.valueOf(paymentRefund.getPaymentTransaction().getBillingTrackingId()), 
    		      user, paymentRefund.getRefundCode(), paymentRefund.getNotes());
  }
  
}