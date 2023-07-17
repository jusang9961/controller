package com.board.controller;

import com.board.domain.SmartbillApiHanwhaVO;
import com.board.domain.SmartbillApiVO;
import com.board.service.OpenApiAescryptoService;
import com.board.service.SmartbillApiHanwhaService;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @RequestMapping(value = "/smartbillOpenApiDeliverySend", method = RequestMethod.GET)
    public String SmartbillOpenApiDeliverySend() {

        return "smartbillOpenApi/smartbillOpenApiDeliverySend";
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

    //첨부파일 전송
    @RequestMapping(value = "/smartbillOpenApiDeliverySendAction", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseBody
    public SmartbillApiVO smartbillOpenApiDeliverySendAction(@RequestPart("DeliveryFile") MultipartFile DeliveryFile,
                                                             @RequestParam("conversationId") String conversationId){

        SmartbillApiVO smartbillApiVO = new SmartbillApiVO();
        String resultMessage = "";

        if(!DeliveryFile.isEmpty()) {

            String host_url = "https://demoattachapi.smartbill.co.kr/sb-api/AttachFile/";

            // 형식 지정
            // 형식에 맞게 변환
            Date currentTime = new Date();

            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String formattedTime = formatter.format(currentTime);

            try {

                String fileName = DeliveryFile.getOriginalFilename();

                byte[] fileBytes = Base64.encodeBase64(DeliveryFile.getBytes());
                String fileencodeString = new String(fileBytes);

                String conversationIdArray[] = {conversationId};
                String fileencodeStringArray[] = {fileencodeString};

                // Json 객체 생성
                JSONObject jsonObject = new JSONObject();

                jsonObject.put("MessageId", conversationId); // 메시지 ID
                jsonObject.put("RequestTime", formattedTime); // 전송 시간(yyyyMMddHHmmss)
                jsonObject.put("Signal", "ATTACHFILEUPLOAD"); // 요청 시그널
                jsonObject.put("AuthToken", "d2ZDWFREa2RWRHpuSkpZV2toYXdyUVpSSmM3S3doNjJoZVM0K2RqTlF4VT0K"); // 토큰
                jsonObject.put("SendComRegno", "0000000029"); // 전송 사업자번호
                jsonObject.put("ServiceCode", "DTI");
                jsonObject.put("SystemType", "OAPI");
                jsonObject.put("ConversationId", conversationIdArray);
                jsonObject.put("FileName", fileName); // 파일 명
                jsonObject.put("MsgDoc", fileencodeStringArray); // 파일바이너리 Base64

                logger.info("jsonObject : " + jsonObject);

                try {

                    URL url = new URL(host_url);
                    HttpURLConnection connection = (HttpURLConnection)url.openConnection();

                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("Content-Type","application/json;charset=utf-8");
                    connection.setRequestProperty("Accept", "application/json");
                    connection.setConnectTimeout(10000);

                    // Json 전송
                    connection.setDoOutput(true);
                    DataOutputStream out = new DataOutputStream(connection.getOutputStream());
                    //BufferedWriter out = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));

                    out.write(jsonObject.toString().getBytes());
                    out.flush();
                    out.close();

                    // Json 전송 결과 수신
                    if(null != connection) {

                        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

                        String line = "";
                        String response = "";

                        while ((line = in.readLine()) != null) {
                            response += line + "\n";
                        }

                        try {
                            JSONObject jsonResponse = new JSONObject(response);

                            //JSONArray jsonArrayResonse = jsonObject.getJSONArray("ConversationId");
                            if ("30000".equalsIgnoreCase(jsonResponse.getString("ResultCode"))) {
                                logger.info("ResultCode : " + jsonResponse.getString(("ResultCode")));
                                logger.info("ResultMessage : " + jsonResponse.getString(("ResultMessage")));
                                smartbillApiVO.setResultCode(jsonResponse.getString(("ResultCode")));
                                smartbillApiVO.setResultMessage(jsonResponse.getString(("ResultMessage")));

                            } else {
                                logger.info("ResultCode : " + jsonResponse.getString(("ResultCode")));
                                logger.info("ResultMessage : " + jsonResponse.getString(("ResultMessage")));
                                smartbillApiVO.setResultCode(jsonResponse.getString(("ResultCode")));
                                smartbillApiVO.setResultMessage(jsonResponse.getString(("ResultMessage")));

                            }

                        } catch (Exception ee) {
                            ee.printStackTrace();
                        }

                    }
                    } catch (IOException conn){
                        conn.printStackTrace();
                    }

                } catch (IOException e){
                    e.printStackTrace();
                }
            }
        return smartbillApiVO;
    }

}
