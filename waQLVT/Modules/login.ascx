<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="waQLVT.Modules.login" %>

<table border = "1" cellpadding="0" cellspacing="0" style = "border-color: InactiveBorder; border-collapse: collapse; width: 600px; height:auto; ">  
<tr><td>

<table bgcolor="#ffffcc" border="0" cellpadding="5" cellspacing="0" width = "100%" class="styleLogintable">
    <tr>
        <td class="styleLogin1" colspan="3">
            Đăng nhập</td>
    </tr>
    <tr>
        <td class="styleLogin3">
            Tên đăng nhập:</td>
        <td class="styleLogin5">
            <asp:TextBox ID="txtUsername" runat="server" Font-Names="Times New Roman" 
                Font-Size="12pt" Height="28px" Width="184px"></asp:TextBox>
        </td>
        <td class="styleLogin6">
            <asp:RequiredFieldValidator ID="rfvDangNhap" runat="server" 
                ControlToValidate="txtUsername" ErrorMessage="Bạn phải gõ tên đăng nhập."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="styleLogin4">
            Mật khẩu:</td>
        <td class="styleLogin7">
            <asp:TextBox ID="txtPassword" runat="server" Font-Names="Times New Roman" 
                Font-Size="12pt" Height="26px" TextMode="Password" Width="184px"></asp:TextBox>
        </td>
        <td class="styleLogin6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="Bạn phải gõ mật khẩu"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr style = "visibility: hidden;">
        <td align="left" colspan="3" 
            style="font-family: 'Times New Roman', Times, serif; font-size: 12pt; font-weight: normal; font-style: normal; color: #000000;">
            <asp:CheckBox ID="chkSaveLogin" runat="server" Text=" Lưu mật khẩu" Visible = "false" />
        </td>
    </tr>
    <tr>
        <td colspan="3" 
            style="font-family: 'Times New Roman', Times, serif; font-size: 12pt; font-weight: normal; font-style: normal; color: #FF0000">
            <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:Button ID="btnDangNhap" runat="server" Font-Names="Times New Roman" 
                Font-Size="13pt" Height="33px" onclick="btnDangNhap_Click" PostBackUrl ="~/Default.aspx?mod=admin" Text="Đăng nhập" />
        </td>
    </tr>
</table>

</td></tr> 
</table>








