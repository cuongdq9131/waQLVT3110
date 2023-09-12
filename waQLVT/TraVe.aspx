<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraVe.aspx.cs" Inherits="waQLVT.TraVe" %>
<%@ Register Src="~/Modules/travattu.ascx" TagName="xuat" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="style_TitleLogin">
        <strong>
      
        <br />
        TRẢ VỀ</strong>
    </div>
    <br />
    <br />
    <div>
        <tr><td class="style2">
                        <uc:xuat ID="Xuat1" runat="server" />
                    </td></tr>
    </div>
</asp:Content>


