
//OpenAPI 매출 발행
function ARISSUE(){

    var oapiissue = document.getElementById("oapiissue").value;	//signal 가져오기

    var _today = new Date();
    var now = _today.format('yyyyMMddhhmmss');
    let conId = getRandomId(4);
    let issueId = getRandomId(5);
//	console.log(conId);
//	console.log(issueId);

    //공급자 정보
    //var SUP_COM_REGNO = $('#SUP_COM_REGNO').val(); // 스프링 형식
    var TxtSupComRegNo = document.getElementById("txtSupComRegNo").value; //공급자 사업자번호
    var TxtSupComName = document.getElementById("txtSupComName").value;	//공급자 상호명
    var TxtSupBizType = document.getElementById("txtSupBizType").value;	//공급자 업태
    var TxtSupClassify = document.getElementById("txtSupClassify").value;	//공급자 업종
    var TxtSupComRepName = document.getElementById("txtSupComRepName").value;	//공급자 대표자명
    var TxtSupDeptPerson = document.getElementById("txtSupDeptPerson").value; //공급자 담당자명
    var TxtSupDeptTel = document.getElementById("txtSupDeptTel").value;	//담당자 연락처
    var TxtSupDeptEmail = document.getElementById("txtSupDeptEmail").value;	//담당자 이메일
    var TxtSupComAddr = document.getElementById("txtSupComAddr").value;	//공급자 주소

    //공급받는자 정보
    var TxtByrComRegNo = document.getElementById("txtByrComRegNo").value; //공급받는자 사업자번호
    var TxtByrComName = document.getElementById("txtByrComName").value;	//공급받는자 상호명
    var TxtByrBizType = document.getElementById("txtByrBizType").value;	//공급받는자 업태
    var TxtByrClassify = document.getElementById("txtByrClassify").value;	//공급받는자 업종
    var TxtByrComRepName = document.getElementById("txtByrComRepName").value;	//공급받는자 대표자명
    var TxtByrDeptPerson = document.getElementById("txtByrDeptPerson").value;	//공급받는자 담당자명
    var TxtByrDeptTel = document.getElementById("txtByrDeptTel").value;	//담당자 연락처
    var TxtByrDeptEmail = document.getElementById("txtByrDeptEmail").value;	//담당자 이메일
    var TxtByrComAddr = document.getElementById("txtByrComAddr").value;	//공급자 주소

    //품목정보
    var TxtTotalAmount = document.getElementById("txtTotalAmount").value;
    var TxtSupAmount = document.getElementById("txtSupAmount").value;
    var TxtTaxAmount = document.getElementById("txtTaxAmount").value;
    var Bigo = document.getElementById("Bigo").value;

    // 세금계산서 정보
    var DTI_WDATE = document.getElementById("txtDtiWdate").value;	//기입된 작성일자(yyyyMMdd)
    var Sbcode = "41000008";
    var ISSUEID = DTI_WDATE+Sbcode+"uwt"+issueId;
    var ConversationId = TxtSupComRegNo+TxtByrComRegNo+DTI_WDATE+conId+"031";
    //var String[] ConversationId = {"11111111191018510695000016192008000", "12312123001018510695000016192011000"};

    var dtixml=''
        + '<?xml version="1.0" encoding="UTF-8"?>'
        + '<TaxInvoice xsi:schemaLocation="urn:kr:or:kec:standard:Tax:ReusableAggregateBusinessInformationEntitySchemaModule:1:0 http://www.kec.or.kr/standard/Tax/TaxInvoiceSchemaModule_1.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:kr:or:kec:standard:Tax:ReusableAggregateBusinessInformationEntitySchemaModule:1:0">'
        + '<ExchangedDocument>'
        + '<IssueDateTime>'//발행일(현재시각/yyyyMMddhhmmss)
        + now
        + '</IssueDateTime>'
        //+'<ReferencedDocument>'
        //+'<ID>2006300340 </ID>'
        //+'</ReferencedDocument>'
        + '</ExchangedDocument>'
        + '<TaxInvoiceDocument>'
        + '<IssueID>'
        + ISSUEID
        + '</IssueID>'
        //console.log(dtixml)
        + '<TypeCode>'
        + '0101'
        + '</TypeCode>'
        + '<DescriptionText/>'
        + '<IssueDateTime>'
        + DTI_WDATE
        + '</IssueDateTime>'
        + '<PurposeCode>'
        + '02'
        + '</PurposeCode>'
        + '</TaxInvoiceDocument>'

        //공급자 정보
        + '<TaxInvoiceTradeSettlement>'
        + '<InvoicerParty>'
        + '<ID>'
        + TxtSupComRegNo
        + '</ID>'
        + '<TypeCode>'
        + TxtSupBizType	//공급자 업태
        + '</TypeCode>'
        + '<NameText>'
        + TxtSupComName	//공급자 상호명
        + '</NameText>'
        + '<ClassificationCode>'
        + TxtSupClassify	//업종
        + '</ClassificationCode>'
        + '<SpecifiedPerson>'
        + '<NameText>'
        + TxtSupComRepName	//대표자 성명
        + '</NameText>'
        + '</SpecifiedPerson>'
        + '<DefinedContact>'
        + '<DepartmentNameText/>'
        + '<PersonNameText/>'
        + '<TelephoneCommunication/>'
        + '<URICommunication>'
        + TxtSupDeptEmail	//공급자 이메일
        + '</URICommunication>'
        + '</DefinedContact>'
        + '<SpecifiedAddress>'
        + '<LineOneText>'
        //+ TxtSupComAddr	//공급자 사업장 주소
        + '주소 테스트'
        + '</LineOneText>'
        + '</SpecifiedAddress>'
        + '</InvoicerParty>'

        //	공급받는자 정보
        + '<InvoiceeParty>'
        + '<ID>'
        + TxtByrComRegNo
        + '</ID>'
        + '<TypeCode>'
        + TxtByrBizType	//업태
        + '</TypeCode>'
        + '<NameText>'
        + TxtByrComRepName	//공급받는자 상호명
        + '</NameText>'
        + '<ClassificationCode>'
        + TxtByrClassify	//공급받는자 종목
        + '</ClassificationCode>'
        + '<SpecifiedOrganization>'
        + '<BusinessTypeCode>'
        + '01'
        + '</BusinessTypeCode>'
        + '</SpecifiedOrganization>'
        + '<SpecifiedPerson>'
        + '<NameText>'
        + TxtByrComRepName	//공급받는자 대표자 성명
        + '</NameText>'
        + '</SpecifiedPerson>'
        + '<PrimaryDefinedContact>'
        + '<DepartmentNameText/>'
        + '<PersonNameText/>'
        + '<TelephoneCommunication>'
        + '010-1234-1234'//공급받는자 연락처
        + '</TelephoneCommunication>'
        + '<URICommunication>'
        + 'aaa@bbb.com' // 공급받는자 이메일
        + '</URICommunication>'
        + '</PrimaryDefinedContact>'
        +'<SecondaryDefinedContact>'
        + '<PersonNameText>'
        + '공급받는자2'  // 공급받는자2 담당자
        + '</PersonNameText>'
        + '<URICommunication>'
        + 'aaa@bbb.com'  // 공급받는자2 이메일
        + '</URICommunication>'
        +'</SecondaryDefinedContact>'
        + '<SpecifiedAddress>'
        + '<LineOneText>'
        + TxtByrComAddr	//공급받는자 사업장 주소
        + '</LineOneText>'
        + '</SpecifiedAddress>'
        + '</InvoiceeParty>'

        //세금계산서 품목 정보
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '10'	//현금
        + '</TypeCode>'
        + '<PaidAmount>'
        + TxtTotalAmount
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '20'	//수표
        + '</TypeCode>'
        + '<PaidAmount>'
        + '0'
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '30'	//어음
        + '</TypeCode>'
        + '<PaidAmount>'
        + '0'
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '40'	//외상미수금
        + '</TypeCode>'
        + '<PaidAmount>'
        + '0'
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedMonetarySummation>'
        + '<ChargeTotalAmount>'
        + TxtSupAmount	// 공급가액
        + '</ChargeTotalAmount>'
        + '<TaxTotalAmount>'
        + TxtTaxAmount	// 세액
        + '</TaxTotalAmount>'
        + '<GrandTotalAmount>'
        + TxtTotalAmount	//	합계금액
        + '</GrandTotalAmount>'
        + '</SpecifiedMonetarySummation>'
        + '</TaxInvoiceTradeSettlement>'

        // ITEM 품목 정보
        + '<TaxInvoiceTradeLineItem>'
        + 	'<SequenceNumeric>'	//일련번호
        + 		'1'
        + 	'</SequenceNumeric>'
        + 	'<DescriptionText/>'
        + 	'<InvoiceAmount>'	//아이템 공급가액
        + 		TxtSupAmount
        + 	'</InvoiceAmount>'
        + 	'<ChargeableUnitQuantity>' //테그 삭제시 오류 없으나, '' 처리시 오류 확인됨..
        + 		'1.000'
        + 	'</ChargeableUnitQuantity>'
        + 	'<InformationText/>'
        + 	'<NameText>'
        + 		'test'
        + 	'</NameText>'
        + 	'<PurchaseExpiryDateTime>'
        + 		DTI_WDATE
        + 	'</PurchaseExpiryDateTime>'
        + 	'<TotalTax>'
        + 		'<CalculatedAmount>'
        + 			TxtTaxAmount
        + 		'</CalculatedAmount>'
        + 	'</TotalTax>'
        + 	'<UnitPrice>'
        + 	'<UnitAmount>'//테그 삭제시 오류 없으나, '' 처리시 오류 확인됨..
        + 		'1'	//단가(공란시오류...?)
        + 	'</UnitAmount>'
        + 	'</UnitPrice>'
        + '</TaxInvoiceTradeLineItem>'
        + '</TaxInvoice>'


    var Undtixml=''
        + '<?xml version="1.0" encoding="UTF-8"?>'
        + '<TaxInvoice xsi:schemaLocation="urn:kr:or:kec:standard:Tax:ReusableAggregateBusinessInformationEntitySchemaModule:1:0 http://www.kec.or.kr/standard/Tax/TaxInvoiceSchemaModule_1.0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:kr:or:kec:standard:Tax:ReusableAggregateBusinessInformationEntitySchemaModule:1:0">'
        + '<ExchangedDocument>'
        + '<IssueDateTime>'//발행일(현재시각/yyyyMMddhhmmss)
        + now
        + '</IssueDateTime>'
        //+'<ReferencedDocument>'
        //+'<ID>2006300340 </ID>'
        //+'</ReferencedDocument>'
        + '</ExchangedDocument>'
        + '<TaxInvoiceDocument>'
        + '<IssueID>'
        + ISSUEID
        + '</IssueID>'
        + '<TypeCode>'
        + '0101'
        + '</TypeCode>'
        + '<DescriptionText/>'
        + '<IssueDateTime>'
        + DTI_WDATE
        + '</IssueDateTime>'
        + '<PurposeCode>'
        + '02'
        + '</PurposeCode>'
        + '</TaxInvoiceDocument>'

        //공급자 정보
        + '<TaxInvoiceTradeSettlement>'
        + '<InvoicerParty>'
        + '<ID>'
        + TxtSupComRegNo
        + '</ID>'
        + '<TypeCode>'
        + TxtSupBizType	//공급자 업태
        + '</TypeCode>'
        + '<NameText>'
        + TxtSupComName	//공급자 상호명
        + '</NameText>'
        + '<ClassificationCode>'
        + TxtSupClassify	//업종
        + '</ClassificationCode>'
        + '<SpecifiedPerson>'
        + '<NameText>'
        + TxtSupComRepName	//대표자 성명
        + '</NameText>'
        + '</SpecifiedPerson>'
        + '<DefinedContact>'
        //공급자 담당자 정보
        + '<DepartmentNameText/>'
        + '<PersonNameText>'
        + TxtSupDeptPerson	//공급자 성명
        + '</PersonNameText>'
        + '<TelephoneCommunication>'
        + TxtSupDeptTel	//공급자 번호
        + '</TelephoneCommunication>'
        + '<URICommunication>'
        + TxtSupDeptEmail	//공급자 이메일
        + '</URICommunication>'
        + '</DefinedContact>'
        + '<SpecifiedAddress>'
        + '<LineOneText>'
        + TxtSupComAddr	//공급자 사업장 주소
        + '</LineOneText>'
        + '</SpecifiedAddress>'
        + '</InvoicerParty>'

        //	공급받는자 정보
        + '<InvoiceeParty>'
        + '<ID>'
        + TxtByrComRegNo
        + '</ID>'
        + '<TypeCode>'
        + TxtByrBizType	//업태
        + '</TypeCode>'
        + '<NameText>'
        + TxtByrComRepName	//공급받는자 상호명
        + '</NameText>'
        + '<ClassificationCode>'
        + TxtByrClassify	//공급받는자 종목
        + '</ClassificationCode>'
        + '<SpecifiedOrganization>'
        + '<BusinessTypeCode>'
        + '01'
        + '</BusinessTypeCode>'
        + '</SpecifiedOrganization>'
        + '<SpecifiedPerson>'
        + '<NameText>'
        + TxtByrComRepName	//공급받는자 대표자 성명
        + '</NameText>'
        + '</SpecifiedPerson>'
        + '<PrimaryDefinedContact>'
        + '<DepartmentNameText/>'
        + '<PersonNameText>'
        + TxtByrDeptPerson	//공급받는자 성명
        + '</PersonNameText>'
        + '<TelephoneCommunication>'
        + TxtByrDeptTel	//공급받는자 번호
        + '</TelephoneCommunication>'
        + '<URICommunication>'
        + TxtByrDeptEmail	//공급받는자 이메일
        + '</URICommunication>'
        + '</PrimaryDefinedContact>'
        + '<SpecifiedAddress>'
        + '<LineOneText>'
        + TxtByrComAddr	//공급받는자 사업장 주소
        + '</LineOneText>'
        + '</SpecifiedAddress>'
        + '</InvoiceeParty>'

        //세금계산서 품목 정보
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '10'	//현금
        + '</TypeCode>'
        + '<PaidAmount>'
        + TxtTotalAmount
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '20'	//수표
        + '</TypeCode>'
        + '<PaidAmount>'
        + '0'
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '30'	//어음
        + '</TypeCode>'
        + '<PaidAmount>'
        + '0'
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedPaymentMeans>'
        + '<TypeCode>'
        + '40'	//외상미수금
        + '</TypeCode>'
        + '<PaidAmount>'
        + '0'
        + '</PaidAmount>'
        + '</SpecifiedPaymentMeans>'
        + '<SpecifiedMonetarySummation>'
        + '<ChargeTotalAmount>'
        + TxtSupAmount	// 공급가액
        + '</ChargeTotalAmount>'
        + '<TaxTotalAmount>'
        + TxtTaxAmount	// 세액
        + '</TaxTotalAmount>'
        + '<GrandTotalAmount>'
        + TxtTotalAmount	//	합계금액
        + '</GrandTotalAmount>'
        + '</SpecifiedMonetarySummation>'
        + '</TaxInvoiceTradeSettlement>'

        // ITEM 품목 정보
        + '<TaxInvoiceTradeLineItem>'
        + 	'<SequenceNumeric>'	//일련번호
        + 		'1'
        + 	'</SequenceNumeric>'
        + 	'<DescriptionText>'	//비고
        + 		Bigo
        + 	'</DescriptionText>'
        + 	'<InvoiceAmount>'	//아이템 공급가액
        + 		TxtSupAmount
        + 	'</InvoiceAmount>'
        + 	'<ChargeableUnitQuantity>' //테그 삭제시 오류 없으나, '' 처리시 오류 확인됨..
        + 		'1'	//수량(공란시오류..?)
        + 	'</ChargeableUnitQuantity>'
        + 	'<InformationText>'
        + 		''	//규격
        + 	'</InformationText>'
        + 	'<NameText>'
        + 		''
        + 	'</NameText>'
        + 	'<PurchaseExpiryDateTime>'
        + 		DTI_WDATE
        + 	'</PurchaseExpiryDateTime>'
        + 	'<TotalTax>'
        + 		'<CalculatedAmount>'
        + 			TxtTaxAmount
        + 		'</CalculatedAmount>'
        + 	'</TotalTax>'
        + 	'<UnitPrice>'
        + 	'<UnitAmount>'//테그 삭제시 오류 없으나, '' 처리시 오류 확인됨..
        + 		'0.37'	//단가(공란시오류...?)
        + 	'</UnitAmount>'
        + 	'</UnitPrice>'
        + '</TaxInvoiceTradeLineItem>'
        + '</TaxInvoice>'

    if(oapiissue == "세금계산서저장"){

        var request = JSON.stringify({
            'MessageId': ConversationId,
            'Signal': 'DTI_SAVE',	//정매출
            'RequestTime': now,
            'SendComRegno': TxtSupComRegNo,
            'ReceiveComRegno': TxtByrComRegNo,
            'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',	//토큰
            'SystemType': 'OAPI',
            'ServiceCode': 'DTI',
            'ConversationId': [ConversationId],	//참조번호
            'SystemId':'',
            'UnSignedXML':Undtixml,
        });} else {

        if (oapiissue == "정매출발행"){

            var request = JSON.stringify({
                'MessageId': ConversationId,
                'Signal': 'ARISSUE',	//정매출
                'RequestTime': now,
                'SendComRegno': TxtSupComRegNo,
                'ReceiveComRegno': TxtByrComRegNo,
                'AuthToken': 'd2ZDWFREa2RWRHpuSkpZV2toYXdyUVpSSmM3S3doNjJoZVM0K2RqTlF4VT0K',	//토큰 0000000029 사업자
                //'AuthToken': 'dXVCcE96ZVlXVHBPeklGcitHQlEra3gyMXZIdkZVSnJjeldudEFwN2lQOD0K', //토큰 1111111119 사업자
                'SystemType': 'OAPI',
                'ServiceCode': 'DTI',
                'ConversationId': [ConversationId],	//참조번호
                //'SMTPEmail':'',
                //'RValue':'',
                'CertPassword':'6tVnMtI7GhHX4P9scDgmhw==',
                'SignedXML':dtixml,
                'UnSignedXML': Undtixml,
                //'SystemId':'',
                //'PlatformCode':''
            });} else {

            if(oapiissue == "역발행요청"){

                var request = JSON.stringify({
                    'MessageId': ConversationId,
                    'Signal': 'RARREQUEST',	//역매입요청
                    'RequestTime': now,
                    'SendComRegno': TxtByrComRegNo,
                    'ReceiveComRegno': TxtSupComRegNo,
                    'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',	//토큰
                    'SystemType': 'OAPI',
                    'ServiceCode': 'DTI',
                    'ConversationId': [ConversationId],	//참조번호
                    'UnSignedXML':Undtixml

                });} else {

                var request = JSON.stringify({

                    'MessageId': ConversationId,
                    'Signal': 'DETAILARISSUE',	//거래명세서
                    'RequestTime': now,
                    'SendComRegno': TxtSupComRegNo,
                    'ReceiveComRegno': TxtByrComRegNo,
                    'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',	//토큰
                    'SystemType': 'OAPI',
                    'ServiceCode': 'DTI',
                    'ConversationId': [ConversationId],	//참조번호
                    'SMTPEmail':'',
                    'RValue':'',
                    'CertPassword':'6tVnMtI7GhHX4P9scDgmhw==',
                    'SignedXML':dtixml,
                    'UnSignedXML':Undtixml,
                    'SystemId':'',
                    'PlatformCode':''
                });
            }
        }
    }


    $.support.cors = true;

    $.ajax({
        type: "POST",
        dataType: "json",
        crossDomain: true,
        contentType: "application/json",
        //url: "http://"+$(':radio[name="SERVER_TYPE"]').filter(':checked').val()+"api.smartbill.co.kr/sb-api/request/",
        url: "http://demoapi.smartbill.co.kr/sb-api/request/",
        data: request,
        success: function (data) {
            //console.log(request);
            //console.log(dtixml);
            //console.log(Undtixml);
            console.log("conversationId : "+ConversationId);
            //console.log

            if ("30000" != data.ResultCode) {
                console.log(data);
                alert(data.ResultCode + ":" + data.ResultMessage);
            }
            else{
                alert("정상적으로 처리되었습니다.");
                console.log(data);
            }
        },
        error: function (error) { //error 처리
            alert(request);
            console.log(request);

        }
    });

}

