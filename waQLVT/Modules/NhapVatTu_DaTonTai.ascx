<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NhapVatTu_DaTonTai.ascx.cs" Inherits="waQLVT.Modules.NhapVatTu_DaTonTai" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    <Services>
        <asp:ServiceReference Path="~/Sevices/AutocompleteService.asmx" />
    </Services>
</asp:ToolkitScriptManager>
<script type="text/javascript" language="javascript">
    
    function OpenWindow() {
        var sURL;
        sURL = "NhapVatTu.aspx";
        window.open(sURL, '_blank', 'width=800, height=500, left=' + ((screen.width - 800) / 2) + ',top=' + ((screen.height - 550) / 2) + ', scrollbars=yes');
        
    }

</script>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
<td align = "right">Loại vật tư</td>
    <td align="left">
        <asp:DropDownList ID="maloaivt" runat="server" Width="160px" AutoPostBack="true" 
            onselectedindexchanged="maloaivt_SelectedIndexChanged" oninit="maloaivt_Init">
            
            
        </asp:DropDownList>
    </td>
<td align = "right"> Ngày nhập</td>
        <td>
            <asp:TextBox ID="txtNgayNhap" runat="server" Width="148px"></asp:TextBox>
                 <asp:CalendarExtender ID="txtNgayXuat_CalendarExtender1" runat="server" 
                        Enabled="True" TargetControlID="txtNgayNhap" Format="dd/MM/yyyy">
                  </asp:CalendarExtender>
        </td>    
       
</tr>

<tr>
 <td align = "right">Mã vật tư</td>
            <td align = "left">
                <asp:DropDownList ID="drMaVatTu" runat="server"  Width="400px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="drMaVatTu_SelectedIndexChanged"></asp:DropDownList>
                     <asp:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="drMaVatTu"></asp:ListSearchExtender>
            </td>
<td align = "right">Part Number</td>
            <td align = "left">
                <asp:DropDownList ID="drPartNo" runat="server"  Width="400px" 
                    AutoPostBack="True"></asp:DropDownList>
             </td>      
</tr>

<tr>
<td align = "right">Tên vật tư</td>
            <td align = "left" >
                 <asp:DropDownList ID="drTenVatTu" runat="server"  Width="400px" 
                     AutoPostBack="True"></asp:DropDownList>
               
                 <br />
                 <asp:Label runat="server" ID="lblSoLuongVT" Font-Size="Small" ForeColor="Blue"></asp:Label>          
             </td>
<td align = "right">Model</td>
 <td align = "left"><asp:TextBox ID="txtModel" runat="server" Width="250px"></asp:TextBox></td>             
</tr>

<tr>
<td align = "right">Số lượng</td>
            <td align = "left">
                <asp:TextBox ID="txtsl" runat="server" Width="160px" ></asp:TextBox>  
             </td>
             <td align = "right">Số chứng từ</td>
            <td align = "left" >
               <asp:TextBox ID="txtSoChungTu" runat="server" Width="160px" ></asp:TextBox>
             </td>         
</tr>

<asp:CollapsiblePanelExtender ID="Panel_DanhMucTB_CollapsiblePanelExtender" runat="server"
            CollapseControlID="img_ShowPanel_DanhMucHD" CollapsedImage="~/images/expand.jpg"
            Enabled="True" ExpandControlID="img_ShowPanel_DanhMucHD" ExpandedImage="~/Images/expand1.jpg"
            TargetControlID="Panel1" Collapsed="True">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
            CollapseControlID="ShowPanel_DanhMucDVT" CollapsedImage="~/images/expand.jpg"
            Enabled="True" ExpandControlID="ShowPanel_DanhMucDVT" ExpandedImage="~/Images/expand1.jpg"
            TargetControlID="Panel2" Collapsed="True">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server"
            CollapseControlID="ShowPanel_DanhMucViTri" CollapsedImage="~/images/expand.jpg"
            Enabled="True" ExpandControlID="ShowPanel_DanhMucViTri" ExpandedImage="~/Images/expand1.jpg"
            TargetControlID="Panel3" Collapsed="True">
        </asp:CollapsiblePanelExtender>

