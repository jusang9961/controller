package com.board.controller;

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

    @RequestMapping(value = "/smartbillNewArissue", method = RequestMethod.GET)
    public String viewsSmartbillNew(){
        return "/smartbillNew/smartbillNewArissue";
    }

}
