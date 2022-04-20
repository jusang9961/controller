package com.board.controller;

import com.board.domain.SmartbillNewVO;
import com.board.service.SmartbillNewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/smartbillNew/*")

public class SmartbillNewController {

    private static final Logger logger = LoggerFactory.getLogger(SmartbillNewController.class);

    @Inject
    SmartbillNewService service_new;

    /*
     * 세금계산서 정발행
     */
    @RequestMapping(value = "/smartbillNewArissue", method = RequestMethod.GET)
    public String SmartbillNew(){
        return "/smartbillNew/smartbillNewArissue";
    }

    @RequestMapping(value = "/smartbillNewArissuePost", method = RequestMethod.POST)
    public String smartbillNewArissuePost(SmartbillNewVO smartbillNewVO) throws Exception{

        // 작성일자의 특수문자 제거
        String wdate = smartbillNewVO.getTxtDate().replaceAll("[^0-9]", "");

        service_new.arissue(smartbillNewVO);

        return "redirect:/";
    }

    /*
     * 세금계산서(거래명세서 포함) 발행
     */

    @RequestMapping(value = "/smartbillNewArissueDtt", method = RequestMethod.GET)
    public String SmartbillNewArissueDtt(){
        return "/smartbillNew/smartbillNewArissueDtt";
    }

    @RequestMapping(value = "/smartbillNewArissueDttPost", method = RequestMethod.POST)
    public String smartbillNewArissueDttPost(SmartbillNewVO smartbillNewVO) throws Exception{

        // 작성일자의 특수문자 제거
        String wdate = smartbillNewVO.getTxtDate().replaceAll("[^0-9]", "");

        service_new.arissueDtt(smartbillNewVO);

        return "redirect:/";

    }

    /*
     * 세금계산서 역매입 요청
     */
    @RequestMapping(value = "/smartbillNewIssue", method = RequestMethod.GET)
    public String SmartbillNewIssue(){
        return "/smartbillNew/smartbillNewIssue";
    }

    @RequestMapping(value = "/smartbillNewIssuePost", method = RequestMethod.POST)
    public String smartbillNewIssuePost(SmartbillNewVO smartbillNewVO) throws Exception{

        // 작성일자의 특수문자 제거
        String wdate = smartbillNewVO.getTxtDate().replaceAll("[^0-9]", "");

        service_new.issue(smartbillNewVO);

        return "redirect:/";
    }

    /*
     * 세금계산서 역매입 요청(거래명세서 포함)
     */
    @RequestMapping(value = "/smartbillNewIssueDtt", method = RequestMethod.GET)
    public String SmartbillNewIssueDtt(){
        return "smartbillNew/smartbillNewIssueDtt";
    }

    @RequestMapping(value = "/smartbillNewIssueDttPost", method = RequestMethod.POST)
    public String smartbillNewIssueDttPost(SmartbillNewVO smartbillNewVO) throws Exception{

        // 작성일자의 특수문자 제거
        String wdate = smartbillNewVO.getTxtDate().replaceAll("[^0-9]", "");

        service_new.issueDtt(smartbillNewVO);

        return "redirect:/";
    }

    /*
     * 세금계산서 Xml Upload
     */
    @RequestMapping(value = "/smartbillNewXmlUpload", method = RequestMethod.GET)
    public String SmartbillNewXmlUpload(){
        return "smartbillNew/smartbillNewXmlUpload";
    }

    /*
     * 인증서 등록
     */
    @RequestMapping(value = "/smartbillNewCert", method = RequestMethod.GET)
    public String SmartbillNewCert(){
        return "smartbillNew/smartbillNewCert";
    }

    /*
     * SBMS Admin 호출
     */
    @RequestMapping(value = "/smartbillNewMonitor", method = RequestMethod.GET)
    public void SmartbillNewMonitor(HttpServletResponse httpServletResponse) throws IOException {
        httpServletResponse.sendRedirect("http://localhost:30000/dti");
        //return "redirect:http://localhost:30000/dti";
    }

    /*
     * 매출 보관함(리스트) 조회
     */
    @RequestMapping(value="/smartbillNewArList", method = RequestMethod.GET)
    public String SmartbillNewArList(SmartbillNewVO smartbillNewVO, Model model) throws Exception {

        logger.info("#################################### 리스트조회 시작 #########################");
        smartbillNewVO.setTxtSupbuy_type("AR");

        List<SmartbillNewVO> ArList = service_new.ArList(smartbillNewVO);
        //logger.info("##################################################" + ArList.get(0).getReturnCode());
        //logger.info("##################################################" + ArList.get(0).getConversationId());

        model.addAttribute("list", ArList);

        return "/smartbillNew/smartbillNewArList";
    }

    /*
     * 매입 보관함(리스트) 조회
     */
    @RequestMapping(value="/smartbillNewApList", method = RequestMethod.GET)
    public String SmartbillNewApList(SmartbillNewVO smartbillNewVO, Model model) throws Exception {

        logger.info("#################################### 리스트조회 시작 #########################");
        smartbillNewVO.setTxtSupbuy_type("AP");

        List<SmartbillNewVO> ArList = service_new.ArList(smartbillNewVO);
        model.addAttribute("list", ArList);

        return "smartbillNew/smartbillNewApList";
    }

    /*
     * ajax 테스트
     */
    @RequestMapping(value="/ajaxTest", method = RequestMethod.POST)
    @ResponseBody
    public String ajaxTest(SmartbillNewVO smartbillNewVO, Model model) throws Exception{

        smartbillNewVO.setTxtSupbuy_type("AP");

        List<SmartbillNewVO> ArList = service_new.ArList(smartbillNewVO);
        logger.info("##################List mapper 조회 후###################");

        model.addAttribute("list", ArList);
        logger.info("#####################################" + smartbillNewVO.getDtiStatus());
        //logger.info("##################################################" + ArList.get(0).getReturnCode());
        //logger.info("##################################################" + ArList.get(0).getConversationId());

        return smartbillNewVO.getConversationId() + smartbillNewVO.getIssueId();
        //return  null;
    }

    /*
     * 전자(세금)계산서 view 호출
     */
    @RequestMapping(value="/smartbillNew/smartbillNewview", method = RequestMethod.GET)
    public void smartbillNewview(@RequestParam("conversationId") String conversationid, @RequestParam("supbuytype") String supbuy_type, Model model) throws Exception {

        //SmartbillNewVO smartbillNewVO = service_new.view(conversationid, supbuy_type);

        List<SmartbillNewVO> view = service_new.view(conversationid, supbuy_type);
        List<SmartbillNewVO> viewStatus = service_new.viewStatus(conversationid, supbuy_type);

        model.addAttribute("view", view);
        model.addAttribute("viewStatus", viewStatus);

        //logger.info("##################################################" + view.get(0).getTxtSupComRegNo());
    }

}
