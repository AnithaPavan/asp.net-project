<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_page.aspx.cs" MasterPageFile="~/Masterpage.Master" Inherits="ThinkBridgeInventory.Home_page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <link href="StyleSheet663.css" rel="stylesheet" /><br /><br />
    <br /><br /><br /><br />
    <h1>
        <asp:Label ID="LabelIM" runat="server" Text="Inventory Management"></asp:Label>
                </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <br />
    
        <div align="center">
            
            <p>
                <asp:Button Style="vertical-align: middle" CssClass="mymainbtn" ID="NewInventory" runat="server" Text="Add new inventory" OnClick="NewInventory_Click" /><br />
                <asp:Button Style="vertical-align: middle" CssClass="mymainbtn" ID="ReadInventory" runat="server" Text="Read Inventory Details" OnClick="ReadInventory_click" /><br />
                <asp:Button Style="vertical-align: middle" CssClass="mymainbtn" ID="UpdateInventory" runat="server" Text="Update Inventory Details" OnClick="UpdateInventory_click"/><br />   
                <asp:Button Style="vertical-align: middle" CssClass="mymainbtn" ID="DeleteInventory" runat="server" Text="Delete Inventory Details" OnClick="DeleteInventory_click"/><br />               
                <asp:Button Style="vertical-align: middle" CssClass="mymainbtn" ID="Query" runat="server" Text="Query Inventory " OnClick="Query_click"/><br />
                <br />
                <br />
               
            </p>
            <br />
        </div>
    </asp:Content>
