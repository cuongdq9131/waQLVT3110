<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="luanchuyenvattu.ascx.cs" Inherits="waQLVT.Modules.luanchuyenvattu" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>  
            <td align = "right" style="width:25%">Đơn vị luân chuyển</td>
            <td align = "left" style="width:25%">
                 <asp:DropDownList ID="drmadvlc" runat="server" Width="160px" 
                     AutoPostBack="True" oninit="drmadvlc_Init" 
                     onselectedindexchanged="drmadvlc_SelectedIndexChanged" ></asp:DropDownList>
            </td>
                     
             <td align = "right" style="width:25%">Đơn vị lĩnh</td>
            <td align = "left" class="style1" style="width:25%">
                 <asp:DropDownList ID="drmadvn" runat="server" Width="160px" 
                     oninit="drmadvn_Init" onselectedindexchanged="drmadvn_SelectedIndexChanged"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT MaDonVi as MaDonVi,MaDonVi as MaDonViXuat,[TenDonVi] FROM [DonVi]"></asp:SqlDataSource>
              
            </td>
                           
</tr>

<tr>
<td align = "right">Loại vật tư</td>
    <td align="left">
        <asp:DropDownList ID="maloaivt" runat="server" 
            onselectedindexchanged="maloaivt_SelectedIndexChanged" AutoPostBack="true" Width="160px" oninit="maloaivt_Init">
            
            
        </asp:DropDownList>
    </td>

</tr>
<tr>
     <td align = "right" >Vật tư</td>
            <td align = "left">
                   <asp:DropDownList ID="drVatTu" runat="server" Width="400px" AutoPostBack="true" 
                       onselectedindexchanged="drVatTu_SelectedIndexChanged" ></asp:DropDownList>
                       <asp:Label runat="server" ID="lblSoLuongVT" Font-Size="Small" ForeColor="Blue"></asp:Label>
                <ajax:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="drVatTu"></ajax:ListSearchExtender>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [TenVatTu],[Part_No],[Model],[MaVatTu] FROM [VatTu]"></asp:SqlDataSource>

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
             onselectedindexchanged="drmodel_SelectedIndexChanged" Width="160px"></asp:DropDownList></td>

</tr>
<tr>
<td align = "right">Số lượng luân chuyển</td>
      <td align = "left" >
        <asp:TextBox ID="txtsl" runat="server" Width="160px"></asp:TextBox>  
       </td>
            <td align = "right">Vị trí đặt</td>
            <td align = "left">
                 <asp:DropDownList ID="drmavtd" runat="server" DataSourceID="SqlDataSource2" 
                     DataTextField="TenViTriDat" DataValueField="MaViTriDat" Width="282px"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [MaViTriDat],[TenViTriDat] FROM [ViTriDat]"></asp:SqlDataSource>
            
</tr>

<tr>
    
            <td align = "right" >Mục đích luân chuyển</td>
            <td align = "left">
                <asp:TextBox ID="txtmucdich" runat="server" Width="400px" TextMode="MultiLine"></asp:TextBox>  
            </td>
</tr>
<tr>
    <td align = "right"> Ngày luân chuyển</td>
       <td>
            <asp:TextBox ID="txtNgayXuat" runat="server" Width="160px"></asp:TextBox>
                 <ajax:CalendarExtender ID="txtNgayXuat_CalendarExtender1" runat="server" 
                        Enabled="True" TargetControlID="txtNgayXuat" Format="dd/MM/yyyy">
                 </ajax:CalendarExtender>
        </td>
        <td align = "right"> Người lập phiếu</td>
        <td>
       <asp:TextBox ID="txtnglapphieu" runat="server" Width="282px"></asp:TextBox></td>
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
                &nbsp;<asp:Button ID="btnThemMoi" 
                    runat="server" Text="Luân chuyển vật tư" 
                    Font-Bold="True" Height="30px" Width="184px" onclick="btnThemMoi_Click" />    
            </td>
</tr>          
</table>


