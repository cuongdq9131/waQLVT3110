<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="travattu.ascx.cs" Inherits="waQLVT.Modules.travattu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
<td align = "right"> Đơn vị trả</td>
      <td align = "left" class="style1">
                 <asp:DropDownList ID="drmadvn" runat="server" Width="260px" 
                     oninit="drmadvn_Init" AutoPostBack="True" 
                     onselectedindexchanged="drmadvn_SelectedIndexChanged"> 
                     </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [MaDonVi],[TenDonVi] FROM [DonVi]"></asp:SqlDataSource>
       </td> 


</tr>
<tr>
<td align = "right">Loại vật tư</td>
    <td align="left">
        <asp:DropDownList ID="maloaivt" runat="server" 
            onselectedindexchanged="maloaivt_SelectedIndexChanged" AutoPostBack="true"  Width="160px">
            <asp:ListItem Value="VT">Vật tư</asp:ListItem>
            <asp:ListItem Value="DC">Dụng cụ</asp:ListItem>
            <asp:ListItem Value="TS">Tài sản</asp:ListItem>
        </asp:DropDownList>
    </td>
     <td align = "right">Vật tư</td>
            <td align = "left" class="style1">
                 <asp:DropDownList ID="drvattu" runat="server"  Width="400px" 
                     AutoPostBack="true" onselectedindexchanged="drvattu_SelectedIndexChanged"></asp:DropDownList>
                     <br />
                     <asp:Label runat="server" ID="tclb" Font-Size="Small" ForeColor="Blue"></asp:Label>       
            </td>
            
</tr>

<tr>
    <td align = "right">Mã vật tư</td>
     <td align = "left" >
         <asp:DropDownList ID="drmavattu" runat="server" AutoPostBack="true" 
             onselectedindexchanged="drmavattu_SelectedIndexChanged"></asp:DropDownList>
     </td>
     <td align = "right">Part_No</td>
     <td align = "left">
         <asp:DropDownList ID="drpartno" runat="server" AutoPostBack="true" 
             onselectedindexchanged="drpartno_SelectedIndexChanged" ></asp:DropDownList>
     </td>              
      <td align = "right">Model</td>
     <td align = "left">
         <asp:DropDownList ID="drmodel" runat="server" AutoPostBack="true" 
             onselectedindexchanged="drmodel_SelectedIndexChanged"></asp:DropDownList>
     </td>       
      

</tr>

<tr>
<td align = "right">Tình trạng</td>
    <td>
            <asp:DropDownList ID="drtinhtrang" runat="server" 
            AutoPostBack="true"  Width="160px">
            <asp:ListItem Value="H">Hỏng</asp:ListItem>
            <asp:ListItem Value="BT">Bình thường</asp:ListItem>
            
        </asp:DropDownList> 
      </td>
       <td align = "right">Số lượng trả</td>
            <td align = "left" class="style2">
                <asp:TextBox ID="txtsl" runat="server" Width="160px"></asp:TextBox>  
      </td>       
       <td align = "right"> Ngày trả</td>
            <td>
       <asp:TextBox ID="txtNgayXuat" runat="server" Width="150px"></asp:TextBox>
       <asp:CalendarExtender ID="txtNgayXuat_CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtNgayXuat" Format="dd/MM/yyyy">
                  </asp:CalendarExtender>
            </td>      

            
            
</tr>

<tr>
    <td colspan="6" align="center">
    
            <asp:Label ID="alert" runat="server" Font-Bold="True" 
                Font-Names="Arial" Font-Size="Small" ForeColor="#FF3300" 
                Text=""></asp:Label>
   </td>
</tr>


<tr>
            <td colspan="6" align = "center">
                &nbsp;<asp:Button ID="btnThemMoi" runat="server" Text="Trả vật tư" 
                    Font-Bold="True" Height="30px" Width="100px" onclick="btnThemMoi_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
