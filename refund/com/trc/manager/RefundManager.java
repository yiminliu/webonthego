package com.trc.manager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;

import com.trc.domain.refund.RefundCode;
import com.trc.domain.refund.RefundRequest;
import com.trc.exception.management.RefundManagementException;
import com.trc.exception.service.RefundServiceException;
import com.trc.service.RefundService;
import com.trc.user.User;

import com.tscp.util.logger.LogLevel;
import com.tscp.util.logger.aspect.Loggable;

@Component
public class RefundManager implements RefundManagerModel {
  @Autowired
  private RefundService refundService;
  
  @Loggable(value = LogLevel.TRACE)
  @PreAuthorize("isAuthenticated() and hasPermission(#user, 'canRefund')")
  public void refundPayment(int accountNo, int transId, String amount, String trackingId, User user, RefundCode refundCode, String notes) throws RefundManagementException {
     try {
        refundService.refundPayment(accountNo, transId, amount, Integer.parseInt(trackingId), user.getUsername(), refundCode.getValue(), notes);
     } 
     catch (RefundServiceException e) {
        throw new RefundManagementException(e.getMessage(), e.getCause());
     }
  }
    
  @PreAuthorize("isAuthenticated() and hasPermission(#user, 'canRefund')")
  public void refundPayment(User user, RefundRequest paymentRefund, int transId) throws RefundManagementException {
     refundPayment(paymentRefund.getPaymentTransaction().getAccountNo(), 
    		       transId,
    		       paymentRefund.getPaymentTransaction().getPaymentAmount(), 
    		       String.valueOf(paymentRefund.getPaymentTransaction().getBillingTrackingId()), 
    		       user, paymentRefund.getRefundCode(), paymentRefund.getNotes());
  }

  
}