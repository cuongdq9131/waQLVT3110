<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="xuatvattu.aspx.cs" Inherits="waQLVT.xuatvattu" %>
<%@ Register Src="~/Modules/xuatvattu.ascx" TagName="xuat" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>
        XUẤT VẬT TƯ</strong>
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

