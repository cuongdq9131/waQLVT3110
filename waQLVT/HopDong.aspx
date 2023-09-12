<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HopDong.aspx.cs" Inherits="waQLVT.HopDong" %>
<%@ Register Src="~/Modules/hopdong.ascx" TagName="donvi" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>
        GÓI THẦU</strong>
    </div>
    <br />
    <br />
    <div>
        <uc1:donvi ID="Donvi1" runat="server" />
    </div>
</asp:Content>

