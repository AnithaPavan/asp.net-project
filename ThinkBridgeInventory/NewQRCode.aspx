<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewQRCode.aspx.cs" MasterPageFile="~/Masterpage.Master" Inherits="ThinkBridgeInventory.NewQRCode" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <br /><br /><br /><br />
    <h1 align="center"><asp:Label ID="LabelQRcode" runat="server" Text="New Unique Code"></asp:Label></h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <br />
    <br />                     
            
            <div align="center">
                <h2>
                    <asp:Label ID="LabelQRGenerated" runat="server" class="generallabel" Text="Unique Code Generated: "></asp:Label>
                    <asp:Label ID="pkvalue" runat="server" class="generallabel" Text="pkvalue"></asp:Label>
                </h2>                
                                                           
        </div>
           <div align="center">
               <asp:Panel ID="Panel1" DefaultButton="PrintQRcode" runat="server">
                <p>                                              
                    <asp:Button ID="PrintQRcode" CssClass="mybigbtn" runat="server" Text="Go to Nextpage" OnClick="PrintQRcode_Click" />
                </p>    
                 </asp:Panel>       
        </div>
    </asp:Content>