//OAPI 보관함 조회
function ViewXml(){

    var arrConvId = new Array();
    arrConvId[0] = '0000000029111111111920201006api0021';

    var _today = new Date();
    var now = _today.format('yyyyMMddhhmmss');
    var totalCount;

    var request = JSON.stringify({
        'MessageId': '0000000029111111111920201006api0021',
        'Signal': 'VIEW_XML',
        'RequestTime': now,
        'SendComRegno': '0000000029',
        'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',	//토큰
        'ServiceCode': 'DTI',
        'ConversationID' : arrConvId
    });

    $.support.cors = true;

    $.ajax({
        type: "POST",
        dataType: "json",
        crossDomain: true,
        contentType: "application/json",
        //url: "http://"+$(':radio[name="SERVER_TYPE"]').filter(':checked').val()+"api.smartbill.co.kr/sb-api/request/",
        url: "http://demoapi.smartbill.co.kr/sb-api/request/",
        data: request,
        success: function (data) {
            //console.log

            if ("30000" != data.ResultCode) {
                alert(data.ResultCode + ":" + data.ResultMessage);
            }
            else{
                //alert("정상적으로 처리되었습니다.");
                totalCount = data.ResultDataSet.Table1.length;

                if(0 < totalCount){

                    //var repoTypeCode = eval('(' + request + ')').RepoTypeCode;

                    for(var i=0; i<totalCount; i++){
                        data.ResultDataSet.Table1[i].CONVERSATION_ID;
                        $('input[name=Encrypt]').attr('value', data);

                        console.log(data.ResultDataSet.Table1[i].DTI_XML);

                    }
                }
            }
        },
        error: function (error) { //error 처리
            alert(request);
            console.log(request);

        }
    });
}


Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";
    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }
    });
};
String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };




