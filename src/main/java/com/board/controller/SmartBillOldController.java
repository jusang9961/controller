package com.board.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.SmartbillOldVO;
import com.board.service.SmartbillOldService;

/**	
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/smartbillOld/*")
public class SmartBillOldController {

	private static final Logger logger = LoggerFactory.getLogger(SmartBillOldController.class);
	
	@Inject
	SmartbillOldService service;

	@RequestMapping(value = "/smartbillOldArissue", method = RequestMethod.GET)
	public String viewsSmartbillOld(Locale locale) {

		return "/smartbillOld/smartbillOldArissue";
	
	}

	@RequestMapping(value = "/smartbillOldReceive", method = RequestMethod.GET)
	public String smartbillOldReceive(Locale locale) {

		return "/smartbillOld/smartbillOldReceive";

	}
	
	@RequestMapping(value = "/smartbillOldDtt", method = RequestMethod.GET)
	public String smartbillOldDtt(Locale locale) {

		return "/smartbillOld/smartbillOldDtt";

	}

	/*
	 * 보관함(리스트) 조회
	 */
	@RequestMapping(value="/smartbillOld/smartbillOldList", method = RequestMethod.GET)
	public String smartbillOldList(SmartbillOldVO smartbillOldVO, Model model) throws Exception {

		List<SmartbillOldVO> list = service.list(smartbillOldVO);
		logger.info("##################################### service.list 데이터 가져오기");
        logger.info("##################################################" + list.get(0).getReturnCode());
		logger.info("##################################################" + list.get(0).getConversationId());

		model.addAttribute("list", list);

		return "/smartbillOld/smartbillOldList";

	}

	/*
	 * 구연동 전자(세금)계산서 발행
	 */
	
	@RequestMapping(value = "/smartbillOldArissuePost", method = RequestMethod.POST)
	public String smartbillOldPost(HttpServletRequest request, SmartbillOldVO smartbillOldvo) throws Exception{

		BufferedReader in = null;
		HttpSession session = request.getSession();

		logger.info("전자세금계산서 전송(ARISSUE)");
		
		logger.info("############################session.getAttribute(\"userID\") : " + session.getAttribute("userID"));

		if(session.getAttribute("userID") != null) {

			// 작성일자의 특수문자 제거
			String wdate = smartbillOldvo.getTxtDate().replaceAll("[^0-9]", "");
			smartbillOldvo.setTxtDate(wdate);

			service.arissue(smartbillOldvo);

			// 세금계산서 발행 호출
			try {
				URL obj = new URL("http://192.168.100.118:10001/CALLSB_V3/XXSB_DTI_ARISSUE.ASP?BATCH_ID=" + smartbillOldvo.getTxtBatchId() + "&ID=29TEST&PASS=TEST");
				
				HttpURLConnection con = (HttpURLConnection)obj.openConnection();

				con.setRequestMethod("GET");

				in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

			} catch(Exception e) {
				e.printStackTrace();
			}
		} else {
		
			System.out.println("세션이 존재하지 않습니다. 로그인 해주세요");
			System.out.println("###################################");
			System.out.println("###################################");

			/*
			 * request.setAttribute("msg", "로그인 필요"); request.setAttribute("url",
			 * "LoginCheck");
			 */
			
		}
		return "redirect:/";

	}

	/*
	 * 구연동 전자(세금)계산서 역매입 요청
	 */
	
	@RequestMapping(value = "/smartbillOld/smartbillOldReceivePost", method = RequestMethod.POST)
	public String smartbillOldReceivePost(HttpServletRequest request, SmartbillOldVO smartbillOldvo) throws Exception{

		BufferedReader in = null;

		logger.info("전자세금계산서 역매입 요청 전송(RARISSUE)");

			// 작성일자의 특수문자 제거
			String wdate = smartbillOldvo.getTxtDate().replaceAll("[^0-9]", "");
			smartbillOldvo.setTxtDate(wdate);

			service.issue(smartbillOldvo);

			// 역매입 요청 발행
			try {
				URL obj = new URL("http://192.168.100.118:10001/CALLSB_V3/XXSB_DTI_ISSUE.ASP?BATCH_ID=" + smartbillOldvo.getTxtBatchId() + "&ID=29TEST&PASS=TEST");

				HttpURLConnection con = (HttpURLConnection)obj.openConnection();

				con.setRequestMethod("GET");
		
				in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		return "redirect:/";

	}
	
	/*
	 * 구연동 전자(세금)계산서 거래명세서 포함 발행
	 */
	
	@RequestMapping(value = "/smartbillOld/smartbillOldArissueDttPost", method = RequestMethod.POST)
	public String smartbillOldArissueDttPost(HttpServletRequest request, SmartbillOldVO smartbillOldvo) throws Exception{

		BufferedReader in = null;

		logger.info("전자세금계산서 역매입 요청 전송(RARISSUE)");

			// 작성일자의 특수문자 제거
			String wdate = smartbillOldvo.getTxtDate().replaceAll("[^0-9]", "");
			smartbillOldvo.setTxtDate(wdate);

			service.arissueDtt(smartbillOldvo);

			// 역매입 요청 발행
			try {
				URL obj = new URL("http://192.168.100.118:10001/CALLSB_V3/XXSB_DTI_ARISSUE_DTT.ASP?BATCH_ID=" + smartbillOldvo.getTxtBatchId() + "&ID=29TEST&PASS=TEST");

				HttpURLConnection con = (HttpURLConnection)obj.openConnection();

				con.setRequestMethod("GET");
		
				in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		return "redirect:/";
	}
	/*
	구연동 전자(세금)계산서 보관함 조회
	*/


}