<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
    <tr>
        <td>
        <asp:GridView ID="gr" runat="server" Width="100%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" ForeColor="#333333" DataKeyNames="MaXuatVT" 
                HorizontalAlign="Center" OnRowEditing="gr_RowEditing" 
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit"  
                OnRowDeleting="gr_Delete" 
                OnPageIndexChanging="gr_PageChange" RowStyle-HorizontalAlign="Center" 
                onrowdatabound="gr_RowDataBound">
             

                <PagerStyle CssClass="pagination"/>
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                   <asp:CommandField HeaderText="&lt;img src=Icons/edit.gif border=0 title='Cập nhật'&gt;" SelectText="" 
                        CancelText="&lt;img src=Icons/pen.png border=0 height = '24px' width = '24px' title='Hủy bỏ'&gt;" 
                        EditText="&lt;img src=Icons/Edit.png border=0  height = '24px' width = '24px' title='Sửa'&gt;" 
                        ShowEditButton="True" Visible="false"
                        UpdateText="&lt;img src=Icons/pen1.png border=0 height = '24px' width = '24px' title='Cập nhật'&gt;">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%"/>
                   </asp:CommandField>
                    
                    <asp:TemplateField HeaderText="Mã vật tư">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaVatTu") %>' ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:DropDownList ID="e_drmavt" runat="server" DataSourceID="SqlDataSource1" 
                                        DataTextField="MaVatTu" DataValueField="VatTuID" SelectedValue='<%# Eval("VatTuID")%>'></asp:DropDownList>
                         </EditItemTemplate>    
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Part_No">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Part_No") %>' ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Model">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Model") %>' ></asp:Label>
                        </ItemTemplate> 
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên Vật tư">
                         <ItemTemplate>
                               <asp:Label ID="lbtenlc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenVatTu") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày xuất" ItemStyle-Width="8%">
                        <ItemTemplate>
                             <asp:Label ID="lbngayxuatlc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"NgayXuat","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                              <asp:TextBox ID="engayxuat" runat="server" Text='<%# Eval("NgayXuat","{0:dd/MM/yyyy}") %>' ></asp:TextBox>    
                        </EditItemTemplate><ItemStyle Width="8%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SL" ItemStyle-Width="4%">
                     <ItemTemplate><%# Eval("SoLuongXuat")%> </ItemTemplate>
                       
                         <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtsl" Text='<%# Eval("SoLuongXuat")%>'  Width="85%"/>
                        </EditItemTemplate><ItemStyle Width="4%"></ItemStyle>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Đơn vị luân chuyển" ItemStyle-Width="4%">
                         <ItemTemplate>
                                <%# Eval("Xuat")%>
                         </ItemTemplate>

                        <EditItemTemplate>
                            <asp:DropDownList ID="e_drmadvlc" runat="server" DataSourceID="SqlDataSource3" 
                         DataTextField="TenDonVi" DataValueField="MaDonViXuat" SelectedValue='<%# Eval("MaDonViXuat")%>'>                        
                            <asp:ListItem Selected="True"></asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate><ItemStyle Width="4%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Đơn vị lĩnh" ItemStyle-Width="4%">
                         <ItemTemplate>
                                <%# Eval("Nhan")%>
                         </ItemTemplate>

                        <EditItemTemplate>                       
                            <asp:DropDownList ID="e_drmadvn" runat="server" DataSourceID="SqlDataSource3" 
                         DataTextField="TenDonVi" DataValueField="MaDonVi" SelectedValue='<%# Eval("MaDonVi")%>'>                        
                            <asp:ListItem Selected="True"></asp:ListItem>
                         </asp:DropDownList>
                            
                     </EditItemTemplate><ItemStyle Width="4%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Vị trí đặt" ItemStyle-Width="4%">
                        <ItemTemplate>
                                <%# Eval("TenViTriDat")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="e_drvitridatlc" runat="server" DataSourceID="SqlDataSource2" 
                                 DataTextField="TenViTriDat" DataValueField="MaViTriDat" SelectedValue='<%# Eval("MaViTriDat")%>' >
                      <asp:ListItem></asp:ListItem>
                     </asp:DropDownList >
                        </EditItemTemplate><ItemStyle Width="4%"></ItemStyle>
                    </asp:TemplateField>                 
                    <asp:CommandField HeaderText="&lt;img src=Icons/icon_delete.gif border=0 title='Cập nhật'&gt;" DeleteText="&lt;img src=Icons/icon_delete.gif border=0 title=Xóa&gt;" 
                        ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="3%"/>
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