function TEST(){

    var txtPassword = document.getElementById("txtPassword").value;

    $.support.cors = true;

    $.ajax({
        type: "GET",
        //dataType: "json",
        crossDomain: true,
        url: "smartbillOpenApiAescryptoAction",
        data: {"txtPassword":txtPassword},
        success: function (data) {

            //$('#Encrypt').value=data;
            $('input[name=Encrypt]').attr('value', data);
            alert ("패스워드 암/복호화 작업을 완료하였습니다.");
            location.href("/main");

        },
        error: function (error) { //error 처리
            console.log(error);

        }
    });

}

//원본 XML 조회
function DtiStatus(){

    var TxtSupComRegNo = document.getElementById("txtSupComRegNo").value;
    var txtByrComRegNo = document.getElementById("txtByrComRegNo").value;
    var fromDate = document.getElementById("fromDate").value;
    var toDate = document.getElementById("toDate").value;

    var _today = new Date();
    var now = _today.format('yyyyMMddhhmmss');

    var totalCount;

    var request = JSON.stringify({
        'MessageId': 'test123',
        'Signal': 'DTI_STATUS_LIST',
        'RequestTime': now,
        'SendComRegno': TxtSupComRegNo,
        'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',	//토큰
        'ServiceCode': 'DTI',
        'SearchFromDate': fromDate,
        'SearchToDate': toDate,
        'SearchComRegno': txtByrComRegNo,
        'RepoTypeCode': 'AR'
    });

    $.support.cors = true;

    $.ajax({
        type: "POST",
        dataType: "json",
        crossDomain: true,
        contentType: "application/json",
        //url: "http://"+$(':radio[name="SERVER_TYPE"]').filter(':checked').val()+"api.smartbill.co.kr/sb-api/request/",
        url: "http://demoapi.smartbill.co.kr/sb-api/request/",
        data: request,
        success: function (data) { resultHtml(data); },
        error: function (error) { //error 처리
            alert(request);
            console.log(request);

        }
    });

}