<tr>
    
 <td align = "right">Gói thầu</td>
            <td align = "left">
                 <asp:DropDownList ID="drGoiThau" runat="server" Width="250px" 
                     AutoPostBack="True"></asp:DropDownList>
           
            <asp:Image ID="img_ShowPanel_DanhMucHD" runat="server" Height="24px" ImageUrl="~/Images/expand1.jpg"
                ToolTip="Cập nhật danh mục hợp đồng" Width="24px" />             
            </td>
           

 <td align = "right" >Đơn vị tính</td>
            <td align = "left">
                <asp:DropDownList ID="drmadvt" runat="server" Width="148px" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Image ID="ShowPanel_DanhMucDVT" runat="server" Height="24px" ImageUrl="~/Images/expand1.jpg"
                ToolTip="Cập nhật danh mục đơn vị tính" Width="24px" />
               
            </td>
</tr>

<tr>
    <td align="left" colspan="3">
      <asp:Panel ID="Panel1" runat="server">
      
                    <asp:Label ID="lblNhapGoiThau" runat="server" Text="Nhập gói thầu"></asp:Label>
                     &nbsp
                     <asp:TextBox ID="nmahd" runat="server" Width="250px"></asp:TextBox>
                       &nbsp  &nbsp&nbsp&nbsp 
                     
                    
                     <asp:Label ID="Label4" runat="server" Text="Ngày ký"></asp:Label>
                     &nbsp
                     <asp:TextBox ID="txtNgayKy" runat="server" Width="100px"></asp:TextBox>
                 <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                        Enabled="True" TargetControlID="txtNgayKy" Format="dd/MM/yyyy">
                  </asp:CalendarExtender>
                  
                  &nbsp;<asp:ImageButton runat= "server" ImageUrl="~/Images/Add.bmp" ID="add" 
                        onclick="add_Click" Height="29px" Width="35px"/>
                              
        </asp:Panel> 
        
    </td>
    <td align="left">
    <asp:Panel ID="Panel2" runat="server">
    <asp:Label ID="Label3" runat="server" Text="Nhập ĐVT"></asp:Label>
    <asp:TextBox ID="txtdvt" runat="server" Width="100px"></asp:TextBox>
     &nbsp;<asp:ImageButton runat= "server" ImageUrl="~/Images/Add.bmp" ID="add_dvt" Height="29px" Width="35px" onclick="add_dvt_Click"/>
    </asp:Panel>
    </td>
     
</tr>

<tr>
<td align = "right">Nơi quản lý</td>
            <td align = "left">
                 <asp:DropDownList ID="drmadonvi" runat="server" Width="148px" 
                     oninit="drmadonvi_Init"></asp:DropDownList>
            </td>
<td align = "right">Địa điểm nhận</td>
            <td align = "left" class="style3">
                 <asp:DropDownList ID="drMaViTriDat" runat="server" Width="148px" 
                     AutoPostBack=True></asp:DropDownList>
                <asp:Image ID="ShowPanel_DanhMucViTri" runat="server" Height="24px" ImageUrl="~/Images/expand1.jpg"
                ToolTip="Cập nhật danh mục địa điểm" Width="24px" />
            </td>
</tr>
<tr>
    <td></td>
    <td></td>
    <td></td>
    <td align="left">
    <asp:Panel ID="Panel3" runat="server">
    <asp:Label ID="Label6" runat="server" Text="Nhập địa điểm"></asp:Label>
    <asp:TextBox ID="txtdiadiem" runat="server" Width="100px"></asp:TextBox>
     &nbsp;<asp:ImageButton runat= "server" ImageUrl="~/Images/Add.bmp" ID="ImageButton1" 
                         Height="29px" Width="35px" onclick="ImageButton1_Click"/>
                        </asp:Panel>
    </td>
