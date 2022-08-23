package com.board.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.board.domain.SmartbillOldCertVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.SmartbillOldVO;
import com.board.service.SmartbillOldService;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(value = "/smartbillOldReceiveDtt", method = RequestMethod.GET)
	public String smartbillOldReceiveDtt() {

		return "/smartbillOld/smartbillOldReceiveDtt";

	}

	/*
	 * 보관함(리스트) 조회
	 */
	@RequestMapping(value="/smartbillOld/smartbillOldList", method = RequestMethod.GET)
	public String smartbillOldList(SmartbillOldVO smartbillOldVO, Model model) throws Exception {

		List<SmartbillOldVO> list = service.list(smartbillOldVO);
        //logger.info("##################################################" + list.get(0).getReturnCode());
		//logger.info("##################################################" + list.get(0).getConversationId());

		model.addAttribute("list", list);

		return "/smartbillOld/smartbillOldList";
	}

    /*
     * 전자(세금)계산서 view 호출
     */
    @RequestMapping(value="/smartbillOld/smartbillOldview", method = RequestMethod.GET)
    public void smartbillOldview(@RequestParam("conversationId") String conversationid, Model model) throws Exception {

        SmartbillOldVO smartbillOldVO = service.view(conversationid);
        SmartbillOldVO smartbillOldVO1 = service.status(conversationid);

        model.addAttribute("view", smartbillOldVO);
        model.addAttribute("status", smartbillOldVO1);
    }

	/*
	 * 구연동 전자(세금)계산서 발행
	 */
	@RequestMapping(value = "/smartbillOldArissuePost", method = RequestMethod.POST)
	public String smartbillOldPost(HttpServletRequest request, SmartbillOldVO smartbillOldvo) throws Exception{

		BufferedReader in = null;
		HttpSession session = request.getSession();

		logger.info("전자세금계산서 전송(ARISSUE)");

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
     * 구연동 전자(세금)계산서/거래명세서 역매입 요청
     */
    @RequestMapping(value = "/smartbillOld/smartbillOldReceiveDttPost", method = RequestMethod.POST)
    public String smartbillOldReceiveDttPost(HttpServletRequest request, SmartbillOldVO smartbillOldvo) throws Exception{

        BufferedReader in = null;

        logger.info("전자세금계산서/거래명세서 역매입 요청 전송(ISSUE_T)");

        // 작성일자의 특수문자 제거
        String wdate = smartbillOldvo.getTxtDate().replaceAll("[^0-9]", "");
        smartbillOldvo.setTxtDate(wdate);

        service.issueDtt(smartbillOldvo);

        // 역매입 요청 발행
        try {
            URL obj = new URL("http://192.168.100.118:10001/CALLSB_V3/XXSB_DTI_ISSUE_T.ASP?BATCH_ID=" + smartbillOldvo.getTxtBatchId() + "&ID=29TEST&PASS=TEST");
            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
            con.setRequestMethod("GET");
            in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

	/*
	구연동 전자(세금)계산서 상태변경
	*/
    @RequestMapping(value = "/smartbillOld/smartbillOldChange", method = RequestMethod.POST)
    public String smartbillOldChange(@RequestParam("statusChange") String statuschange,
                                     @RequestParam("conversationId") String conversationid, SmartbillOldVO smartbillOldVO) throws Exception{
        BufferedReader in = null;
        String signal = null;
        smartbillOldVO.setConversationId(conversationid);

        if("수신승인".equals(statuschange)){
            smartbillOldVO.setDtiStatus("C");
            signal = "APPROVE";
        } else if("수신거부".equals(statuschange)){
            smartbillOldVO.setDtiStatus("R");
            signal = "RIREJECT";
        } else if("역매입요청취소".equals(statuschange)) {
            smartbillOldVO.setDtiStatus("W");
            signal = "CANCELRREQUEST";
        } else if("역매출수신거부".equals(statuschange)){
            smartbillOldVO.setDtiStatus("T");
            signal = "RIREJECT";
        } else if("역매출발행취소".equals(statuschange)){
            smartbillOldVO.setDtiStatus("O");
            signal = "CANCELALL";
        } else if("역매출수신승인".equals(statuschange)){
            smartbillOldVO.setDtiStatus("C");
            signal = "APPROVE";
        } else if("세금계산서발행취소".equals(statuschange)){
            smartbillOldVO.setDtiStatus("O");
            signal = "CANCELALL";
        } else if("역매출발행".equals(statuschange)){
            smartbillOldVO.setDtiStatus("V");
        }

        service.statusChange(smartbillOldVO);

        // 세금계산서 상태변경 호출
            try {

                if (smartbillOldVO.getDtiStatus().equals("V")){
                    URL obj = new URL("http://127.0.0.1:10001/CALLSB_V3/XXSB_DTI_RARISSUE.ASP?BATCH_ID=" + smartbillOldVO.getTxtBatchId() + "&ID=29TEST&PASS=TEST");
                    HttpURLConnection con = (HttpURLConnection)obj.openConnection();
                    con.setRequestMethod("GET");
                    in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                } else {
                    URL obj = new URL("http://127.0.0.1:10001/CALLSB_V3/XXSB_DTI_STATUS_CHANGE.ASP?BATCH_ID=" + smartbillOldVO.getTxtBatchId() + "&ID=29TEST&PASS=TEST&STATUS=" + smartbillOldVO.getDtiStatus() + "&SIGNAL=" + signal);
                    HttpURLConnection con = (HttpURLConnection)obj.openConnection();
                    con.setRequestMethod("GET");
                    in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        return "redirect:/";
    }

    /*
	구연동 전자(세금)계산서 인증서 등록
	*/
	@RequestMapping(value="/smartbillOld/smartbillOldCert", method = RequestMethod.GET)
	public String smartbillOldCertList(SmartbillOldCertVO smartbillOldCertVO, Model model) throws Exception {

		List<SmartbillOldCertVO> certList = service.certList(smartbillOldCertVO);
        logger.info("################## getCertRegno ###### : " + certList.get(0).getCertRegno());
        logger.info("################## getCertComName ###### : " + certList.get(0).getCertComName());
        logger.info("################## getUserDn ###### : " + certList.get(0).getUserDn());
		logger.info("################## getExpirationDate ###### : " + certList.get(0).getExpirationDate());

		model.addAttribute("certList", certList);

		return "/smartbillOld/smartbillOldCert";
	}



}