//리스트 추출
function resultHtml(data){

    var totalCount = data.ResultDataSet.Table.length;
    var html1;

//	alert('totalCount Length : ' + totalCount);

//	var form = document.createElement("form");
//	form.setAttribute("method","Post");
//	form.setAttribute("action","smartbillOAPISearchAction.jsp");
//	form.setAttribute("target","_blank");

//	var input1 = document.createElement('input');

    if(0 < totalCount){

        for (var i=0; i < totalCount; i++){

            console.log(data);

            var html = "<tr>"
            html += "<td class='DTILeftText' colspan='6' style='text-align: center;'> <input type='text' style = 'text-align:center;' id='conversationId' name='conversationId' value='" + data.ResultDataSet.Table[i].ETC_PCS_NO + "' maxlength='50' size='50' /> </td>";
            html += "<td class='DTILeftText' colspan='2' style='text-align: center;'> <input type='text' style = 'text-align:center;' id='dtiStatus' name='dtiStatus' value='" + data.ResultDataSet.Table[i].DTI_STATUS + "' maxlength='5' size='5' /> </td>";
            html += "<td class='DTILeftText' colspan='3' style='text-align: center;'> <input type='text' style = 'text-align:center;' id='ntsResultCode' name='ntsResultCode' value='" + data.ResultDataSet.Table[i].NTS_RESULT_CODE + "' maxlength='5' size='5' /> </td>";
            html += "<td class='DTILeftText' colspan='3' style='text-align: center;'> <input type='text' style = 'text-align:center;' id='sendStatus' name='sendStatus' value='" + data.ResultDataSet.Table[i].NTS_SEND_STATUS + "' maxlength='5' size='5' /> </td>";
            html += "<td class='DTILeftText' colspan='3' style='text-align: center;'> <input type='text' style = 'text-align:center;' id='sendDate' name='sendDate' value='" + data.ResultDataSet.Table[i].NTS_SEND_DATE + "' maxlength='20' size='17' /> </td>";
            html += "<td class='DTILeftText' colspan='3' style='text-align: center;'> <input type='text' style = 'text-align:center;' id='supEmail' name='supEmail' value='" + data.ResultDataSet.Table[i].SUP_EMAIL + "' maxlength='20' size='17' /> </td>";
            html += "</tr>";
            $("#display").append(html);

        }
        html1 +="<tr>";
        html1 += "<td class='DTILeftText' colspan='3' style='text-align: center; display:none;'> <input type='text' style = 'text-align:center;' id='totalCount' name='totalCount' value='" + data.ResultDataSet.Table.length + "' maxlength='20' size='17' /> </td>";
        html1 += "</tr>";

        $("#display").append(html1);
    }
}

