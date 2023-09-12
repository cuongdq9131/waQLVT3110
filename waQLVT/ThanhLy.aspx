<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThanhLy.aspx.cs" Inherits="waQLVT.ThanhLy" %>
<%@ Register Src="~/Modules/thanhlyvattu.ascx" TagName="xuat" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>
        THANH LÝ</strong>
    </div>
    <br />
    <br />

    <tr>
        <td class="style2"><uc:xuat ID="Xuat1" runat="server" /></td></tr> 
</asp:Content>


