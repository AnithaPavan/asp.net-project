<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory_Assign_update.aspx.cs" MasterPageFile="~/Masterpage.Master" Inherits="ThinkBridgeInventory.Inventory_opertion" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <br /><br />
    &nbsp;<br />
    <h1 align="center"><asp:Label ID="LabelIM" runat="server" Text="Inventory Form"></asp:Label></h1>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">   
    <br />
    <asp:Panel ID="Panel1" DefaultButton="Button2" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3" id="form">
                   
                    <br />
                    <form>                        
                        <div class="form-group">
                            <asp:Label ID="LabelProduct_name" class="formtextboxlabel" runat="server" Text="Product Name:"></asp:Label>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxProduct_name" ErrorMessage="*" ForeColor="Red" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat ="server" ErrorMessage="special characters not allowed" ControlToValidate="TextBoxProduct_name" ValidationExpression="^[a-zA-Z0-9\s]*$" ForeColor="Red" Font-Size="Small" ></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TextBoxProduct_name" class="form-control formtextbox" runat="server" ></asp:TextBox>
                        </div>   
                         
                        <div class="form-group">
                            <asp:Label ID="LabelProductDescrp" class="formtextboxlabel" runat="server" Text="Product Description:"></asp:Label>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxProductDescrp" ErrorMessage="*" ForeColor="Red" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat ="server" ErrorMessage="special characters not allowed" ControlToValidate="TextBoxProductDescrp" ValidationExpression="^[a-zA-Z0-9\s]*$" ForeColor="Red" Font-Size="Small" ></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TextBoxProductDescrp" class="form-control formtextbox" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="LabelProductPrice" class="formtextboxlabel" runat="server" Text="Product Price:"></asp:Label>
                            <asp:TextBox ID="TextBoxProductPrice" class="form-control formtextbox" runat="server" TextMode="Number"></asp:TextBox>                            
                        </div>  
                        <div class="form-group">
                            <asp:Label ID="LabelLocation" class="formtextboxlabel" runat="server" Text="Location:"></asp:Label>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxLocation" ErrorMessage="*" ForeColor="Red" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat ="server" ErrorMessage="special characters not allowed" ControlToValidate="TextBoxLocation" ValidationExpression="^[a-zA-Z0-9\s]*$" ForeColor="Red" Font-Size="Small" ></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TextBoxLocation" class="form-control formtextbox" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="LabelModel" class="formtextboxlabel" runat="server" Text="Model:"></asp:Label>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxModel" ErrorMessage="*" ForeColor="Red" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat ="server" ErrorMessage="special characters not allowed" ControlToValidate="TextBoxModel" ValidationExpression="^[a-zA-Z0-9\s]*$" ForeColor="Red" Font-Size="Small" ></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TextBoxModel" class="form-control formtextbox" runat="server"></asp:TextBox>
                        </div>                      
                           <div class="form-group">
                            <asp:Label ID="LabelSupplier" class="formtextboxlabel" runat="server" Text="Supplier:"></asp:Label>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxSupplier" ErrorMessage="*" ForeColor="Red" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat ="server" ErrorMessage="special characters not allowed" ControlToValidate="TextBoxSupplier" ValidationExpression="^[a-zA-Z0-9\s]*$" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TextBoxSupplier" class="form-control formtextbox" runat="server"></asp:TextBox>
                        </div>  
                        <div class="form-group">
                            <asp:Label ID="Labelimage" class="formtextboxlabel" runat="server" Text="Inventory Image upload:"></asp:Label>                            
                            <asp:FileUpload ID="FileUpload1" class="form-control formtextbox" runat="server" onchange="this.form.submit();" />
                            <asp:Image ID="imgPicture" Width="200" Height="200" runat="server" />
                        </div>  
                        
                        <div class="form-group">
                            <asp:Button ID="Button2" runat="server" class="btn myformbtn" Text="Save"  disable="true" Height="60px" Width="100%" OnClick="Button2_Click" />
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

