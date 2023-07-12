package kr.co.two.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.payment.service.PaymentService;

@Controller
public class PaymentMoveController {

	@Autowired
	PaymentService service;

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/paymentVacationForm.go")
	public ModelAndView member() {

		return service.member();

	}

	@RequestMapping(value = "/paymentBuyItemForm.go")
	public ModelAndView member2() {

		return service.member2();

	}
	
	  @RequestMapping(value = "/paymentProjectForm.go") public ModelAndView
	  member3() {
	  
	  return service.member3();
	  
	  }
	 

	@RequestMapping(value = "./paymentMain.go")
	public ModelAndView home() {

		return new ModelAndView("payment_home");

	}

	@RequestMapping(value = "/paymentMain.go")
	public ModelAndView home2() {

		return new ModelAndView("paymentMain");

	}

	@RequestMapping(value = "/paymentList.go")
	public ModelAndView home7() {

		return new ModelAndView("paymentList");

	}

	@RequestMapping(value = "/payment.go")
	public ModelAndView home8() {

		return new ModelAndView("payment");

	}

	@RequestMapping(value = "/paymentProjectForm_pay.go")
	public ModelAndView home9() {

		return new ModelAndView("paymentProjectForm_pay");

	}

	@RequestMapping(value = "/pay__mentVacationForm.go")
	public ModelAndView home10() {

		return new ModelAndView("pay__mentVacationForm");

	}

}
