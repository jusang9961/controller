package com.board.controller;

import com.board.domain.SmartbillApiHanwha2VO;
import com.board.domain.SmartbillApiHanwhaVO;
import com.board.service.OpenApiAescryptoService;
import com.board.service.SmartbillApiHanwhaService;
import org.json.JSONObject;
import org.slf4j.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/smartbillOpenApi/*")

public class SmartbillOpenApiController {

    public static final Logger logger = LoggerFactory.getLogger(SmartbillOpenApiController.class);

    @Inject
    OpenApiAescryptoService Aescrypt;

    @Inject
    SmartbillApiHanwhaService service;

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
     * Hanwha
     */

    @RequestMapping(value = "/smartbillOpenApiHanwhaArApRepo", method = RequestMethod.GET)
    public String SmartbillOpenApiHanwhaArApRepo() {

        return "smartbillOpenApi/smartbillOpenApiHanwhaArApRepo";
    }

    @RequestMapping(value = "/smartbillOpenApiHanwha", method = RequestMethod.GET)
    @ResponseBody
    public void SmartbillOpenApiHanwha(@RequestParam("hanwhaEtcPcsNo") String hanwhaEtcPcsNo,
                                         @RequestParam("hanwhaIssueId") String hanwhaIssueId,
                                         @RequestParam("hanwhaSupComRegno") String hanwhaSupComRegno,
                                         @RequestParam("hanwhaDirection") String hanwhaDirection,
                                         @RequestParam("hanwhaDtiStatus") String hanwhaDtiStatus) throws Exception {

        logger.info("################### Controller String set ######################");
        SmartbillApiHanwhaVO smartbillApiHanwhaVO = new SmartbillApiHanwhaVO();

        smartbillApiHanwhaVO.setHanwhaEtcPcsNo(hanwhaEtcPcsNo);
        smartbillApiHanwhaVO.setHanwhaIssueId(hanwhaIssueId);
        smartbillApiHanwhaVO.setHanwhaSupComRegno(hanwhaSupComRegno);
        smartbillApiHanwhaVO.setHanwhaDtiStatus(hanwhaDtiStatus);

        if(hanwhaDirection.equals("정")) {
            smartbillApiHanwhaVO.setHanwhaDirection("2");
        } else if(hanwhaDirection.equals("역")) {
            smartbillApiHanwhaVO.setHanwhaDirection("1");
        } else {
            smartbillApiHanwhaVO.setHanwhaDirection("0");
        }
        service.SmartbillApiHanwhaRepo(smartbillApiHanwhaVO);
    }

    @RequestMapping(value = "/smartbillOpenApiHanwhaArApRepoStatus", method = RequestMethod.GET)
    @ResponseBody
    public String SmartbillOpenApiHanwhaList(Model model) throws Exception {

        logger.info("################### Controller String set ######################");
        SmartbillApiHanwhaVO smartbillApiHanwhaVO = new SmartbillApiHanwhaVO();

        List<SmartbillApiHanwhaVO> ArApRepoList = service.SmartbillApiHanwhaRepoSelectList();

        JSONObject obj = new JSONObject();
        obj.put("test", ArApRepoList);

        return obj.toString();
    }

    @RequestMapping(value = "/smartbillOpenApiViewXml", method = RequestMethod.GET)
    public String SmartbillOpenApiViewXml() throws Exception{

        return "smartbillOpenApi/smartbillOpenApiViewXml";
    }

    @RequestMapping(value = "/smartbillApiHanwhaStatusResult", method = RequestMethod.GET)
    @ResponseBody
    public String SmartbillApiHanwhaStatusResult(@RequestParam("hanwhaEtcPcsNo") String hanwhaEtcPcsNo,
                                                 @RequestParam("smartbillResultCode") String smartbillResultCode) throws Exception {

        SmartbillApiHanwhaVO smartbillApiHanwhaVO = new SmartbillApiHanwhaVO();
        smartbillApiHanwhaVO.setHanwhaEtcPcsNo(hanwhaEtcPcsNo);
        smartbillApiHanwhaVO.setSmartbillResultCode(smartbillResultCode);

        service.SmartbillApiHanwhaStatusResult(smartbillApiHanwhaVO);

        return "SECUESS";
    }

    @RequestMapping(value = "/smartbillOpenApiHanwhaWebHook", method = RequestMethod.POST)
    @ResponseBody
    public String SmartbillOpenApiHanwhaWebHook(HttpServletRequest webhook
            /*@RequestParam("MESSAGEID") String MESSAGEID,
                                              @RequestParam("REQUESTTIME") String REQUESTTIME,
                                              @RequestParam("DTI_WDAY") String DTI_WDAY,
                                              @RequestParam("SIGNAL_TYPE") String SIGNAL_TYPE,
                                              @RequestParam("DTI_STATUS") String DTI_STATUS,
                                              @RequestParam("CHANGE_DTI_STATUS_DATE") String CHANGE_DTI_STATUS_DATE,
                                              @RequestParam("NTS_SEND_STATUS") String NTS_SEND_STATUS,
                                              @RequestParam("NTS_RESULT_CODE") String NTS_RESULT_CODE,
                                              @RequestParam("NTS_SEND_DATE") String NTS_SEND_DATE,
                                              @RequestParam("ETC_PCS_NO") String ETC_PCS_NO,
                                              @RequestParam("ISSUE_ID") String ISSUE_ID,
                                              @RequestParam("SUP_COM_REGNO") String SUP_COM_REGNO,
                                              @RequestParam("BYR_COM_REGNO") String BYR_COM_REGNO,
                                              @RequestParam("BRK_COM_REGNO") String BRK_COM_REGNO,
                                              @RequestParam("RCV_COM_REGNO") String RCV_COM_REGNO,
                                              @RequestParam("RETRY_CNT") String RETRY_CNT*/
    ) throws Exception {

        logger.info("################### Hanwha WebHook Controller String set ######################");

        System.out.println(readBody(webhook));
        String MESSAGEID = webhook.getParameter("MESSAGEID");

        logger.info("MESSAGEID : " + MESSAGEID);

        return "success";
    }

    public static String readBody(HttpServletRequest request) throws IOException {
        BufferedReader input = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder builder = new StringBuilder();
        String buffer;
        while ((buffer = input.readLine()) != null) {
            if (builder.length() > 0) {
                builder.append("\n");
            }
            builder.append(buffer);
        }
        return builder.toString();
    }

    @RequestMapping(value = "/smartbillOpenApiHanwhaWebHook2")
    @ResponseBody
    public String SmartbillOpenApiHanwhaWebHook2(@RequestBody SmartbillApiHanwhaVO smartbillApiHanwhaVO) {

        logger.info("################### Hanwha WebHook Controller String set ######################");

        logger.info("MESSAGEID : " + smartbillApiHanwhaVO.getMESSAGEID());
        logger.info("REQUESTTIME : " + smartbillApiHanwhaVO.getREQUESTTIME());
        logger.info("DTI_WDAY : " + smartbillApiHanwhaVO.getDTI_WDAY());
        logger.info("SIGNAL_TYPE : " + smartbillApiHanwhaVO.getSIGNAL_TYPE());
        logger.info("DTI_STATUS : " + smartbillApiHanwhaVO.getDTI_STATUS());
        logger.info("CHANGE_DTI_STATUS_DATE : " + smartbillApiHanwhaVO.getCHANGE_DTI_STATUS_DATE());
        logger.info("NTS_SEND_STATUS : " + smartbillApiHanwhaVO.getNTS_SEND_STATUS());
        logger.info("NTS_RESULT_CODE : " + smartbillApiHanwhaVO.getNTS_RESULT_CODE());
        logger.info("NTS_SEND_DATE : " + smartbillApiHanwhaVO.getNTS_SEND_DATE());
        logger.info("ETC_PCS_NO : " + smartbillApiHanwhaVO.getETC_PCS_NO());
        logger.info("ISSUE_ID : " + smartbillApiHanwhaVO.getISSUE_ID());
        logger.info("SUP_COM_REGNO : " + smartbillApiHanwhaVO.getSUP_COM_REGNO());
        logger.info("BYR_COM_REGNO : " + smartbillApiHanwhaVO.getBYR_COM_REGNO());
        logger.info("BRK_COM_REGNO : " + smartbillApiHanwhaVO.getBRK_COM_REGNO());
        logger.info("RCV_COM_REGNO : " + smartbillApiHanwhaVO.getRCV_COM_REGNO());
        logger.info("RETRY_CNT : " + smartbillApiHanwhaVO.getRETRY_CNT());

        return "success";
    }

    @RequestMapping(value = "/smartbillOpenApiHanwhaWebHook3", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String SmartbillOpenApiHanwhaWebHook3(@RequestBody HashMap<String, Object> json) throws Exception {

        logger.info("################### Hanwha WebHook Controller String set ######################");

        System.out.println(json);
        Map map = (Map)json.get(json);
        System.out.println(map);
        //String MESSAGEID = (String)map.get("MESSAGEID");

        //logger.info("MESSAGEID : " + MESSAGEID);

        return "success";
    }
}
