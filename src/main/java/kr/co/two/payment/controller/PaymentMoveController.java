package kr.co.two.payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.payment.service.PaymentService;

@Controller
public class PaymentMoveController {

	@Autowired
	PaymentService service;

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/paymentVacationForm.go")
	public ModelAndView member(HttpSession session) {

		return service.member(session);

	}

	@RequestMapping(value = "/paymentBuyItemForm.go")
	public ModelAndView member2(HttpSession session) {

		return service.member2(session);

	}
	
	  @RequestMapping(value = "/paymentProjectForm.go") public ModelAndView
	  member3(HttpSession session) {
	  
	  return service.member3(session);
	  
	  }
	 



	@RequestMapping(value = "/paymentMain.go")
	public ModelAndView home2(HttpSession session) {

		return service.main(session);

	}

	@RequestMapping(value = "/paymentList.go")
	public ModelAndView home7(HttpSession session) {

		return  new ModelAndView("paymentList");

	}


	@RequestMapping(value = "/payment.go")
	public ModelAndView home8() {

		return new ModelAndView("payment");

	}

	@RequestMapping(value = "/paymentVacationForm_pay.go")
	public ModelAndView home9(HttpSession session, String document_id, boolean temp) {

		return service.vacationForm(session, document_id, temp);

	}
	@RequestMapping(value = "/paymentVacationFormDetail.go")
	public ModelAndView home19(HttpSession session, String document_id, boolean temp) {

		return service.vacationFormDetail(session, document_id, temp);

	}

	@RequestMapping(value = "/pay__mentVacationForm.go")
	public ModelAndView home10() {

		return new ModelAndView("pay__mentVacationForm");

	}
	@RequestMapping(value = "/paymentListTemp.go")
	public ModelAndView home11() {

		return new ModelAndView("paymentListTemp");

	}
	@RequestMapping(value = "/paymentListPay.go")
	public ModelAndView home12() {

		return new ModelAndView("paymentListPay");

	}
	
	@RequestMapping(value = "/paymentListDone.go")
	public ModelAndView home13() {

		return new ModelAndView("paymentListDone");

	}
	@RequestMapping(value = "/paymentListTake.go")
	public ModelAndView home14() {

		return new ModelAndView("paymentListTake");

	}

	@RequestMapping(value = "/paymentListChatTest.go")
	public ModelAndView home15() {

		return new ModelAndView("paymentListChatTest");

	}
	
}