</tr>


<tr>
    <td colspan="4" align = "center">
            <asp:Label ID="alert" runat="server" Font-Bold="True" 
                Font-Names="Arial" Font-Size="Small" ForeColor="#FF3300"></asp:Label>
   </td>
</tr>
<tr>
            <td colspan="4" align = "center">
                &nbsp;<asp:Button ID="btnThemMoi" runat="server" Text="Thêm vật tư" 
                    Font-Bold="True" Height="30px" Width="129px" onclick="btnThemMoi_Click" /> &nbsp; &nbsp;
                    <asp:Button ID="btnNhapVatTuMoi" runat="server" Text="Nhập vật tư mới" 
                    Font-Bold="True" Height="30px" Width="129px" OnClientClick="javascript:OpenWindow();"/>
                </td>
</tr>
 <asp:SqlDataSource ID="DonViTinhSL" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [TenDonViTinh], [MaDVT] FROM [DonViTinh]">
                </asp:SqlDataSource>

</table>
       
<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
    <tr>
        <td>
        <asp:GridView ID="gr" runat="server" Width="100%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" DataKeyNames="MaNhapVT" 
                HorizontalAlign="Right"  OnRowEditing="gr_RowEditing" 
                OnRowUpdating="gr_RowUpdating" OnRowCancelingEdit="gr_RowCancelingEdit" OnPageIndexChanging="gr_PageChange" 
                OnRowDeleting="gr_Delete" ForeColor="#333333" 
                onrowdatabound="gr_RowDataBound" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <PagerStyle CssClass="pagination"/>
                <Columns>

                    <asp:CommandField HeaderText="&lt;img src=Icons/edit.gif border=0 title='Cập nhật'&gt;" SelectText="" 
                        CancelText="&lt;img src=Icons/pen.png border=0 height = '24px' width = '24px' title='Hủy bỏ'&gt;" 
                        EditText="&lt;img src=Icons/Edit.png border=0  height = '24px' width = '24px' title='Sửa'&gt;" 
                        ShowEditButton="True" 
                        UpdateText="&lt;img src=Icons/pen1.png border=0 height = '24px' width = '24px' title='Cập nhật'&gt;">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%"/>
                    </asp:CommandField>

                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="3%">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>                       
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Loại" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                        <ItemTemplate>
                            <asp:Label ID="Label5"  runat="server" Text='<%#Eval("MaLoaiVatTu") %>' ></asp:Label>
                            
                        </ItemTemplate>

                        <EditItemTemplate>
                        <asp:Label ID="lblVatTuID"  runat="server" Text='<%#Eval("VatTuID") %>' Visible="false"></asp:Label>
                            <asp:TextBox ID="e_txtmalvt" runat="server" Text='<%# Eval("MaLoaiVatTu")%>' Width="80%"/>
                        </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mã vật tư" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="Label1"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"MaVatTu") %>' ></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="e_txtmavt" runat="server" Text='<%# Eval("MaVatTu")%>'/>
                        </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Part_No" ItemStyle-HorizontalAlign="Center">                       
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Part_No") %>' ></asp:Label>
                        </ItemTemplate>
                      
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txtpn" Text='<%# Eval("Part_No")%>'/>
                        </EditItemTemplate><ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên vật tư" ItemStyle-HorizontalAlign="Center">
                         <ItemTemplate>
                                <%# Eval("TenVatTu")%>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Model") %>' ></asp:Label>                                
                        </ItemTemplate>
                       <EditItemTemplate>
                            <asp:TextBox runat="server" ID="e_txttenvt" Text='<%# Eval("TenVatTu")%>' /> 
                            <br />
                            <asp:TextBox runat="server" ID="e_txtmodel" Text='<%# Eval("Model")%>'/>
                        </EditItemTemplate><ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Ngày Nhập" >
                        <ItemTemplate>
                            <asp:Label ID="lbngaynhap" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"NgayNhap","{0:dd/MM/yyyy}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox runat="server" ID="engaynhap" Text='<%# Eval("NgayNhap","{0:dd/MM/yyyy}")%>'/>
                        </EditItemTemplate><ItemStyle HorizontalAlign="Center" Width="8%"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Số chứng từ">
                        <ItemTemplate>
                            <asp:Label ID="lblSoChungTu" runat="server" Text='<%# Eval("SoChungTu") %>' ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="eSoChungTu" runat="server" Text='<%# Eval("SoChungTu") %>'></asp:TextBox>   
                         </EditItemTemplate>    
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                   
                    <asp:TemplateField HeaderText="SL"  >
                         <ItemTemplate><%# Eval("SoLuongNhap")%> </ItemTemplate>
  
                         <EditItemTemplate>
                                <asp:TextBox runat="server" ID="e_txtsl" Text='<%# Eval("SoLuongNhap")%>' Width="80%" />
                         </EditItemTemplate>   
                          <ItemStyle HorizontalAlign="Center"  Width="4%"></ItemStyle>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="ĐVT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                         <ItemTemplate> <%# Eval("TenDonViTinh")%> </ItemTemplate>
                         
                        <EditItemTemplate>
                         <asp:DropDownList runat="server" ID="e_txtdvt" DataSourceID="DonViTinhSL" 
                            DataTextField="TenDonViTinh" DataValueField="MaDVT" SelectedValue='<%# Eval("MaDVT")%>'>
                             <asp:ListItem></asp:ListItem>  
                            </asp:DropDownList>                            
                        </EditItemTemplate><ItemStyle HorizontalAlign="Center"></ItemStyle>
                     </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gói" ItemStyle-HorizontalAlign="Center" >
                         <ItemTemplate>
                                <%# Eval("MaHopDong")%>
                         </ItemTemplate>
                        <EditItemTemplate>
                                <%# Eval("MaHopDong")%>
                                <br />
                        <asp:DropDownList ID="e_drmahd" runat="server" DataSource="<%# GetAllHopDong() %>"
                                DataTextField="MaHopDong" DataValueField="MaHopDong" SelectedValue='<%# Eval("MaHopDong")%>'>
                                <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                         </EditItemTemplate>
                         <ItemStyle HorizontalAlign="Center" Width="6%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ĐVQL" ItemStyle-HorizontalAlign="Center" >
                         <ItemTemplate>
                                <%# Eval("TenDonVi")%>
                         </ItemTemplate>
                        <EditItemTemplate>
                               
                            <asp:DropDownList ID="e_drmadvql" runat="server" DataSource="<%# GetAllDonVi() %>" 
                                DataTextField="TenDonVi" DataValueField="MaDonVi" SelectedValue='<%# Eval("MaDonVi")%>'>
                                <asp:ListItem></asp:ListItem>
                             </asp:DropDownList>
                         </EditItemTemplate>
                         <ItemStyle HorizontalAlign="Center" Width="6%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Kho" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                                <%# Eval("TenViTriDat")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                         <%# Eval("TenViTriDat")%>
                         <br />
                            <asp:DropDownList ID="e_drmakho" runat="server" DataSource= "<%# GetAllViTriDat() %>"
                                        DataTextField="TenViTriDat" DataValueField="MaViTriDat" SelectedValue='<%# Eval("MaViTriDat")%>'>
                                        <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                        </EditItemTemplate><ItemStyle HorizontalAlign="Center" Width="6%"></ItemStyle>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="&lt;img src=Icons/icon_delete.gif border=0 title='Cập nhật'&gt;" DeleteText="&lt;img src=Icons/icon_delete.gif border=0 title=Xóa&gt;" 
                        ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%"/>
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