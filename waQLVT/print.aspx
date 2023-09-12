<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="waQLVT.print" %>
<%@ Register Src="~/Modules/print.ascx" TagName="print" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>In ấn</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        <uc1:print id="in" runat="server"></uc1:print>
    </div>
    </form>
</body>
</html>
