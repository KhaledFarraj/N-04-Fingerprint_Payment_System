<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="training.Pages.Admin" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        p {
            margin: 0px;
        }

        .Options_container {
            border-radius: 30px;
            background-color: rgba(0,0,0,0);
            border: 10px double #FF5F00;
            margin: 20px auto;
            width: 50%;
            height: 80%;
        }

        #SearchContainer, #AddContainer, #EditContainer {
            width: 75%;
            border: 3px solid #4CAF50; /* Green */
            margin: 5px auto;
        }

        .txt_red {
            color: red;
        }

        .green {
        }

        .col-one {
            border: 2px solid #4CAF50;
            color: #4CAF50;
            margin-bottom: 2px;
            border-radius: 8px;
            /*border-bottom-right-radius: 10px;
            border-top-right-radius: 10px;*/
        }

        .col-two {
            /*border: 2px solid #333;*/
            /*border: 3px solid #4CAF50; /* Green */
            margin-bottom: 2px;
        }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 20px auto;
            border-radius: 8px;
        }

        .hideLable {
            display: none;
        }

        .gvTransactions {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }

        .gvControlDiv {
            margin-left: auto;
            margin-right: auto;
        }

        .gvHeader {
            text-align: center;
        }

        #particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
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
    <div id="particles-js">
        <div class="container" style="text-align: center;">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12" style="height: 200px;">
                    <asp:Button ID="btn_search" CssClass="button" runat="server" Text="أبحث عن حاج" OnClick="btn_search_Click" />
                </div>

                <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12" style="height: 200px;">
                    <asp:Button ID="btn_add" CssClass="button" runat="server" Text="إدخال معلومات حاج" OnClick="btn_add_Click" />
                </div>

                <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12" style="height: 200px;">
                    <asp:Button ID="btn_edit" CssClass="button" runat="server" Text="تعديل معلومات حاج" OnClick="btn_edit_Click" />
                </div>
            </div>


            <hr style="margin: 1px;" />


            <div id="SearchContainer" runat="server">
                <br />

                <h2>
                    <asp:Localize runat="server" ID="Search_title" Text="البحث عن الأشخاص" meta:resourcekey="Search_title" /></h2>


                <div class="row" style="margin-right: 60px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" width="300px">
                        <asp:TextBox runat="server" ID="txt_search_pilgrim" meta:resourcekey="TextBoxResource1"></asp:TextBox>
                        <asp:LinkButton ID="search" Text="ابحث" runat="server" OnClick="search_Click" meta:resourcekey="Search_txt"></asp:LinkButton>
                    </div>
                </div>

                <br />
                <asp:Label runat="server" ID="searchResult" CssClass="txt_red" meta:resourcekey="searchResultResource1">


                    <asp:Localize runat="server" ID="Error_msg" Text="لم يتم العثور على نتائج" meta:resourcekey="Error_msg" /></asp:Label><div id="informationRetrieved" style="text-align: right; width: 80%; padding: 5px; margin: 0px auto;">
                        <%--public ObjectId _id { get; set; }
                public string fullName { get; set; }
                public int hajjId { get; set; }
                public int userId { get; set; }
                public string nationality { get; set; }
                public string residency { get; set; }
                public string fingerPrintHash { get; set; }
                public int HCredit { get; set; }
                public string phone { get; set; }--%>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="Name_txt" Text="الأسم الكامل" meta:resourcekey="Name_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="fullName" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="PID_txt" Text="رقم الحاج" meta:resourcekey="PID_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="pilgrimId" runat="server" meta:resourcekey="LabelResource2"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="User_txt" Text="اسم المستخدم" meta:resourcekey="User_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="userId" runat="server" meta:resourcekey="LabelResource3"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="Nat_txt" Text="الجنسية" meta:resourcekey="Nat_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="nationality" runat="server" meta:resourcekey="LabelResource4"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="Res_txt" Text="مكان الإقامة" meta:resourcekey="Res_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="residency" runat="server" meta:resourcekey="LabelResource5"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="Credit_txt" Text="المبلغ" meta:resourcekey="Credit_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="credit" runat="server" meta:resourcekey="LabelResource6"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-one">
                                <label>
                                    <asp:Localize runat="server" ID="Phone_txt" Text="رقم الجوال" meta:resourcekey="Phone_txt" /></label>
                            </div>

                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-two">
                                <asp:Label ID="phone" runat="server" meta:resourcekey="LabelResource7"></asp:Label>
                            </div>
                        </div>
                    </div>
                <hr />

                <h2>
                    <asp:Localize runat="server" ID="Info_title" Text="قائمة المعاملات" meta:resourcekey="Info_title" /></h2>
                <%--public ObjectId _id { get; set; }
                public string sellerId { get; set; }
                public string .costumerId { get; set; }
                public DateTime transactionDate { get; set; }
                public int amount { get; set; }
                public string status { get; set; }--%>


                <div class="gvControlDiv" runat="server">

                    <asp:PlaceHolder ID="noTransactions" runat="server"></asp:PlaceHolder>
                    <asp:GridView ID="gvTransactions" CssClass="gvTransactions" runat="server" AutoGenerateColumns="False" Width="60%" CellPadding="6" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Seller ID" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <asp:Label ID="sellerId" runat="server" Text='<%#Bind("sellerId")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pilgrim ID" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <asp:Label ID="pilgrimId" runat="server" Text='<%#Bind("costumerId")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction Date" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <asp:Label ID="transactionDate" runat="server" Text='<%#Bind("transactionDate")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transfered Amount" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <asp:Label ID="amount" runat="server" Text='<%#Bind("amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction Status" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <asp:Label ID="status" runat="server" Text='<%#Bind("status")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>


                <%--<div class="row" style="margin: 0px auto; text-align: center; width: 80%;">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="text-align: center;">
                    <label>
                        <asp:Localize runat="server" ID="Seller_txt" Text="رقم البائع" meta:resourcekey="Seller_txt" /></label>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <label>
                        <asp:Localize runat="server" ID="Costmer_txt" Text="رقم الحاج" meta:resourcekey="Costmer_txt" /></label>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                    <label>
                        <asp:Localize runat="server" ID="Date_txt" Text="تاريخ المعاملة" meta:resourcekey="Date_txt" /></label>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                    <label>
                        <asp:Localize runat="server" ID="Credit3_txt" Text="المبلغ" meta:resourcekey="Credit2_txt" /></label>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                    <label>
                        <asp:Localize runat="server" ID="Status_txt" Text="حالة المعاملة" meta:resourcekey="Status_txt" /></label>
                </div>
            </div>--%>
            </div>

            <div id="AddContainer" runat="server">
                <br />

                <h2>
                    <asp:Localize runat="server" ID="Info_title2" Text="إدخال البيانات الشخصية" meta:resourcekey="Info_title2" /></h2>

                <div id="informationDetails" style="text-align: center; width: 80%; padding: 5px; margin: 0px auto;">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Name2_txt" Text="*الأسم الكامل*" meta:resourcekey="Name2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_fullName" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="PID2_txt" Text="*رقم الحاج*" meta:resourcekey="PID2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_pilgrimId" meta:resourcekey="TextBoxResource3" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="User2_txt" Text="اسم المستخدم" meta:resourcekey="User2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_userId" meta:resourcekey="TextBoxResource4" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Nat2_txt" Text="*الجنسية*" meta:resourcekey="Nat2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_nationality" meta:resourcekey="TextBoxResource5" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Ras2_txt" Text="*مكان الإقامة*" meta:resourcekey="Ras2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_residency" meta:resourcekey="TextBoxResource6" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Credit2_txt" Text="المبلغ" meta:resourcekey="Credit2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_credit" meta:resourcekey="TextBoxResource7" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Phone2_txt" Text="*رقم الجوال*" meta:resourcekey="Phone2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_new_phone" meta:resourcekey="TextBoxResource8" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <p runat="server" id="Fingerprint_txt">رفع البصمة</p>
                            <asp:FileUpload ID="fingerPrint" runat="server" />
                        </div>
                    </div>

                    <br />

                    <asp:Button runat="server" Text="تسجيل مستخدم جديد" ID="registerBtn" OnClick="registerBtn_Click" CssClass="btn btn-success" meta:resourcekey="registerBtnResource1" />
                </div>
            </div>

            <div id="EditContainer" runat="server">
                <br />

                <h2>
                    <asp:Localize runat="server" ID="Edit_title" Text="تعديل البيانات الشخصية" meta:resourcekey="Edit_title" /></h2>

                <div id="informationDetailsFilled" style="text-align: center; width: 80%; padding: 5px; margin: 0px auto;">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Name3_txt" Text="الأسم الكامل" meta:resourcekey="Name_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_fullName" meta:resourcekey="TextBoxResource9" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="PID3_txt" Text="*رقم الحاج*" meta:resourcekey="PID2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_pilgrimId" runat="server" Enabled="False" meta:resourcekey="TextBoxResource10"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="User3_txt" Text="اسم المستخدم" meta:resourcekey="User2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_userId" meta:resourcekey="TextBoxResource11" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Nat3_txt" Text="*الجنسية*" meta:resourcekey="Nat2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_nationality" meta:resourcekey="TextBoxResource12" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Ras3_txt" Text="*مكان الإقامة*" meta:resourcekey="Ras2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_residency" meta:resourcekey="TextBoxResource13" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Credit4_txt" Text="*المبلغ*" meta:resourcekey="Credit_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_credit" meta:resourcekey="TextBoxResource14" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Localize runat="server" ID="Localize1" Text="*رقم الجوال*" meta:resourcekey="Phone2_txt" /></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txt_edit_phone" meta:resourcekey="TextBoxResource15" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <br />

                    <asp:Button runat="server" Text="تعديل بيانات المستخدم" ID="editPilgrimInfo" OnClick="editPilgrimInfo_Click" PostBackUrl="~/Pages/Admin.aspx" CssClass="btn btn-success" meta:resourcekey="Button1Resource1" />
                </div>


            </div>
            <asp:Button Text="Logout" runat="server" CssClass="btn btn-success btn_margin" meta:resourcekey="ButtonResource1" OnClick="LOGOUT" />
        </div>
    </div>
</asp:Content>
