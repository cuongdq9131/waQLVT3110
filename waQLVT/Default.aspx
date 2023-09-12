<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="waQLVT._default" %>
<%@ Register src="~/Modules/banner.ascx" tagname="banner" tagprefix="uc1" %>
<%@ Register src="Modules/menutop.ascx" tagname="menutop" tagprefix="uc2" %>

<%@ Reference Control = "~/Modules/login.ascx" %>
<%@ Reference Control = "~/Modules/changepassword.ascx" %>
<%@ Register src="Modules/bottom.ascx" tagname="bottom" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ðăng nhập Quản lý kho</title>
    <link href="Css/login.css" rel="stylesheet" type="text/css" />
    <link href="Css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="stmenu.js"></script></head>
<body>
    <form id="form1" runat="server">

    <table cellpadding = "0" cellspacing = "0" border = "0" width = "100%">
        <tr><td align = "center">
            <uc1:banner ID="banner1" runat="server" />
        </td></tr> 
         <tr><td>
             <uc2:menutop ID="menutop1" runat="server" />
        </td></tr> 
        <tr><td class = "objlogin" align = "center">
             <asp:PlaceHolder ID="Login" runat="server"></asp:PlaceHolder>
        </td></tr>
        <tr><td>
             <uc3:bottom ID="bottom1" runat="server" />
         </td></tr> 
    </table>
    </form>
</body>
</html>

<!--  -->