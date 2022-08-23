package com.board.controller;

import com.board.service.OpenApiAescryptoService;
import org.slf4j.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

@Controller
@RequestMapping("/smartbillOpenApi/*")

public class SmartbillOpenApiController {

    public static final Logger logger = LoggerFactory.getLogger(SmartbillOpenApiController.class);

    @Inject
    OpenApiAescryptoService Aescrypt;

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

    /*
     * 인증서 패스워드 암호화
     */
    @RequestMapping(value = "/smartbillOpenApiAescryptoAction", method = RequestMethod.GET)
    @ResponseBody
    public String SmartbillOpenApiAescryptoAction(@RequestParam("txtPassword") String txtPassword) throws Exception{

        String Encrypt = Aescrypt.Aescrypto(txtPassword);

        //logger.info(Encrypt);

        return Encrypt;
        //return "smartbillOpenApi/smartbillOpenApiAescrypto";
    }

    /*
     * xml 원본 조회(View_Xml)
     */
    @RequestMapping(value = "/smartbillOpenApiViewXml", method = RequestMethod.GET)
    public String SmartbillOpenApiViewXml() throws Exception{

        return "smartbillOpenApi/smartbillOpenApiViewXml";
    }



}