</tr>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [TenVatTu],[VatTuID],[MaVatTu],[Part_No],[Model] FROM [VatTu]"></asp:SqlDataSource>            
      
          
</table>
<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
    <tr>
        <td>
        <asp:GridView ID="gr" runat="server" Width="100%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" ForeColor="#333333" DataKeyNames="MaTraVe" 
                HorizontalAlign="Right" OnRowEditing="gr_RowEditing" 
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit"  
                OnRowDeleting="gr_Delete" BorderStyle="Solid" 
                RowStyle-HorizontalAlign="Center" OnPageIndexChanging="gr_PageChange" 
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
                    <asp:TemplateField HeaderText="Số thứ tự">
                        <ItemTemplate><%# Container.DisplayIndex + 1 %></ItemTemplate>
                    </asp:TemplateField>
                    

                    <asp:TemplateField HeaderText="Mã vật tư">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaVatTu") %>' ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:DropDownList ID="e_drmavt" runat="server" DataSourceID="SqlDataSource1" 
                                        DataTextField="MaVatTu" DataValueField="MaVatTu" SelectedValue='<%# Eval("MaVatTu")%>'></asp:DropDownList>
                         </EditItemTemplate>    
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Part_No">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Part_No") %>' ></asp:Label>
                        </ItemTemplate>
                        
                        <EditItemTemplate>
                           <asp:DropDownList ID="e_drpartno" runat="server" DataSourceID="SqlDataSource1" 
                                        DataTextField="Part_No" DataValueField="Part_No" SelectedValue='<%# Eval("Part_No")%>'></asp:DropDownList>
                         </EditItemTemplate>    
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Model">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Model") %>' ></asp:Label>
                        </ItemTemplate> 
                         <EditItemTemplate>
                           <asp:DropDownList ID="e_drmodel" runat="server" DataSourceID="SqlDataSource1" 
                                        DataTextField="Model" DataValueField="Model" SelectedValue='<%# Eval("Model")%>'></asp:DropDownList>
                         </EditItemTemplate>   
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên Vật tư">
                         <ItemTemplate>
                               <asp:Label ID="lbtenlc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenVatTu") %>' ></asp:Label>
                        </ItemTemplate>
                      <EditItemTemplate>
                           <asp:DropDownList ID="e_drtenvt" runat="server" DataSourceID="SqlDataSource1" 
                                        DataTextField="TenVatTu" DataValueField="TenVatTu" SelectedValue='<%# Eval("TenVatTu")%>'></asp:DropDownList>
                         </EditItemTemplate>
                         <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày trả">
                        <ItemTemplate>
                            <asp:Label ID="lbngaynhap" runat="server" Text='<%# Eval("NgayTra","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                                <asp:TextBox ID="engaynhap" runat="server" Text='<%# Eval("NgayTra","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                  
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Số lượng">
                     <ItemTemplate><asp:Label ID="soluong" runat="server" Text='<%# Eval("SoLuongTra")%>'></asp:Label> </ItemTemplate>
                       
                         <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtsl" Text='<%# Eval("SoLuongTra")%>' />
                            
                        </EditItemTemplate>   
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="Đơn vị tính">
                         <ItemTemplate> <%# Eval("TenDonViTinh")%> </ItemTemplate>
                         
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tình trạng">
                         <ItemTemplate>
                                <%# Eval("MaTrangThai")%>
                         </ItemTemplate>
                        <EditItemTemplate>
                            
                        <asp:DropDownList ID="e_drtinhtrang" runat="server">
                        <asp:ListItem Value="H">Hỏng</asp:ListItem>
                        <asp:ListItem Value="BT">Bình thường</asp:ListItem>
                        </asp:DropDownList></EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn vị trả">
                         <ItemTemplate>
                                <%# Eval("TenDonVi")%>
                         </ItemTemplate>
                        <EditItemTemplate>
                            
                        <asp:DropDownList ID="e_drmadvlc" runat="server" DataSourceID="SqlDataSource3" 
                     DataTextField="TenDonVi" DataValueField="MaDonVi" SelectedValue='<%# Eval("MaDonVi")%>'></asp:DropDownList></EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="&lt;img src=Icons/icon_delete.gif border=0 title='Cập nhật'&gt;" DeleteText="&lt;img src=Icons/icon_delete.gif border=0 title=Xóa&gt;" 
                        ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                    
                </Columns>
            
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
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