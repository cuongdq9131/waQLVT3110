<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vattu.aspx.cs" Inherits="waQLVT.vattu" %>
<%@ Register Src="~/Modules/vattu.ascx" TagName="tim" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>

        VẬT TƯ</strong>
    </div>
    <br />
 
    <div>
        <table style="width:100%;">
                    <tr><td class="style2">
                        <uc1:tim ID="vattu11" runat="server" />
                    </td></tr> 
                </table> 
    </div>
</asp:Content>
