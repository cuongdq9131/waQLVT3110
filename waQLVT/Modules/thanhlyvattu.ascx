<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="thanhlyvattu.ascx.cs" Inherits="waQLVT.Modules.thanhlyvattu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">

<tr>
<td align = "right">Loại vật tư</td>
    <td align="left">
        <asp:DropDownList ID="maloaivt" runat="server" 
            onselectedindexchanged="maloaivt_SelectedIndexChanged" AutoPostBack="true"  Width="260px" oninit="maloaivt_Init">           
        </asp:DropDownList>
    </td>
<td align = "right">Kho</td>
    <td align="left" class="style1">
        <asp:DropDownList ID="drkho" runat="server" AutoPostBack="true"  Width="160px" 
            onselectedindexchanged="drkho_SelectedIndexChanged" oninit="drkho_Init" >
            
        </asp:DropDownList>
    </td>

</tr>
<tr>
     <td align = "right">Vật tư</td>
            <td align = "left" class="style1">
               
                 <asp:DropDownList ID="drVatTu" runat="server" Width="400px" 
                     AutoPostBack="true" onselectedindexchanged="drVatTu_SelectedIndexChanged"></asp:DropDownList>
                     <br />
                 <asp:Label runat="server" ID="lblSoLuongVT" Font-Size="Small" ForeColor="Blue"></asp:Label>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [VatTuID],[TenVatTu],[Part_No],[Model],[MaVatTu] FROM [VatTu]"></asp:SqlDataSource>
            </td>
       
           <td align = "right">Mã vật tư</td>
     <td align = "left" >
         <asp:DropDownList ID="drmavattu" runat="server" AutoPostBack="true" 
             onselectedindexchanged="drmavattu_SelectedIndexChanged" Width="160px"></asp:DropDownList>
     </td>    
</tr>

<tr>
        <td align = "right">Part_No</td>
        <td align = "left">
            <asp:DropDownList ID="drpartno" runat="server" AutoPostBack="true" 
             onselectedindexchanged="drpartno_SelectedIndexChanged" Width="160px" ></asp:DropDownList></td>              
        <td align = "right">Model</td>
        <td align = "left">
         <asp:DropDownList ID="drmodel" runat="server" AutoPostBack="true" 
              Width="160px"></asp:DropDownList></td>

</tr>

<tr>
     
       <td align = "right">Số lượng thanh lý</td>
            <td align = "left" class="style2">
                <asp:TextBox ID="txtsl" runat="server" Width="260px"></asp:TextBox>  
      </td>     
       
            <td align = "right"> Ngày thanh lý</td>
            <td>            
                 <asp:TextBox ID="txtNgayThanhLy" runat="server" Width="150px"></asp:TextBox>
                 <asp:CalendarExtender ID="txtNgayThanhLy_CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txtNgayThanhLy" Format="dd/MM/yyyy">
                  </asp:CalendarExtender>
            </td>           
</tr>
    
<tr>    
        <td align = "right">Lí do thanh lý</td>
       <td align = "left" class="style1">
                <asp:TextBox ID="txtmucdich" runat="server" Height="27px" Width="400px" TextMode="MultiLine" ></asp:TextBox>  
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
            <td colspan="8" align = "center">
                &nbsp;<asp:Button 
                    ID="btnThemMoi" runat="server" Text="Thêm vật tư thanh lý" 
                    Font-Bold="True" Height="30px" Width="158px" onclick="btnThemMoi_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
</tr>        
</table>


<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
    <tr>
        <td>
        <asp:GridView ID="gr" runat="server" Width="100%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" ForeColor="#333333" DataKeyNames="MaThanhLy" 
                HorizontalAlign="Right" OnRowEditing="gr_RowEditing" 
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit"  
                OnRowDeleting="gr_Delete" 
                RowStyle-HorizontalAlign="Center" OnPageIndexChanging="gr_PageChange" 
                onrowdatabound="gr_RowDataBound">
                <PagerStyle CssClass="pagination"/>
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="&lt;img src=Icons/edit.gif border=0 title='Cập nhật'&gt;" SelectText="" 
                        CancelText="&lt;img src=Icons/pen.png border=0 height = '24px' width = '24px' title='Hủy bỏ'&gt;" 
                        EditText="&lt;img src=Icons/Edit.png border=0  height = '24px' width = '24px' title='Sửa'&gt;" 
                        ShowEditButton="True" 
                        UpdateText="&lt;img src=Icons/pen1.png border=0 height = '24px' width = '24px' title='Cập nhật'&gt;">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%" />
                    </asp:CommandField>
                
                    <asp:TemplateField HeaderText="STT" ItemStyle-Width="3%">
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

                     <asp:TemplateField HeaderText="SL" ItemStyle-Width="4%">
                     <ItemTemplate><asp:Label ID="soluong" runat="server" Text='<%# Eval("SoLuongThanhLy")%>'></asp:Label> </ItemTemplate>
                       
                         <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtsl" Text='<%# Eval("SoLuongThanhLy")%>' />
                            
                        </EditItemTemplate>   

<ItemStyle Width="4%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày thanh lý" ItemStyle-Width="6%">
                        <ItemTemplate>
                            <asp:Label ID="lbngaynhap" runat="server" Text='<%# Eval("NgayThanhLy","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                                <asp:TextBox ID="engaynhap" runat="server" Text='<%# Eval("NgayThanhLy","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                  
                        </EditItemTemplate>

<ItemStyle Width="6%"></ItemStyle>
                    </asp:TemplateField>

                                      
                    <asp:TemplateField HeaderText="Lí do thanh lý">
                     <ItemTemplate><%# Eval("LyDoThanhLy")%> </ItemTemplate>
                       
                         <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtldtl" Text='<%# Eval("LyDoThanhLy")%>' />
                        </EditItemTemplate>   
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn vị tính" ItemStyle-Width="4%">
                         <ItemTemplate> <%# Eval("TenDonViTinh")%> </ItemTemplate>
                         
<ItemStyle Width="4%"></ItemStyle>
                         
                    </asp:TemplateField>

                              
                    <asp:CommandField HeaderText="&lt;img src=Icons/icon_delete.gif border=0 title='Cập nhật'&gt;" DeleteText="&lt;img src=Icons/icon_delete.gif border=0 title=Xóa&gt;" 
                        ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%" />
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
<asp:HiddenField ID="hiSoLuong" runat="server"/>