<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="vattu.ascx.cs" Inherits="waQLVT.Modules.vattu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    <Services>
        <asp:ServiceReference Path="~/Sevices/AutocompleteService.asmx" />
    </Services>
</asp:ToolkitScriptManager>


<asp:Panel ID="Panel1" runat="server" BackColor="White">
<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
<td align = "right">Loại vật tư</td>
    <td align="left">
        <asp:DropDownList ID="txtLoaiVT" runat="server" Width="200px" 
            oninit="txtLoaiVT_Init" >
            <asp:ListItem Value="ALL">Tất cả</asp:ListItem>
            <asp:ListItem Value="VT">Vật tư</asp:ListItem>
            <asp:ListItem Value="DC">Dụng cụ</asp:ListItem>
            <asp:ListItem Value="TS">Tài sản</asp:ListItem>
            
        </asp:DropDownList>
    </td>
</tr>

<tr>
     <td align = "right"> Mã vật tư</td>
        <td align = "left">
            <asp:TextBox ID="txtMaVT" runat="server" Width="280px" ></asp:TextBox>
            <asp:AutoCompleteExtender ID="txtMaVT_AutoCompleteExtender1" runat="server" 
            DelimiterCharacters="" Enabled="True" ServiceMethod="GetCompletionList" 
    ServicePath="~/Sevices/AutocompleteService.asmx" TargetControlID="txtMaVT" UseContextKey="True" ContextKey="sgMaVatTu" MinimumPrefixLength="1" CompletionSetCount="12">
            </asp:AutoCompleteExtender>
        </td>
      <td align = "right">Tên vật tư</td>
      <td align = "left">
            <asp:TextBox ID="txtTenVT" runat="server" Width="280px"></asp:TextBox>
            <asp:AutoCompleteExtender ID="txtTenVT_AutoCompleteExtender1" runat="server" 
            DelimiterCharacters="" Enabled="True" ServiceMethod="GetCompletionList" 
    ServicePath="~/Sevices/AutocompleteService.asmx" TargetControlID="txtTenVT" UseContextKey="True" ContextKey="sgTenVatTu" MinimumPrefixLength="1" CompletionSetCount="12"></asp:AutoCompleteExtender>
      </td>
</tr>
<tr>
     <td align = "right">Từ ngày:</td>
     <td align = "left">
            <asp:TextBox ID="txtTuNgay" runat="server" Width="100px"></asp:TextBox>
            <asp:CalendarExtender ID="txtTuNgay_CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txtTuNgay" Format="dd/MM/yyyy"></asp:CalendarExtender>
        </td>
        <td align = "right">Đến ngày:</td>
        <td align = "left">
            <asp:TextBox ID="txtDenNgay" runat="server" Width="100px"></asp:TextBox>
            <asp:CalendarExtender ID="txtDenNgay_CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txtDenNgay" Format="dd/MM/yyyy"></asp:CalendarExtender>
        </td>
</tr>
<tr>
        <td align = "right">Đơn vị</td>
        <td align = "left">
                 <asp:DropDownList ID="ddlDonvi" runat="server" DataSourceID="SqlDataSource1" 
                     DataTextField="TenDonvi" DataValueField="MaDonvi" 
                     OnDataBound="ddl_DanhMuc_DataBound" Width="200px"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [TenDonvi],[MaDonVi] FROM [DonVi]"></asp:SqlDataSource>
        </td>
        <td align = "right">Vị trí đặt</td>
        <td align = "left">
                 <asp:DropDownList ID="ddlVitri" runat="server" DataSourceID="SqlDataSource3" 
                     DataTextField="TenViTriDat" DataValueField="MaViTriDat" 
                     OnDataBound="ddl_ViTri_DataBound" Width="200px"></asp:DropDownList>
        </td>   
</tr>
</table>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server" BackColor="#FFFFCC" Visible="False">
<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
<tr>
<td align = "right">Thông tin sử dụng vật tư</td>
 <td colspan="3" align="left">
    <asp:Label runat="server" Text="Xuất"></asp:Label>

     <asp:CheckBox ID="CheckBox1" runat="server" oncheckedchanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
     <asp:Label ID="Label2" runat="server" Text="Thanh lý"></asp:Label>

     <asp:CheckBox ID="CheckBox2" runat="server" oncheckedchanged="CheckBox2_CheckedChanged" AutoPostBack="true"/>

 </td>  
</tr>

<tr>
     <td align = "right">Từ ngày:</td>
        <td align = "left">
            <asp:TextBox ID="txtTuNgayXuat" runat="server" Width="100px" Enabled="false"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                Enabled="True" TargetControlID="txtTuNgayXuat" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
        </td>
        <td align = "right">Đến ngày:</td>
        <td align = "left">
            <asp:TextBox ID="txtDenNgayXuat" runat="server" Width="100px" Enabled="false"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                Enabled="True" TargetControlID="txtDenNgayXuat" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
        </td>