//랜덤 값 생성 - 승인번호, 참조번호
function getRandomId(n) {
    let Conid = ''
    for (let i = 0; i < n; i++) {
        Conid += Math.floor(Math.random() * 10)
    }
    return Conid

}


//상태변경
function chgStatus(){

    let _today = new Date();
    let now = _today.format('yyyyMMddhhmmss');
    let arrConvId = new Array();
    arrConvId[0] = '00000000291111111119202106232084031';
    //arrConvId[1] = '00000000291111111119202106234867031'; -- 배열 처리 안 됨.
    let request = JSON.stringify({
        'MessageId': '00000000291111111119202106236551031',
        'Signal': 'CHGSTATUS',
        'RequestTime': now,
        'SendComRegno': '0000000029',
        'ReceiveComRegno': '1111111119',
        'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',
        'ServiceCode': 'DTI',
        'SystemType': 'OAPI',
        'ConversationId': arrConvId,
        'StatusSignal': 'CANCELALL',
        'StatusReason': '123', //취소일때 취소사유 필수
    });

    $.support.cors = true;

    $.ajax({
        type: "POST",
        dataType: "json",
        crossDomain: true,
        contentType: "application/json",
        url: "http://demoapi.smartbill.co.kr/sb-api/request/",
        data: request,
        success: function (data) {

            if ("30000" != data.ResultCode){
                alert(data.ResultCode + " : " + data.ResultMessage);
            } else {
                alert("상태변경 완료!!!!");
                console.log(data);
            }
            //fnGetData(data); //data 처리(하단의 Response Sample 참조)
        },
        error: function (error) {
            alert(request);
            console.log(request);
        }
    });
}

