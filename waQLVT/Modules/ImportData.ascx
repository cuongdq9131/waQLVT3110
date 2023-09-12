<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportData.ascx.cs" Inherits="waQLVT.Modules.ImportData" %>
<div>
<table cellpadding = "5" cellspacing = "" border = "0" width = "80%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
  <tr align = "center">
    <td align = "center">
      <asp:FileUpload ID="FileUpload1" runat="server" />
    </td>
    <td>
      Sheet:&nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="txtSheet"  runat="server"></asp:TextBox>
    </td>
  </tr>
  <tr align = "center">
    <td align = "center">
      <asp:Label ID="lbThongbao" runat="server" ForeColor="Red"></asp:Label>
    </td>
  </tr>
</table>
<table cellpadding = "5" cellspacing = "" border = "0" width = "80%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr align = "center">
  <td align = "center">
    <asp:Button ID="Button1" runat="server" onclick="btnLoad_Click" 
        Text="Lấy dữ liệu" />
  </td>
</tr>
</table>
   
    <br />
    <br />
<table cellpadding = "5" cellspacing = "" border = "0" width = "80%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr align = "center">
 <td align = "center">
   <asp:GridView ID="GridView1" runat="server" >
    </asp:GridView>
 </td>
</tr>
</table>
    
    <br />
    <br />
</div>

