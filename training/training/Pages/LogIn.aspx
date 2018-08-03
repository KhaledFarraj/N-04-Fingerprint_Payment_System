<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="training.Pages.LogIn"  Culture="auto" meta:resourcekey="PageResource1" UICulture="auto"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        p {
            margin: 0px;
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

        #top_right_corner {
            position: absolute;
            left: 0px;
            top: 0px;
            z-index: -1;
            width: 100%;
            height: 100%;
            background-color: #ff6a00;
            
        }
        .TRC_buttons {
            position: absolute;
            top: 0px;
            left: 100%;
            z-index: -1;
            background-color: aqua;
            width: 60px;
            height: 60px
        }
        .TRC_buttons_2 {
            position: absolute;
            top: -10%;
            left: 90%;
            z-index: -2;
            background-color: blue;
            width: 60px;
            height: 60px
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
    <div>
    <div class ="container" style="border:solid 3px black; width: 20%;margin-top:200px; margin-right:auto; margin-left:auto; text-align:center; padding: 10px;">
        

        <div id="top_right_corner">
            <div class="TRC_buttons">

            </div>
            <div class="TRC_buttons_2">

            </div>
        </div>


        
<%--        <div id="pilgrimLogin">
             <div class ="Row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p runat="server" id="PID">رقم الحاج</p>
                </div>
            </div>
            <div class="row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:TextBox runat="server" ID="PID_txt" CssClass="login_textbox"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Button runat="server" Text="تسجيل الدخول" CssClass="btn btn-success btn_margin" OnClick="pilgrimRedirect"/>
                </div>
            </div>
        </div>--%>

        <div id="adminLogin">
             <div class ="Row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p runat="server" id="user"> <asp:Localize runat="server" Text="User Name" meta:resourcekey="user" /></p>
                </div>
            </div>
            <div class="row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:TextBox runat="server" ID="user_txt" CssClass="login_textbox" meta:resourcekey="user_txtResource1" Required="true"></asp:TextBox>
                </div>
            </div>

             <div class ="Row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                   <p runat="server" id="password">
                        <asp:Localize runat="server" Text="Password" meta:resourcekey="password" /></p>
                </div>
            </div>
            <div class="row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:TextBox runat="server" ID="password_txt" CssClass="login_textbox" meta:resourcekey="password_txtResource1" Required="true"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class ="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Button runat="server" Text="تسجيل الدخول" CssClass="btn btn-success btn_margin" OnClick="adminRedirect"  meta:resourcekey="ButtonResource2"/>
                </div>
            </div>
        </div>
    </div>
    <div id="particles-js"></div>
        </div>
</asp:Content>
