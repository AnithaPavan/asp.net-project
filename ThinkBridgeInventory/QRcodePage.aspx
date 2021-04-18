<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRcodePage.aspx.cs" MasterPageFile="~/Masterpage.Master" Inherits="ThinkBridgeInventory.QRcodePage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <br /><br /><br /><br />
    
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">

    <br /><br /><br />
        <asp:Panel ID="Panel1" HorizontalAlign="Center" DefaultButton="ButtonSearch" runat="server">
        <h2 class="auto-style2">        
		<asp:Label ID="Label1" class="generallabel" runat="server">Scan Inventory</asp:Label>
        </h2>
            <br />
        <h2>
            <asp:Label ID="Label2" class="generallabel" runat="server">Unique Code Value:</asp:Label>
            
            <asp:TextBox ID="TextSearch" class="generaltextbox" runat="server" ></asp:TextBox>
        </h2>      
    <br />
            <asp:Button ID="ButtonSearch" OnClick="ButtonSearch_Click" CssClass="submitbtn" Text="Submit" runat="server" style="height: 48px"/>
            <br />
            <asp:Label ID="LabelError" runat="server" Text="Please Enter Unique code!" ForeColor="Red"></asp:Label>
      
      </asp:Panel>
    
</asp:Content>