function xmlPopUp(){
    var url = "http://localhost:10001/addService/View/DifXML_Reg.asp";
    var name = "popup test";
    var option = "width = 900, height = 500, top = 100, left = 200, location = no";
    window.open(url, name, option);
}

function CertInsert() {
    var form = document.getElementById("cert");
    var regno = document.getElementById("regno").value;
    var comname = document.getElementById("comname").value;

    if (regno  == "undefined" || regno == "" || regno == null){
        alert("사업자번호를 기입해주세요.");
    } else if(comname  == "undefined" || comname == "" || comname == null){
        alert("상호명을 기입해주세요.");
    } else {
        var win = window.open("http://192.168.100.118:10001/callSB_V3/XXSB_DTI_CERT.asp?CERT_REGNO=" + regno + "&CERT_COMNAME=" + comname);

    }

}