//상태변경 한화
function chgStatus_hanwha() {

    let _today = new Date();
    let now = _today.format('yyyyMMddhhmmss');

    $.ajax({
        type: "GET",
        //dataType: "json",
        crossDomain: true,
        url: "/smartbillOpenApi/smartbillOpenApiHanwhaArApRepoStatus",
        data: "",
        success: function (data) {

            let repoTotal = JSON.parse(data).test.length;

            if (repoTotal > 0) {
                for (let i = 0; i < repoTotal; i++) {

                    let arrConvId = new Array();
                    arrConvId[0] = JSON.parse(data).test[i].hanwhaEtcPcsNo;
                    let SendComRegno_sub = JSON.parse(data).test[i].hanwhaEtcPcsNo.substring(0,10);
                    let ReceiveComRegno_sub = JSON.parse(data).test[i].hanwhaEtcPcsNo.substring(10, 20);

                    //alert(SendComRegno_sub);
                    //alert(ReceiveComRegno_sub);

                    let request = JSON.stringify({
                        'MessageId': 'hanwha_jusang' + now,
                        'Signal': 'CHGSTATUS',
                        'RequestTime': now,
                        'SendComRegno': ReceiveComRegno_sub,
                        'ReceiveComRegno': SendComRegno_sub,
                        'AuthToken': 'MzdMRE1uQ1BZYnJ0Z2lYMEhEcENBdDJ4RGZoWEtuYmVEUEtCQ1dsV2hQYz0K',
                        'ServiceCode': 'DTI',
                        'SystemType': 'OAPI',
                        'ConversationId': arrConvId,
                        'StatusSignal': 'APPROVE',
                        'StatusReason': '',
                    });

                    $.support.cors = true;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        crossDomain: true,
                        contentType: "application/json",
                        url: "http://api.smartbill.co.kr/sb-api/request/",
                        data: request,
                        success: function (data) {
                            $.ajax({
                                type: "GET",
                                //dataType: "json",
                                crossDomain: true,
                                url: "/smartbillOpenApi/smartbillApiHanwhaStatusResult",
                                data: {"hanwhaEtcPcsNo": arrConvId[0],
                                    "smartbillResultCode" : data.ResultCode},
                                success: function (data) {
                                    console.log(i + " 번째 : " + arrConvId[0]);
                                },
                                error: function (error) {
                                    console.log(error);
                                }
                            });
                        },
                        error: function (error) {
                            alert("스마트빌 OpenAPI 전송 오류");
                            console.log(request);
                        }
                    });
                }
            } else {
                alert("한화 수신승인 대상 미존재");
            }
        },
        error: function (error) { //error 처리
            alert("한화 수신승인 대상 조회 Function 오류");
            console.log(error);
        }
    });

}

