<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapVT_DaTonTai.aspx.cs" Inherits="waQLVT.NhapVT_DaTonTai" %>
<%@ Register Src="~/Modules/NhapVatTu_DaTonTai.ascx" TagName="Nhap" TagPrefix="uc" %>
<%@ Register Src="~/Modules/nhapvattu.ascx" TagName="nhap" TagPrefix="uc1" %>
<%@ Register Src="~/Modules/menumain.ascx" TagName="menu" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="style_TitleLogin" >
        <strong>NHẬP VẬT TƯ</strong>
    </div>
    <br />
    <br />   
     <div>
        <table style="width:100%;">
                    <tr><td class="style2">
                        <uc:Nhap ID="Nhap1" runat="server" />
                    </td></tr> 
                </table> 
    </div>
</asp:Content>
