<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="donvi.ascx.cs" Inherits="waQLVT.Modules.donvi" %>


<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
       
     <td align = "right">Mã Loại Đơn vị</td>
            <td align = "left" class="style1">
                <asp:DropDownList ID="txtmldv" runat="server" Width="260px">
                    <asp:ListItem>Trong trung tâm</asp:ListItem>
                    <asp:ListItem>Ngoài trung tam</asp:ListItem>
                </asp:DropDownList>
            </td>
      <td align = "right">Tên đơn vị</td>
            <td align = "left" class="style2">
                <asp:TextBox ID="txttendv" runat="server" Width="250px"></asp:TextBox>  
            </td>
</tr>
<tr>
            <td colspan="8" align = "center">
                &nbsp;<asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" 
                    Font-Bold="True" Height="30px" Width="100px" onclick="btnThemMoi_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnReset" runat="server" Text="Nhập tiếp" Font-Bold="True" 
                    Height="30px" Width="100px" onclick="btnReset_Click" />

            </td>
</tr>

</table>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">

    <tr>
        <td align="center">
            <asp:GridView ID="gr" runat="server" Width="50%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" ForeColor="#333333" 
                DataKeyNames="MaDonVi" OnRowEditing="gr_RowEditing" OnPageIndexChanging="gr_PageChange"
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit" 
                OnRowDeleting="gr_Delete" onrowdatabound="gr_RowDataBound" >
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

                    <asp:TemplateField HeaderText="Mã đơn vị" Visible="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="Labedv" runat="server" Text='<%# Eval("MaDonVi") %>' ></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="e_madv" runat="server" Text='<%# Eval("MaDonVi")%>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã loại đơn vị" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="Labelm" runat="server" Text='<%# Eval("MaLoaiDonVi") %>' ></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="e_maldv" runat="server" Text='<%# Eval("MaLoaiDonVi")%>' />
                        </EditItemTemplate><ItemStyle HorizontalAlign="Left"></ItemStyle>
                      </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên đơn vị" ItemStyle-HorizontalAlign="Center">   
                        <ItemTemplate>
                            <asp:Label ID="Labelt" runat="server" Text='<%# Eval("TenDonVi") %>' ></asp:Label>
                        </ItemTemplate>
                       
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_tendv" Text='<%# Eval("TenDonVi")%>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="Ngày tạo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="Labelnt" runat="server" Text='<%# Eval("NgayTao","{0:dd/MM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
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