package com.board.controller;

import com.board.domain.SmartbillNewVO;
import com.board.service.SmartbillNewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
     * 보관함(리스트) 조회
     */
    @RequestMapping(value="/smartbillNewList", method = RequestMethod.GET)
    public String SmartbillNewList(SmartbillNewVO smartbillNewVO, Model model) throws Exception {

        logger.info("#################################### 리스트조회 시작 #########################");

        List<SmartbillNewVO> list = service_new.list(smartbillNewVO);
        logger.info("##################################################" + list.get(0).getReturnCode());
        logger.info("##################################################" + list.get(0).getConversationId());

        model.addAttribute("list", list);

        return "/smartbillNew/smartbillNewList";
    }

}
