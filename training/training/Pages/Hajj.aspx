<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hajj.aspx.cs" Inherits="training.Pages.Hajj" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'kanit', 'sans-serif';
        }

        h2 {
            font-family: 'kanit', 'serif';
            font-weight: bolder;
        }

        .container {
            position: relative;
        }

        .float_right {
            float: right;
        }

        .btn_margin {
            margin-top: 5px;
        }

        .login_textbox {
            width: 90%;
            border-radius: 5px;
        }

        #pilgrimDetails {
            width: 75%;
            border: 3px solid black;
            margin: 5px auto;
        }

        .textbox_width_20 {
            width: 20%;
        }

        .textbox_width_50 {
            width: 50%;
        }

        label {
            margin-bottom: 0px;
            margin-top: 2px;
        }
    </style>
    <script src="../Scripts/particles.js"></script>

    <script>
        /* particlesJS.load(@dom-id, @path-json, @callback (optional)); */
        particlesJS.load('particles-js', '../../Content/particlesjs-config.json', function () {
            console.log('callback - particles.js config loaded');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="width: 40%; text-align: left">
        
        <div id="pilgrimDetails">

            <div id="paymentDetails" style="text-align: center; width: 80%; padding: 5px; margin: 0px auto;">

                <h2>
                    <asp:Localize runat="server" ID="Method_txt" Text="Payment Method" meta:resourcekey="Method_txt" /></h2>

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Card_txt" Text="Payment Card" meta:resourcekey="Card_txt" /></label>
                    </div>
                </div>

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:DropDownList ID="Card_Type" runat="server" meta:resourcekey="Card_TypeResource1">
                            <asp:ListItem Text="Visa" meta:resourcekey="ListItemResource1" />
                            <asp:ListItem Text="MasterCard" meta:resourcekey="ListItemResource2" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Number_txt" Text="Card Number" meta:resourcekey="Number_txt" /></label>
                    </div>
                </div>

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Code_No" meta:resourcekey="Code_NoResource1" />
                    </div>
                </div>

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Expiration_txt" Text="Expiration date and security code" meta:resourcekey="Expiration_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <asp:DropDownList ID="month" runat="server" Height="26px" meta:resourcekey="monthResource1">
                        <asp:ListItem Text="01" meta:resourcekey="ListItemResource3" />
                        <asp:ListItem Text="02" meta:resourcekey="ListItemResource4" />
                        <asp:ListItem Text="03" meta:resourcekey="ListItemResource5" />
                        <asp:ListItem Text="04" meta:resourcekey="ListItemResource6" />
                        <asp:ListItem Text="05" meta:resourcekey="ListItemResource7" />
                        <asp:ListItem Text="06" meta:resourcekey="ListItemResource8" />
                        <asp:ListItem Text="07" meta:resourcekey="ListItemResource9" />
                        <asp:ListItem Text="08" meta:resourcekey="ListItemResource10" />
                        <asp:ListItem Text="09" meta:resourcekey="ListItemResource11" />
                        <asp:ListItem Text="10" meta:resourcekey="ListItemResource12" />
                        <asp:ListItem Text="11" meta:resourcekey="ListItemResource13" />
                        <asp:ListItem Text="12" meta:resourcekey="ListItemResource14" />
                    </asp:DropDownList>

                    <asp:TextBox runat="server" ID="Year" CssClass="textbox_width_20" meta:resourcekey="YearResource1" />

                    <asp:TextBox runat="server" ID="Sec_Code" CssClass="textbox_width_20" meta:resourcekey="Sec_CodeResource1" />

                </div>

                <hr />

                <h2>
                    <asp:Localize runat="server" ID="Information_txt" Text="Billing Information" meta:resourcekey="Information_txt" /></h2>

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Name_txt" Text="Full name" meta:resourcekey="Name_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Name_txtbox" meta:resourcekey="Name_txtboxResource1" />
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="City_txt" Text="City" meta:resourcekey="City_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="City_txtbox" meta:resourcekey="City_txtboxResource1" />
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Address_txt" Text="Billing address" meta:resourcekey="Address_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Address_txtbox" meta:resourcekey="Address_txtboxResource1" />
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Zip_txt" Text="Zip or postal code" meta:resourcekey="Zip_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Zip_txtbox" meta:resourcekey="Zip_txtboxResource1" />
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Currency_txt" Text="Currency" meta:resourcekey="Currency_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Currency_txtbox" meta:resourcekey="Currency_txtboxResource1" />
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Phone_txt" Text="Phone number" meta:resourcekey="Phone_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Phone_txtbox" meta:resourcekey="Phone_txtboxResource1" />
                    </div>
                </div>

                <%--                <asp:Button Text="Continue" runat="server" CssClass="btn btn-success btn_margin" meta:resourcekey="ButtonResource1" />--%>
            </div>

            <div id="paymentRequirements" style="text-align: center; width: 80%; padding: 5px; margin: 0px auto;">
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="ID_txt" Text="Pilgrim ID of the receiver" meta:resourcekey="ID_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="PID_txtbox" meta:resourcekey="PID_txtboxResource1" />
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Money_txt" Text="How much money do you want to send" meta:resourcekey="Money_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Money_txtbox" meta:resourcekey="Money_txtboxResource1" />
                    </div>
                </div>

                <asp:Button Text="Send" runat="server" CssClass="btn btn-success btn_margin" OnClick="btn_send_money_Click" meta:resourcekey="ButtonResource2" />
                <asp:Label Text="" ID="Error" ForeColor="Red" runat="server" />
                <asp:Button Text="Cancel" runat="server" CssClass="btn btn-success btn_margin" meta:resourcekey="Cancel" OnClick="Cancel" />
            </div>


        </div>

    </div>
</asp:Content>
