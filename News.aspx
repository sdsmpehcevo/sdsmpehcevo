<%@ Page Language="C#" AutoEventWireup="true" Inherits="News" Codebehind="News.aspx.cs" %>

<%@ Register Src="~/VideoTemplate2.ascx" TagName="VideoTemplate2" TagPrefix="uc4" %>
<%@ Register Src="~/ImageTemplate.ascx" TagName="ImageTemplate" TagPrefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>СДСМ Пехчево</title>
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
    <!-- Lightbox scripts and Styles -->
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/lightbox.js" type="text/javascript"></script>
    <link href="Styles/lightbox.css" rel="stylesheet" type="text/css" />
    <link href="Styles/lightbox-screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function url() {
            comments.setAttribute('data-href', document.URL);
            like.setAttribute('data-href', document.URL);
        }
    </script>
</head>
<body onload="url();">
    <div id="fb-root">
    </div>
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
                            <li><a href="BecomeMember.aspx"><img title="Стани член" src="Images/navbutt.jpg" /></a></li>
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
                    <div id="logo" style="margin: 5px 0 0 5px;">
                        <img src="Images/sdsm-pehcevo.png" />
                    </div>
                    <div id="error-label">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>
                    <div id="news" style="margin: 0px 0 20px 5px; width: 680px;" runat="server">
                        <div>
                            <div class="title-picture">
                                <asp:Image ID="imgTitleImage" runat="server" Width="200px" Height="180px" BorderColor="White"
                                    BorderStyle="Solid" BorderWidth="1px" />
                            </div>
                            <div class="news-title-box">
                                <h1>
                                    <asp:Label ID="lblNewsTitle" runat="server" Text=""></asp:Label></h1>
                                <br />
                                Објавено на:
                                <asp:Label ID="lblNewsDate" runat="server" Text=""></asp:Label>
                                <br />
                                <br />
                                <div id="like" class="fb-like" data-href="" data-send="true" data-layout="standard"
                                    data-width="400" data-show-faces="true">
                                </div>
                            </div>
                        </div>
                        <div class="news-content">
                            <asp:Label ID="lblNewsContent" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="newsVideo" runat="server">
                            <asp:Label ID="lblVideo" runat="server" Text="" Style="font-style: italic"></asp:Label>
                        </div>
                        <div id="newsImage">
                            <asp:Label ID="lblImages" runat="server" Text="" Style="font-style: italic"></asp:Label>
                            <div id="newsImages" runat="server">
                            </div>
                        </div>
                    </div>
                    <div id="comments" runat="server" style="margin: 0 auto; background-color: White;" class="fb-comments"
                        data-href="" data-width="690" data-num-posts="10">
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
