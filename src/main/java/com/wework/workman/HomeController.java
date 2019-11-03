package com.wework.workman;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.humanResource.model.service.HumanResourceService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name = "accountService")
	private AccountService aService;
	@Resource(name = "humanResourceService")
	private HumanResourceService hService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.wo", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int check = aService.checkSal();
		if(check<1) {
			int insertSal = aService.insertSal();
		}
		int check2 = hService.checkHolidayCount();
		if(check2<1) {
			int updateHoliday = hService.updateHolidayCount();
		}
		
		session.setAttribute("loginUser", "22");
		model.addAttribute("flag","출");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
	
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