</tr>
<tr>
     <td align = "right">Đơn vị nhận</td>
        <td align = "left" class="style2">
                 <asp:DropDownList ID="drdonvinhan" runat="server" DataSourceID="SqlDataSource1" 
                     DataTextField="TenDonvi" DataValueField="TenDonvi" Enabled="false" 
                     ondatabound="drdonvinhan_DataBound"></asp:DropDownList>
                 
                     </td>
        <td align = "right">Vị trí đặt</td>
        <td align = "left" class="style2">
                 <asp:DropDownList ID="drvitridat" runat="server" DataSourceID="SqlDataSource3" 
                     DataTextField="TenViTriDat" DataValueField="TenViTriDat" Enabled="false" 
                     ondatabound="drvitridat_DataBound"></asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                     SelectCommand="SELECT [TenViTriDat],[MaViTriDat] FROM [ViTriDat]"></asp:SqlDataSource>
                     </td>
      
</tr>
</table>
</asp:Panel>

<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;" >
<tr >
            <td colspan="4" align = "center">
                &nbsp;<asp:Button ID="btnTimkiem" runat="server" Text="Tìm kiếm" 
                    Font-Bold="True" Height="30px" Width="100px" onclick="btnTimkiem_Click" EnableViewState="true"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnIn" runat="server" Text="IN" 
                    Font-Bold="True" Height="30px" Width="100px"  EnableViewState="true" 
                    onclick="btnIn_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <%-- OnClientClick="getSearchvalues()" --%>
            </td>
</tr>
</table>
<table cellpadding = "5" cellspacing = "" border = "0" width = "100%" style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
    <tr>
        <td>
                  
            <asp:GridView ID="gr1" runat="server" Width="100%" AutoGenerateColumns="False" 
                AllowPaging="True" CellPadding="4" ForeColor="#333333"
                HorizontalAlign="Right" OnPageIndexChanging="gr_PageChange" PageSize="20" 
               >
            <AlternatingRowStyle BackColor="White" />
            <PagerStyle CssClass="pagination"/>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />

                <Columns>
                    <asp:TemplateField HeaderText="STT" >
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>

                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mã vật tư">
                        <ItemTemplate>
                            <asp:Label ID="lblMaVatTu" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"MaVatTu") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                       <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Part Number">                        
                        <ItemTemplate>
                            <asp:Label ID="lblPartNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Part_No") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên vật tư">
                         <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenVatTu") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ĐVT">                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenDonViTinh") %>' ></asp:Label>
                        </ItemTemplate>                   
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TỒN Đ.KỲ">
                         <ItemTemplate>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("TonDauKy")%>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="NHẬP"> 
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SoLuongNhap") %>' ></asp:Label>
                        </ItemTemplate>                       
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="XUẤT">                        
                        <ItemTemplate>
                            <asp:Label ID="lblSoLuongXuat" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Xuat") %>' ></asp:Label>
                        </ItemTemplate>                 
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="TỒN C.KỲ">      
                        <ItemTemplate>
                            <asp:Label ID="lblTonCKy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TonCuoiKy") %>' ></asp:Label>
                        </ItemTemplate>                      
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="GHI CHÚ">                        
                        <ItemTemplate>
                            <asp:Label ID="lblGhiChu" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenViTriDat") %>' ></asp:Label>
                        </ItemTemplate>        
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>                                        
                </Columns>
                <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            <asp:GridView ID="gr_in" runat="server" AutoGenerateColumns="False" 
            OnRowCreated="gr_in_RowCreated" OnRowDataBound="gr_in_RowDataBound" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="STT" >
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                         <ItemStyle HorizontalAlign="Center"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã vật tư">
                        <ItemTemplate>
                             <%# Eval("MaVatTu")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PartNo">                        
                        <ItemTemplate>
                             <%# Eval("Part_No")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên vật tư">
                         <ItemTemplate>
                                <%# Eval("TenVatTu")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ĐVT">                        
                        <ItemTemplate>
                             <%# Eval("TenDonViTinh")%>
                        </ItemTemplate>                   
                         <ItemStyle HorizontalAlign="Center"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TỒN Đ.KỲ">
                         <ItemTemplate>
                              <%# Eval("TonDauKy")%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="NHẬP"> 
                        <ItemTemplate>
                            <%# Eval("SoLuongNhap")%>
                        </ItemTemplate>                       
                        <ItemStyle HorizontalAlign="Right"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="XUẤT">                        
                        <ItemTemplate>
                            <%# Eval("Xuat")%>
                        </ItemTemplate>                 
                        <ItemStyle HorizontalAlign="Right"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="TỒN C.KỲ">      
                        <ItemTemplate>
                            <%# Eval("TonCuoiKy")%>
                        </ItemTemplate>                      
                    <ItemStyle HorizontalAlign="Right"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="GHI CHÚ">                        
                    </asp:TemplateField>                                        
                </Columns>
            </asp:GridView>
          
        </td>
    </tr>
    
</table>

<table id="tbl" runat="server" width="100%" visible="false">
<tr>
    <td align="left" style="font-size: small; font-weight: bold;">TRUNG TÂM KĨ THUẬT</td>
</tr>
<tr>
    <td align="left" style="font-size: small; font-weight: bold;">SẢN XUẤT CHƯƠNG TRÌNH</td>
</tr>
<tr>
<td></td>
</tr>
<tr>
    <td align="center" style="font-size:medium; font-weight: bold;">SỔ TỔNG HỢP VẬT TƯ - HÀNG HÓA</td>
</tr>
<tr>
    <td align="center">Quý  năm </td>
</tr>
<tr>
    <td align="center">Vật tư linh kiện chuyên dụng</td>
</tr>
<tr>
<td></td>
</tr>
</table>