function ArApRepo() {

    let _today = new Date();
    let now = _today.format('yyyyMMddhhmmss');
    let SearchFromDate = document.getElementById("SearchFromDate").value;
    let SearchToDate = document.getElementById("SearchToDate").value;
    let SearchComRegno = document.getElementById("SearchComRegno").value;

    let request = JSON.stringify({
        'MessageId': 'hanwha' + now + 'test',
        'Signal': 'ARAP_REPO',
        'RequestTime': now,
        'SendComRegno': '0000000029',
        'AuthToken': 'ekhacS9Jb2NXNlk4dWhMbWx0QW00NVFJd3dnbUZDYktBT1czaTZ3bk9kRT0K',
        'ServiceCode': 'DTI',
        'SearchFromDate': SearchFromDate,
        'SearchToDate': SearchToDate,
        'SearchComRegno': SearchComRegno,
        'RepoTypeCode': 'AP'
    });
    $.support.cors = true;
    $.ajax({
        type: "POST",
        dataType: "json",
        crossDomain: true,
        contentType: "application/json",
        url: "http://demoapi.smartbill.co.kr/sb-api/request/",
        data: request,
        success: function (data) {

            let totalCount = data.ResultDataSet.Table.length;
            let repoTypeCode = eval('(' + request + ')').RepoTypeCode;  // 정상

            console.log(request);

            let hanwhaByrComName;
            let hanwhaByrComRegno;
            let hanwhaEtcPcsNo;
            let hanwhaIssueId;
            let hanwhaDirection;
            let hanwhaDtiType;
            let hanwhaDtiWday;
            let hanwhaSupAmt;
            let hanwhaDtiStatus;
            let hanwhaSupComRegno;
            let hanwhaSupComName;

            if ("30000" != data.ResultCode) {
                alert(data.ResultCode + ":" + data.ResultMessage);
            } else {
                //alert("보관함 호출 성공!!!!!!!");
                //console.log(data);

                //alert('3');
                if (0 < totalCount) {
                    //alert("1");
                    if ("AR" == repoTypeCode) {
                        //alert("2");
                        for (var i = 0; i < totalCount; i++) {
                            hanwhaByrComName = data.ResultDataSet.Table[i].BYR_COM_NAME; //공급받는자 회사명
                            hanwhaByrComRegno = data.ResultDataSet.Table[i].BYR_COM_REGNO; //공급받는자 사업자번호
                            hanwhaEtcPcsNo = data.ResultDataSet.Table[i].ETC_PCS_NO; //세금계산서 참조번호
                            hanwhaIssueId = data.ResultDataSet.Table[i].ISSUE_ID; //세금계산서 승인번호
                            hanwhaDirection = data.ResultDataSet.Table[i].DIRECTION; //세금계산서 정/역 구분
                            hanwhaDtiType = data.ResultDataSet.Table[i].DTI_TYPE; //세금계산서 종류
                            hanwhaDtiWday = data.ResultDataSet.Table[i].DTI_WDAY; //세금계산서 작성일자
                            hanwhaSupAmt = data.ResultDataSet.Table[i].SUP_AMT; //세금계산서 공급가액
                            hanwhaDtiStatus = data.ResultDataSet.Table[i].DTI_STATUS; //세금계산서 상태
                            data.ResultDataSet.Table[i].NTS_SEND_STATUS; //세금계산서 국세청 전송상태
                            data.ResultDataSet.Table[i].SUP_EMAIL; //담당자 이메일

                            console.log("################ 매출보관함 결과 #####################");
                            console.log(hanwhaByrComName, hanwhaDtiStatus);

                            $.ajax({
                                type: "GET",
                                //dataType: "json",
                                crossDomain: true,
                                url: "smartbillOpenApiHanwha",
                                data: {"hanwhaByrComName":hanwhaByrComName},
                                success: function (data) {

                                },
                                error: function (error) { //error 처리
                                    console.log(error);
                                }
                            });
                        }
                    } else
                    if ("AP" == repoTypeCode) {
                        for (var i = 0; i < totalCount; i++) {
                            hanwhaSupComName = data.ResultDataSet.Table[i].SUP_COM_NAME; //공급자 회사명
                            hanwhaSupComRegno = data.ResultDataSet.Table[i].SUP_COM_REGNO; //공급자 사업자번호
                            hanwhaEtcPcsNo = data.ResultDataSet.Table[i].ETC_PCS_NO; //세금계산서 참조번호
                            hanwhaIssueId = data.ResultDataSet.Table[i].ISSUE_ID; //세금계산서 승인번호
                            hanwhaDirection = data.ResultDataSet.Table[i].DIRECTION; //세금계산서 정/역 구분
                            hanwhaDtiType = data.ResultDataSet.Table[i].DTI_TYPE; //세금계산서 종류
                            hanwhaDtiWday = data.ResultDataSet.Table[i].DTI_WDAY; //세금계산서 작성일자
                            hanwhaSupAmt = data.ResultDataSet.Table[i].SUP_AMT; //세금계산서 공급가액
                            hanwhaDtiStatus = data.ResultDataSet.Table[i].DTI_STATUS; //세금계산서 상태
                            data.ResultDataSet.Table[i].NTS_SEND_STATUS; //세금계산서 국세청 전송상태
                            data.ResultDataSet.Table[i].BYR_EMAIL; //담당자 이메일

                            $.ajax({
                                type: "GET",
                                //dataType: "json",
                                crossDomain: true,
                                url: "smartbillOpenApiHanwha",
                                data: {"hanwhaEtcPcsNo" : hanwhaEtcPcsNo,
                                    "hanwhaIssueId" : hanwhaIssueId,
                                    "hanwhaSupComRegno":hanwhaSupComRegno,
                                    "hanwhaDirection" : hanwhaDirection,
                                    "hanwhaDtiStatus" : hanwhaDtiStatus
                                },
                                success: function (data) {

                                    console.log("한화 세금계산서 DB 저장 완료");

                                },
                                error: function (error) { //error 처리
                                    console.log(error);
                                }
                            });
                        }
                    }

                } else {
                    alert("데이터 없음!!!");
                }
            }
        },
        error: function (error) {
            console.log(data);
        }
    });

}

// // 첨부파일 업로드
// function DeliverySend(){
//
//     var fileInput = document.getElementById('DeliveryFile');
//
//     fileInput.addEventListener('change', (event) => {
//         var selectedFile = event.target.files[0];
//     });
//
//     var fileReader = new FileReader();
//
//     fileReader.onload = function(event) {
//         var arrayBuffer = event.target.result;
//     }
//
//     //fileReader.readAsArrayBuffer(selectedFile);
//
//     alert(arrayBuffer);
// }