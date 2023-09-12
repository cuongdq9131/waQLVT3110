<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hopdong.ascx.cs" Inherits="waQLVT.Modules.hopdong" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<style type="text/css">
    .style1
    {
        width: 290px;
    }
</style>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
       
     <td align = "right">Gói thầu</td>
            <td align = "left" class="style1">
                <asp:TextBox ID="mahopdong" runat="server" Width="241px"></asp:TextBox>
            </td>
      

     <td align = "right">Ngày ký</td>
    <td>
        <asp:TextBox ID="txtNgayKy" runat="server" Width="150px"></asp:TextBox>
                 <asp:CalendarExtender ID="txtNgayKy_CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txtNgayKy" Format="dd/MM/yyyy">
                  </asp:CalendarExtender>
    </td>

</tr>
<tr>
    <td colspan="4" align = "center">
            <asp:Label ID="alert" runat="server" Font-Bold="True" 
                Font-Names="Arial" Font-Size="Small" ForeColor="#FF3300" 
                Text=""></asp:Label>
   </td>

</tr>
<tr>
            <td colspan="4" align = "center">
                &nbsp;<asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" 
                    Font-Bold="True" Height="30px" Width="100px" onclick="btnThemMoi_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
</tr>

</table>

<table cellpadding = "5" cellspacing = "" border = "0" width = "50%" 
style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;" align="center">

    <tr>
        <td >
            <asp:GridView ID="gr" runat="server" Width="100%" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" 
                DataKeyNames="IDHopDong" OnRowEditing="gr_RowEditing" OnPageIndexChanging="gr_PageChange"
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit" 
                OnRowDeleting="gr_Delete" onrowdatabound="gr_RowDataBound" 
                GridLines="Vertical" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:CommandField HeaderText="&lt;img src=Icons/edit.gif border=0 title='Cập nhật'&gt;" SelectText="" 
                        CancelText="&lt;img src=Icons/pen.png border=0 height = '24px' width = '24px' title='Hủy bỏ'&gt;" 
                        EditText="&lt;img src=Icons/Edit.png border=0  height = '24px' width = '24px' title='Sửa'&gt;" 
                        ShowEditButton="True" 
                        UpdateText="&lt;img src=Icons/pen1.png border=0 height = '24px' width = '24px' title='Cập nhật'&gt;">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>

                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="3%"></ItemStyle>  
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã hợp đồng" Visible="True" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="Labedv" runat="server" Text='<%# Eval("MaHopDong") %>' ></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="e_mahd" runat="server" Text='<%# Eval("MaHopDong")%>' />
                        </EditItemTemplate>
                  </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày ký" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">                       
                        <ItemTemplate>
                            <asp:Label ID="lbngaynhap" runat="server" Text='<%# Eval("NgayKy","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                                <asp:TextBox ID="engayky" runat="server" Text='<%# Eval("NgayKy","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="Ngày tạo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="Labelnt" runat="server" Text='<%# Eval("NgayTao","{0:dd/MM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate><ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày cập nhật" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">  
                        <ItemTemplate>
                            <asp:Label ID="Labelcn" runat="server" Text='<%# Eval("NgayCapNhat","{0:dd/MM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="&lt;img src=Icons/icon_delete.gif border=0 title='Cập nhật'&gt;" DeleteText="&lt;img src=Icons/icon_delete.gif border=0 title=Xóa&gt;" 
                        ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                                       
                </Columns>    
                            
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
                
            
            </asp:GridView>
        </td>
    
    </tr>
</table>