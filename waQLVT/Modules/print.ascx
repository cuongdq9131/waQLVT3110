<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="print.ascx.cs" Inherits="waQLVT.Modules.print" %>

<div>
    <table>
    <tr>
        <td align="center" style="font-weight: bold; font-size: x-large" class="banlogo" >
        DANH SÁCH VẬT TƯ QUÝ <asp:Label ID="lblTitlePrint" runat="server"></asp:Label>
        <asp:TextBox ID="txtBox" runat="server"></asp:TextBox>
        </td></tr>
    </table>
</div>
<br />
<br />
<div>
<table>
            
<tr>
    <td align="center">
        <asp:GridView ID="gr1" runat="server" Width="100%" AutoGenerateColumns="False"
                HorizontalAlign="Right" PageSize="1000">

                <Columns>
                    <asp:TemplateField HeaderText="STT" >
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã vật tư">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"MaVatTu") %>' with="100px"></asp:Label>
                        </ItemTemplate>
                       <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Part Number">                       
                        <ItemTemplate>
                            <asp:Label ID="lblPartNo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Part_No") %>' ></asp:Label>
                        </ItemTemplate>    
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên vật tư">
                         <ItemTemplate>
                                <%# Eval("TenVatTu")%>
                        </ItemTemplate>                       
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ĐVT">                        
                        <ItemTemplate>
                            <asp:Label ID="lblDonViTinh" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenDonViTinh") %>' ></asp:Label>
                        </ItemTemplate>                  
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tồn đầu">
                         <ItemTemplate>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("TonDauKy")%>' ></asp:Label>
                        </ItemTemplate>
                       
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nhập">                       
                        <ItemTemplate>
                            <asp:Label ID="lblSoLuongNhap" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SoLuongNhap") %>' ></asp:Label>
                        </ItemTemplate>
                       
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Xuất">                       
                        <ItemTemplate>
                            <asp:Label ID="lblSoLuongXuat" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SL") %>' ></asp:Label>
                        </ItemTemplate>
                       
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Tồn cuối">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TonCuoiKy") %>' ></asp:Label>
                        </ItemTemplate>
                       
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="VTĐ">                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TenViTriDat") %>' ></asp:Label>
                        </ItemTemplate>                  
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>                                        
                </Columns>
            </asp:GridView>
    
    </td>
</tr>

</table>
</div>