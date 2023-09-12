<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NhapVatTu.aspx.cs" 
    Inherits="waQLVT.NhapVatTu" ValidateRequest="false"%>
<%@ Register Src="~/Modules/nhapvattu.ascx" TagName="nhap" TagPrefix="uc1" %>
<%@ Register Src="~/Modules/menumain.ascx" TagName="menu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>
        Nhập vật tư
    </title>
    <link rel="stylesheet" href="Css/main.css" type="text/css">
</head>
<body>
<form id="frmAddNews" runat="server">
    <div class="style_TitleLogin">
        <strong>NHẬP VẬT TƯ</strong>
    </div>
    <br />   
     <div>
        <table style="width:100%;">
                    <tr><td class="style2">
                        <uc1:nhap ID="nhap2" runat="server" />
                    </td></tr> 
                </table> 
    </div>
</form>
</body>
</html>

