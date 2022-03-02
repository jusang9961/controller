package com.board.controller;

import com.board.domain.SmartbillNewVO;
import com.board.service.SmartbillNewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

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
    public String viewsSmartbillNew(){
        return "/smartbillNew/smartbillNewArissue";
    }

    @RequestMapping(value = "/smartbillNewArissuePost", method = RequestMethod.POST)
    public String smartbillNewArissuePost(SmartbillNewVO smartbillNewVO) throws Exception{

        // 작성일자의 특수문자 제거
        String wdate = smartbillNewVO.getTxtDate().replaceAll("[^0-9]", "");

        logger.info(wdate);
        logger.info(smartbillNewVO.getTxtDate());

        service_new.arissue(smartbillNewVO);

        return "redirect:/";
    }

}
