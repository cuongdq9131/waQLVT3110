<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="changepassword.ascx.cs" Inherits="waQLVT.Modules.changepassword" %>

<table border = "1" cellpadding="0" cellspacing="0" style = "border-color: InactiveBorder; border-collapse: collapse; width: 520px; height:auto; ">  
<tr><td>

<table bgcolor="#ffffcc" cellspacing = "4" cellpadding = "8"  style="font-family: 'Times New Roman', Arial, Verdana, Tahoma; font-size: 12pt; color: #000000; width: 100%; ">

        <tr>
            <td colspan="2" style="background-color: #00A855; text-align: center; ">
                Đổi mật khẩu&nbsp;</td>
        </tr>
        <tr>
            <td style="padding-left: 10px; text-align: left;">
                <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập:"></asp:Label>
            </td>
            <td style="text-align: left;">
                <asp:TextBox ID="txtUsername" runat="server" ReadOnly="True" Width="210px" 
                    Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 10px; text-align: left;">
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu cũ:"></asp:Label>
            </td>
            <td style="text-align: left;">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="210px" 
                    Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 10px; text-align: left;">
                <asp:Label ID="Label3" runat="server" Text="Mật khẩu mới:"></asp:Label>
            </td>
            <td style="text-align: left;">
                <asp:TextBox ID="txtNewpassword" runat="server" TextMode="Password" 
                    Width="210px" Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 10px; text-align: left;">
                <asp:Label ID="Label4" runat="server" Text="Nhập lại mật khẩu:"></asp:Label>
            </td>
            <td style="text-align: left;">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="210px" 
                    Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align = "center">
                <br />
                <asp:Button ID="Button1" Font-Names="Times New Roman" Font-Size="13pt" Height="33px" style="margin-top: 0px" Text="Đổi mật khẩu" onclick="Button1_Click"  runat="server"/>
            </td>
        </tr>
    </table>

</td></tr> 
</table>

