<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BecomeMember.aspx.cs" Inherits="BecomeMember" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Стани член на СДСМ</title>
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
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <script>        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));</script>
    <form id="form1" runat="server">
    <div id="main-wrapper">
        <div id="header-container">
            <div id="slogan" class="slogan">
                <img title="Имаме решенија" src="Images/resenija.gif" style="border-width: 0px;">
            </div>
        </div>
        <div id="navigation">
            <nav>
	                    <ul id="navbar">
                            <li><a href="#"><img title="Стани член" src="Images/navbutt.jpg" /></a></li>
		                    <li><a href="Home.aspx">Почетна</a></li>
		                    <li><a href="#">Партија</a>
                                <ul>
				                    <li><a href="ManagementTeam.aspx">Раководство</a></li>     
                                    <li><a href="JuniorManagementTeam.aspx">ЛК СДММ</a></li>
                                    <li><a href="WomenManagementTeam.aspx">Клуб на жени</a></li>                     				                
                    			</ul>
                            </li>
		                    <li><a href="Archive.aspx">Архива </a></li>
		                    <li><a href="#">Мултимедија</a>
                                <ul>
				                    <li><a href="Images.aspx">Слики</a></li>     
                                    <li><a href="Video.aspx">Видео</a></li>                                                   				                
                    			</ul>
                            </li>
                            <li><a href="Program.aspx">Програма</a></li>
                            <li><a href="Contact.aspx">Контакт</a></li>                            
	                    </ul>
                    </nav>
        </div>
        <div class="separator">
            <div id="content-container">
                <div id="content-left">
                    <div id="logo-home">
                        <a href="Home.aspx">
                            <img title="СДСМ Пехчево" src="Images/logo.jpg" /></a>
                    </div>
                    <div id="facebook">
                        <div class="fb-like-box" data-href="http://www.facebook.com/pages/%D0%94%D1%80%D0%B0%D0%B3%D0%B0%D0%BD-%D0%A2%D1%80%D0%B5%D0%BD%D1%87o%D0%B2%D1%81%D0%BA%D0%B8-%D0%BA%D0%B0%D0%BD%D0%B4%D0%B8%D0%B4%D0%B0%D1%82-%D0%B7%D0%B0-%D0%93%D1%80%D0%B0%D0%B4%D0%BE%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%BD%D0%B8%D0%BA-%D0%BD%D0%B0-%D0%9E%D0%BF%D1%88%D1%82%D0%B8%D0%BD%D0%B0-%D0%9F%D0%B5%D1%85%D1%87%D0%B5%D0%B2%D0%BE/509779149086369"
                            data-width="225" style="height: 450px" data-show-faces="false" data-stream="true"
                            data-header="true">
                        </div>
                    </div>
                    <div id="twitter">
                        <a class="twitter-timeline" href="https://twitter.com/SDSMakedonija" data-widget-id="308907928482611200">
                            Tweets by @SDSMakedonija</a>
                        <script>                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
                    </div>
                </div>
                <div id="content-right">
                    <div id="title">
                        <h2>
                            Станете член на СДСМ</h2>
                    </div>
                    <div id="error-label">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>
                    <div id="become-member-box">
                        <br />
                        Зачлени се и придонеси кон остварување на политичките решенија на СДСМ Пехчево.
                        Решенија кои секогаш ќе ја водат државата во насока: за подобро утре, за подобар
                        живот, за посилна економија... Решенија кои се стабилни, развојни и напредни.
                        <br />
                        <br />
                        <span class="style1">Напомена: Пополнуваат само граѓани кои немаат членска книшка на
                            СДСМ.</span>
                        <div style="margin-top: 20px;">
                            Име и презиме:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtName" runat="server" CssClass="become-member-form" ToolTip="Име и презиме"
                                MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                            <span style="padding-right: 3px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="group"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                        <div style="margin-top: 10px;">
                            Адреса:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="become-member-form" ToolTip="Адреса"
                                MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                            <span style="padding-right: 3px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="group"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                        <div style="margin-top: 10px;">
                            Место:</div>
                        <div style="margin-top: 5px;">
                            <select name="" runat="server" id="ddlMunicipalities" style="height: 17px; width: 135px;">
                                <option value="Пехчево">Пехчево</option>
                                <option value="Црник">Црник</option>
                                <option value="Робово">Робово</option>
                                <option value="Умлена">Умлена</option>
                                <option value="Чифлик">Чифлик</option>
                                <option value="Негрево">Негрево</option>
                                <option value="Панчарево">Панчарево</option>
                            </select>
                        </div>
                        <div style="margin-top: 10px;">
                            Email:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="become-member-form" ToolTip="Email"
                                MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                            <span style="padding-right: 3px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="group"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="group"></asp:RegularExpressionValidator>
                            </span>
                        </div>
                        <div style="margin-top: 10px;">
                            Телефон:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="become-member-form" ToolTip="Телефон"
                                MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                            <span style="padding-right: 3px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="group"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="group" ValidationExpression="\d{9}\d*"></asp:RegularExpressionValidator>
                            </span>
                        </div>
                        <div style="margin-top: 10px;">
                            Образование:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtEducation" runat="server" CssClass="become-member-form" ToolTip="Образование"
                                MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                        </div>
                        <div style="margin-top: 10px;">
                            Работа:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtJob" runat="server" CssClass="become-member-form" ToolTip="Работа"
                                MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                        </div>
                        <div style="margin-top: 10px;">
                            Коментар:</div>
                        <div style="margin-top: 5px;">
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="become-member-form"
                                ToolTip="Коментар" ValidationGroup="group" Height="50px"></asp:TextBox>
                        </div>
                        <br />
                        <span style="float: left; padding-left: 125px;">
                            <asp:Button ID="btnBecomeMember" CssClass="button" runat="server" Text="Испрати"
                                Width="100px" ValidationGroup="group" OnClick="btnBecomeMember_Click" />
                        </span>
                    </div>
                </div>
            </div>
            <div class="reklami">
                <img src="Images/reklami.jpg" alt="СДСМ" />
            </div>
            <div class="footerMenu">
                <ul>
                    <li id="topRightMenu2_Repeater1_ctl00_liHome"><a href="Home.aspx" id="topRightMenu2_Repeater1_ctl00_HLHome">
                        Дома</a></li>
                    <li><a href="SiteMap.aspx" id="topRightMenu2_Repeater1_ctl01_HLMenuLink" title="Мапа на сајтот">
                        Мапа на сајтот</a></li>
                    <li><a href="Program.aspx" id="topRightMenu2_Repeater1_ctl02_HLMenuLink" title="Програма">
                        Програма</a></li>
                    <li><a href="Contact.aspx" id="topRightMenu2_Repeater1_ctl03_HLMenuLink" title="Контакт"
                        class="noborder">Контакт</a></li>
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
