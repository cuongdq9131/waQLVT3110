<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="nguoidung.ascx.cs" Inherits="waQLVT.Modules.nguoidung" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<style type="text/css">
    .style1
    {
        width: 285px;
    }
    .style2
    {
        width: 270px;
    }
    .style3
    {
        width: 203px;
    }
    .style4
    {
        width: 200px;
    }
    .style5
    {
        width: 203px;
        height: 32px;
    }
    .style6
    {
        width: 285px;
        height: 32px;
    }
    .style7
    {
        width: 200px;
        height: 32px;
    }
    .style8
    {
        width: 270px;
        height: 32px;
    }
    .style9
    {
        width: 203px;
        height: 30px;
    }
    .style10
    {
        width: 285px;
        height: 30px;
    }
    .style11
    {
        width: 200px;
        height: 30px;
    }
    .style12
    {
        width: 270px;
        height: 30px;
    }
</style>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
     <td align = "right" class="style5">Mã người dùng</td>
            <td align = "left" class="style6">
                <asp:TextBox ID="txtmnd" runat="server" Width="260px"></asp:TextBox>
                </td>
      <td align = "right" class="style7">Họ tên</td>
            <td align = "left" class="style8">
                <asp:TextBox ID="txthoten" runat="server" Width="250px"></asp:TextBox></td>  
</tr>

<tr>
     <td align = "right" class="style3">Tên đăng nhập</td>
            <td align = "left" class="style1">
                <asp:TextBox ID="txttendn" runat="server" Width="260px"></asp:TextBox> 
             </td>
      <td align = "right" class="style4">Mật khẩu</td>
            <td align = "left" class="style2">
                <asp:TextBox ID="txtpass" runat="server" Width="249px"></asp:TextBox>  
             </td>
</tr>
<tr>
     <td align = "right" class="style3">Mã người nhập</td>
            <td align = "left" class="style1">
                <asp:TextBox ID="txtmanguoinhap" runat="server" Width="260px"></asp:TextBox> 
             </td>
      <td align = "right" class="style4">Số điện thoại</td>
            <td align = "left" class="style2">
                <asp:TextBox ID="txtdienthoai" runat="server" Width="252px"></asp:TextBox>  
             </td>
</tr>

<tr>
     <td align = "right" class="style3">Email</td>
            <td align = "left" class="style1">
                <asp:TextBox ID="txtemail" runat="server" Width="260px"></asp:TextBox> 
             </td>
      <td align = "right" class="style4">Địa chỉ</td>
            <td align = "left" class="style2">
                <asp:TextBox ID="txtdiachi" runat="server" Width="252px"></asp:TextBox>  
             </td>
</tr>

<tr>
     <td align = "right" class="style9">Kích hoạt</td>
            <td align = "left" class="style10">
                <asp:RadioButton ID="rdlActive" runat="server" GroupName="kichhoat" 
                    Text="Active" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdlAndanh" runat="server" Checked="True" 
                    GroupName="kichhoat" Text="Ẩn người dùng" />
             </td>
      <td align = "right" class="style11">Quyền</td>
            <td align = "left" class="style2">
                 <asp:DropDownList ID="drquyen" runat="server" DataSourceID="SqlDataSource1" 
                     DataTextField="TenQuyen" DataValueField="TenQuyen"></asp:DropDownList>

                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [TenQuyen] FROM [Quyen]"></asp:SqlDataSource>
            </td>
</tr>


<tr>
    <td align = "right" class="style3"> Ngày tạo</td>
        <td class="style1">
            <asp:TextBox ID="txtNgayTao" runat="server" Width="100px"></asp:TextBox>
                 <asp:CalendarExtender ID="txtNgayXuat_CalendarExtender1" runat="server" 
                        Enabled="True" TargetControlID="txtNgayTao" Format="dd/MM/yyyy">
                  </asp:CalendarExtender>
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
        <td>
        <asp:GridView ID="gr" runat="server" Width="100%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" DataKeyNames="MaUser" 
                HorizontalAlign="Right"  OnRowEditing="gr_RowEditing" 
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit" OnPageIndexChanging="gr_PageChange" 
                OnRowDeleting="gr_Delete" ForeColor="#333333" 
                onrowdatabound="gr_RowDataBound">
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

                    <asp:TemplateField HeaderText="Số thứ tự" ItemStyle-HorizontalAlign="Center" >
                        <ItemTemplate><%# Container.DisplayIndex + 1 %></ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mã người dùng" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="mand"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"MaUser") %>' ></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="e_txtmauser" runat="server" Text='<%# Eval("MaUser")%>' />
                        </EditItemTemplate>
                       
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Họ tên" ItemStyle-HorizontalAlign="Center">
                        
                        <ItemTemplate>
                            <asp:Label ID="maht" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"HoTen") %>' ></asp:Label>
                        </ItemTemplate>
                       
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtht" Text='<%# Eval("HoTen")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Đăng nhập" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                                <%# Eval("DangNhap")%>
                        </ItemTemplate>
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtdn" Text='<%# Eval("DangNhap")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mật Khẩu" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                                <%# Eval("MatKhau")%>
                        </ItemTemplate>
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtmk" Text='<%# Eval("MatKhau")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Số điện thoại" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                                <%# Eval("SoDienThoai")%>
                        </ItemTemplate>
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtsdt" Text='<%# Eval("SoDienThoai")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                                <%# Eval("Email")%>
                        </ItemTemplate>
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtemail" Text='<%# Eval("Email")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Địa chỉ" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                                <%# Eval("DiaChi")%>
                        </ItemTemplate>
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtdc" Text='<%# Eval("DiaChi")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quyền" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate> <%# Eval("MaQuyen")%> </ItemTemplate>
                         
                        <EditItemTemplate>
                            <%# Eval("MaQuyen")%>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [MaQuyen] FROM [Quyen]"></asp:SqlDataSource>
                            <asp:DropDownList runat="server" ID="e_txtquyen" DataSourceID="SqlDataSource2" DataTextField="MaQuyen" DataValueField="MaQuyen">
                               
                            </asp:DropDownList>
                            
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Kích hoạt" SortExpression="KichHoat">
                <ItemTemplate>
                    <asp:CheckBox ID="chkBox_Active" runat="server" Checked = '<%# GetShow(DataBinder.Eval(Container.DataItem,"KichHoat"))%>' Enabled="false" />
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="chkBox_Active" runat="server" 
                        Checked='<%# GetShow(DataBinder.Eval(Container.DataItem,"KichHoat")) %>' />
                </EditItemTemplate>



<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày tạo" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lbngaytao" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"NgayTao","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox runat="server" ID="engaytao" Text='<%# Eval("NgayTao","{0:dd/MM/yyyy}")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày cập nhật" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lbngaycapnhat" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"NgayCapNhat","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox runat="server" ID="engaycapnhat" Text='<%# Eval("NgayCapNhat","{0:dd/MM/yyyy}")%>' />
                        </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã người nhập" ItemStyle-HorizontalAlign="Center">
                     <ItemTemplate><%# Eval("MaNguoiNhap")%> </ItemTemplate>
                       
                         <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtmanhap" Text='<%# Eval("MaNguoiNhap")%>' />
                        </EditItemTemplate>   



<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    
</asp:TemplateField>

                  <asp:CommandField HeaderText="&lt;img src=Icons/icon_delete.gif border=0 title='Cập nhật'&gt;" DeleteText="&lt;img src=Icons/icon_delete.gif border=0 title=Xóa&gt;" 
                        ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>  
                </Columns>
           
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#3366FF" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#3366FF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
           
            </asp:GridView>
        </td>
    </tr>
</table>