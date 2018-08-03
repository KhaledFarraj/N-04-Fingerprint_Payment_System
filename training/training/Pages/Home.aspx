<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="training.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #System_summary {
            background-image: url('../../images/SS_background.png');
            background-position: top center;
            height: 699px;
            position: relative;
            text-align:center;

            margin: 0;
            padding: 0;
        }

        #SS_background {
            background-image: url('../../images/system_summary.png');
            background-position: bottom center;
            background-size: cover;
            width: 100%;
            height: inherit;

            margin: 0;
            padding: 0;

            position: absolute;
            top: 0;
            left: 0;
        }

        #System_plan {
            background-image: url('../../images/System_plan.png');
        }

        #HowTo {
            background-image: url('../../images/start_system.png');
        }

        #System_features {
            background-image: url('../../images/System_features.png');
        }

        .center {
            margin: auto;
            width: 80%;
            padding: 10px;
            font-size: 50px;
        }

        .button {
            background-color: #000; /* Green */
            color:white;
            border: none;
            border-radius:10px;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            /*font-size: 16px;*/
        }

        .black{
            color:#000;
        }

        .particles-js-canvas-el {
            height: inherit !important;
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
    <div id="System_summary">
        <img src="../Images/logo.png"/ />

        <div id="particles-js"></div>
        <div id="SS_background"></div>
    </div>

    <div id="System_plan" style="height: 869px; background-color: #888; position: relative; z-index: 3;"></div>

    <div id="HowTo" style="height: 541px; background-color: white;"></div>

    <div id="System_features" style="height: 873px; background-color: #555; position: relative;">
        <div style="position: absolute; left: 0; bottom: 0;" class="center">
            <asp:Button CssClass="button" Text="Deposite" ID="btn_go_to_Hajj_page" runat="server" OnClick="btn_go_to_Hajj_page_Click"/>
            <asp:Label runat="server" CssClass="black">OR Go Straight To Depositing </asp:Label>
            <asp:Button CssClass="button" Text="Login" ID="btn_login" runat="server" OnClick="btn_login_Click"/>
        </div>
    </div>
</asp:Content>
