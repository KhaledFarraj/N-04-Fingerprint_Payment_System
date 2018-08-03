<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Seller.aspx.cs" Inherits="training.Pages.Seller" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .float_right {
            float: right;
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
        <div>
            <div id="BillingDetails" style="text-align: center; width: 80%; padding: 5px; margin: 0px auto; width: 75%; border: 3px solid black; margin: 5px auto;">

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label>
                            <asp:Localize runat="server" ID="Cost_txt" Text="ثمن الفتورة" meta:resourcekey="Cost_txt" /></label>
                    </div>
                </div>
                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox runat="server" ID="Cost_txtbox" meta:resourcekey="Cost_txtboxResource1" />
                    </div>
                </div>

                <br />

                <div class="Row">
                    <div class="col-lg-12 col-md-12 col-sm-2 col-xs-12">
                        <label class="float:left;">
                            <asp:Localize runat="server" ID="FPFU_txt" Text="صورة من البصمة" meta:resourcekey="FPFU_txt" /></label>
                        <asp:FileUpload runat="server" ID="FPFU" CssClass="float_right" meta:resourcekey="FPFUResource1" />
                    </div>
                </div>

                <asp:Button Text="Submit" ID="transfer" runat="server" OnClick="transfer_Click" meta:resourcekey="transferButton" />
                <asp:Label ID="testCompare" runat="server" meta:resourcekey="testCompareResource1"></asp:Label>
                <%--<div class="Row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:FileUpload runat="server" ID="FileUpload1" />
                    <asp:FileUpload runat="server" ID="fileupload2" />
                </div>
            </div>

            <div class="test">


                <asp:Button CssClass="uploadButton" ID="buttonUpload" runat="server" OnClick="buttonUpload_Click" Text="upload Image" />
                <br />
                <asp:Label ID="label1" runat="server"></asp:Label>
                <br />
                <asp:Label ID="label2" runat="server"></asp:Label>

            </div>--%>
                <br />
                .

            </div>
        </div>
    <div id="particles-js"></div>
    </div>
</asp:Content>
