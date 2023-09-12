<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="waQLVT.Import" %>
<%@ Register Src="~/Modules/ImportData.ascx" TagName="imp" TagPrefix="imp1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin" align="center">
        <strong>
        <br />
        <br />
        Lấy dữ liệu từ file</strong>
    </div>
    <br />
    <br />
    <div>
        <table style="width:100%;" align="center">
                    <tr align="center"><td class="style2" align="center">
                        <imp1:imp ID="loaddl1" runat="server" />
                    </td></tr> 
                </table> 
    </div>
</asp:Content>
