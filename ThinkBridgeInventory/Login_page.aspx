<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_page.aspx.cs" Inherits="ThinkBridgeInventory.Login_page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS ------->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="StyleSheet664.css" rel="stylesheet" />
     <title>Login Page</title>
      <script type="text/javascript">
        window.onload = function () {
            noBack();
        }
        function noBack() {
            window.history.forward();
        }
</script>
</head>
<body class="loginpagebackgroung" runat="server">

    <form id="form1" runat="server">
         
        <div id="container">
           
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            
            <asp:Panel ID="Panel3" DefaultButton="btnLogin" HorizontalAlign="center" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LabelUser" runat="server" class="loginlabel">User ID:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtUserName" placeholder="Employee ID" class="generaltextbox" runat="server"> </asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPassWord" runat="server" class="loginlabel">Password:</asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtPassword" placeholder="Password" class="generaltextbox" runat="server" TextMode="Password" OnTextChanged="txtPassword_TextChanged"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                        <td>
                            <asp:Button ID="btnLogin" CssClass="loginbtn" runat="server" OnClick="Login_btn" Text="Login" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>

                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

                        </td>
                    </tr>
                    <tr><td>
                        &nbsp;</td><td align="left">
                            &nbsp;</td></tr>
                    <tr><td>
                        &nbsp;</td><td align="left">
                            &nbsp;</td></tr>
                    
                    <tr>

                    <td>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                        </tr>
                </table>
            </asp:Panel>
           
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        </div>
    </form>
</body>
</html>