<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Најава Администратор</title>
    <!-- Title icon -->
    <link rel="SHORTCUT ICON" href="~/Images/sdsm.ico" type="image/x-icon" />
    <!-- Main style -->
    <link href="Styles/style.css" rel="stylesheet" type="text/css" />
    <!-- DropDownMenu style -->
    <link href="Styles/style-dropdownmenu.css" rel="stylesheet" type="text/css" />
    <!-- Slider style -->
    <link href="Styles/nivo-slider.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/themes/light/light.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/themes/default/default.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/themes/dark/dark.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/themes/bar/bar.css" rel="stylesheet" type="text/css" />
    <link href="Styles/style-slider.css" rel="stylesheet" type="text/css" />
    <!-- JQuery script -->
    <script src="Scripts/jquery-1.9.0.min.js" type="text/javascript"></script>
    <!-- LoginBox style -->
    <link href="Styles/login-box.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main-wrapper">
        <div id="header-container">
            <div id="slogan" class="slogan">
                <img title="Имаме решенија" src="Images/resenija.gif" style="border-width: 0px;">
            </div>
        </div>
        <div id="content-container">
            <div style="padding: 80px 0 150px 250px;">
                <div id="login-box">
                    <h2>
                        Најавете се</h2>
                    <div id="login-box-name" style="margin-top: 20px;">
                        Username:</div>
                    <div id="login-box-field" style="margin-top: 20px;">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-login" ToolTip="Username"
                            MaxLength="2048"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="login-box-name">
                        Password:</div>
                    <div id="login-box-field">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-login" ToolTip="Password"
                            MaxLength="2048" TextMode="Password"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <br />
                    <div class="login-box-options">
                        <asp:CheckBox ID="chkRemember" runat="server" />
                        Задржи ме најавен
                    </div>
                    <br />
                    <br />
                    <span style="float: right; padding-right: 30px;">
                        <asp:Button ID="btnLogin" CssClass="button" runat="server" 
                        OnClick="btnLogin_Click" Text="Најава" Width="100px" />
                    </span>
                </div>
            </div>
            <div id="error-label">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </div>
        </div>
        <div class="reklami">
                <img src="Images/reklami.jpg" alt="СДСМ" />
            </div>
        <div class="footerMenu">
            <ul>
                <li id="topRightMenu2_Repeater1_ctl00_liHome"><a href="Home.aspx" id="topRightMenu2_Repeater1_ctl00_HLHome">
                    Дома</a></li>
                <li><a href="SiteMap.aspx" id="topRightMenu2_Repeater1_ctl01_HLMenuLink" title="Мапа на сајтот">Мапа на
                    сајтот</a></li>
                <li><a href="Program.aspx" id="topRightMenu2_Repeater1_ctl02_HLMenuLink" title="Програма">Програма</a></li>
                <li><a href="Contact.aspx" id="topRightMenu2_Repeater1_ctl03_HLMenuLink" title="Контакт" class="noborder">Контакт</a></li>
            </ul>
        </div>
        <br class="spacer" />
        <div class="footer">
            <p>
                ул. "Индустриска" бб 2326 Пехчево, Република Македонија, Контакт e-mail:<a href="mailto:sdsmpehcevo@gmail.com">sdsmpehcevo@gmail.com</a>
            </p>
            <p class="small">
                Copyright © 2013, Социјалдемократски Сојуз на Македонија OO Пехчево. Сите права
                се задржани
            </p>
        </div>
        <!-- end #mainWrap -->
    </div>
    <script type="text/javascript" src="Scripts/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
    </form>
</body>
</html>
