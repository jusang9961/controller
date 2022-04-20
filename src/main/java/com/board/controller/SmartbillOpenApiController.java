package com.board.controller;

import org.slf4j.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/smartbillOpenApi/*")

public class SmartbillOpenApiController {

    public static final Logger logger = LoggerFactory.getLogger(SmartbillOpenApiController.class);

    @RequestMapping(value = "/smartbillOpenApiArissue", method = RequestMethod.GET)
    public String SmartbillOpenApiArissue() {

        return "smartbillOpenApi/smartbillOpenApiArissue";
    }

    @RequestMapping(value = "/smartbillOpenApiSave", method = RequestMethod.GET)
    public String SmartbillOpenApiSave() {

        return "smartbillOpenApi/smartbillOpenApiSave";
    }

    @RequestMapping(value = "/smartbillOpenApiReceive", method = RequestMethod.GET)
    public String SmartbillOpenApiReceive() {

        return "smartbillOpenApi/smartbillOpenApiReceive";
    }

    @RequestMapping(value = "/smartbillOpenApiArissueDtt", method = RequestMethod.GET)
    public String SmartbillOpenApiArissueDtt() {

        return "smartbillOpenApi/smartbillOpenApiArissueDtt";
    }

    @RequestMapping(value = "/smartbillOpenApiAescrypto", method = RequestMethod.GET)
    public String SmartbillOpenApiAescrypto() {

        return "smartbillOpenApi/smartbillOpenApiAescrypto";
    }

}
