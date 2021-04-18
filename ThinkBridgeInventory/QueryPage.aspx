<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryPage.aspx.cs" MasterPageFile="~/Masterpage.Master" Inherits="ThinkBridgeInventory.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <br /><br />
    &nbsp;<br />
    <h1 align="center"><asp:Label ID="LabelIM" runat="server" Text="Query Inventory Form"></asp:Label></h1>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">   
     <div>
        <div>
            <br />

        </div>
        <div align="center">
        <asp:Panel ID="Panel1" HorizontalAlign="center" runat="server">

        <table align="center" class="filterQuery">
            <tr>
                <td>
                    <asp:Label ID="FromDate" runat="server" class="generallabel" Text="From Date: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFrom" runat="server" CssClass="generaltextbox" TextMode="Date"></asp:TextBox>
                  
                </td>
                <td>
                    <asp:Label ID="ToDate" runat="server" class="generallabel" Text="To Date: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxTo" runat="server" CssClass="generaltextbox" TextMode="Date"></asp:TextBox>
                </td>
                
              </tr>  
                </table>      
                      
                      <div>
                              <asp:Button ID="ButtonSubmit" runat="server" CssClass="loginbtn"  Text="Submit" OnClick="ButtonSubmit_Click" />
                          
                      </div>
                
             
            <br />
        </asp:Panel>
            </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid" HorizontalAlign="Center" BorderStyle="None" BorderWidth="1px"
            CellPadding="3">
            <Columns>
                <asp:TemplateField HeaderText="Serial No">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" style="text-align: center" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PrimaryKey">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("QR_code")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product_name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Product_name")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product_description">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Product_description")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product_price">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Product_price")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Model">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("Model")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("Supplier")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("Location")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bought_on">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%#Eval("Bought_on")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inventory Image">
                                                          
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# Eval("Image_url") %>' Width="100px" />
                                    <br />
                                    <asp:Label ID="LabelImage" runat="server" Text='<%# Eval("image_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
            </Columns>
            <FooterStyle CssClass="FooterStyle" />
            <HeaderStyle CssClass="HeaderStyle" />
            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
            <RowStyle CssClass="RowStyle" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle CssClass="SortedAscendingCellStyle" />
            <SortedAscendingHeaderStyle CssClass="SortedAscendingHeaderStyle" />
            <SortedDescendingCellStyle CssClass="SortedDescendingCellStyle" />
            <SortedDescendingHeaderStyle CssClass="SortedDescendingHeaderStyle" />
        </asp:GridView>
        <br />

    </div>
</asp:Content>


