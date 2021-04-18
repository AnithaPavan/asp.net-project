<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventory_read_Delete.aspx.cs" MasterPageFile="~/Masterpage.Master" Inherits="ThinkBridgeInventory.inventory_read_Delete" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <br /><br />
    &nbsp;<br />
    <h1 align="center"><asp:Label ID="LabelIM" runat="server" Text="Inventory Form"></asp:Label></h1>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">   
    <br />
    <asp:Panel ID="Panel1" DefaultButton="Read_delete" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3" id="form">                   
                    
                    <br />
                    <form>                        
                        <div class="form-group">
                            <asp:Label ID="LabelProduct_name" class="formtextboxlabel" runat="server" Text="Product Name:"></asp:Label>
                            <asp:TextBox ID="TextBoxProduct_name" class="form-control formtextbox" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>   
                         
                        <div class="form-group">
                            <asp:Label ID="LabelProductDescrp" class="formtextboxlabel" runat="server" Text="Product Description:"></asp:Label>
                            <asp:TextBox ID="TextBoxProductDescrp" class="form-control formtextbox" ReadOnly="true" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="LabelProductPrice" class="formtextboxlabel" runat="server" Text="Product Price:"></asp:Label>
                            <asp:TextBox ID="TextBoxProductPrice" class="form-control formtextbox" ReadOnly="true" runat="server"></asp:TextBox>
                           
                        </div>  
                        <div class="form-group">
                            <asp:Label ID="LabelLocation" class="formtextboxlabel" runat="server" Text="Location:"></asp:Label>
                            <asp:TextBox ID="TextBoxLocation" class="form-control formtextbox" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="LabelModel" class="formtextboxlabel" runat="server" Text="Model:"></asp:Label>
                            <asp:TextBox ID="TextBoxModel" class="form-control formtextbox" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>                      
                           <div class="form-group">
                            <asp:Label ID="LabelSupplier" class="formtextboxlabel" runat="server" Text="Supplier:"></asp:Label>
                            <asp:TextBox ID="TextBoxSupplier" class="form-control formtextbox" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>  
                        <div class="form-group">
                            <asp:Label ID="Labelimage" class="formtextboxlabel" runat="server" Text="Inventory Image upload:"></asp:Label>                            
                            
                            <asp:Image ID="imgPicture" Width="200" Height="200" runat="server" />
                        </div>  
                        
                        <div class="form-group">
                            <asp:Button ID="Read_delete" runat="server" class="btn myformbtn" Text="Save"  disable="true" Height="60px" Width="100%" OnClick="Read_delete_Click"  />
                        </div>                       
                    </form>
                </div>
            </div>
        </div>
     <br />
    <br />
    <br />
    <br />   
    </asp:Panel>
</asp:Content>

