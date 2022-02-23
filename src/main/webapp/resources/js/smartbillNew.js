/*!
 * Bootstrap v3.3.7 (http://getbootstrap.com)
 * Copyright 2011-2016 Twitter, Inc.
 * Licensed under the MIT license
 */

 function popup(){
	var url = "http://localhost:10001/addService/View/DifXML_Reg.asp";
	var name = "popup test";
	var option = "width = 900, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}


function CertInsert(e) {
		var form = document.getElementById("cert");
		var regno = document.getElementById("regno").value;
		var comname = document.getElementById("comname").value;
	
		//alert(regno);
 	//alert(document.getElementById("regno").value);
 
	  var win = window.open("http://localhost:10001/callSB_V3/XXSB_DTI_CERT.asp?CERT_REGNO=" + regno + "&CERT_COMNAME=" + comname);
}

function issueCheck(){
	
	var txtDate = document.fr.txtDate.value;
	//YYYYMMDD 정규식 체크
	var datatimeRegexp = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;

	if(typeof txtDate == "undefined" || txtDate == null || txtDate == "" || !datatimeRegexp.test(txtDate)){
	alert("작성일자를 'YYYYMMDD'형식으로 넣어주세요(ex.20210101)");
	
	document.fr.txtDate.focus();
	
	return false;
	} else
		return true;
}