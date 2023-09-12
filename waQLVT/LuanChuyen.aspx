<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LuanChuyen.aspx.cs" Inherits="waQLVT.LuanChuyen" %>
<%@ Register Src="~/Modules/luanchuyenvattu.ascx" TagName="xuat" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>
        LUÂN CHUYỂN</strong>
    </div>
    <br />
    <br />
    <div>
        <table style="width:100%;">
                    <tr><td class="style2">
                        <uc:xuat ID="Xuat1" runat="server" />
                    </td></tr> 
         </table> 
    </div>
</asp:Content>


