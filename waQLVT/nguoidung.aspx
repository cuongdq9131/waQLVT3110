<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="nguoidung.aspx.cs" Inherits="waQLVT.nguoidung" %>
<%@ Register Src="~/Modules/nguoidung.ascx" TagName="nguoidung" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>
        
        <br />
        NGƯỜI DÙNG</strong>
    </div>
    <br />
    <br />
     <div>
        <table style="width:100%;">
                    <tr><td class="style2">
                        <uc1:nguoidung ID="nhap2" runat="server" />
                    </td></tr> 
                </table> 
    </div>
</asp:Content>
