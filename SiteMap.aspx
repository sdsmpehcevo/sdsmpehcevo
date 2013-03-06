<%@ Page Language="C#" AutoEventWireup="true" Inherits="SiteMap" Codebehind="SiteMap.aspx.cs" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Мапа на сајтот</title>
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
                    <div id="title">
                        <h2>
                            Мапа на сајтот</h2>
                    </div>
                    <div id="site-map">
                        <eo:TreeView ID="tvSiteMap" runat="server" Height="400px" Width="300px" AutoSelectSource="ItemClick"
                            ControlSkinID="None">
                            <TopGroup Style-CssText="border-bottom-style:none;border-bottom-width:0px;border-left-style:none;border-left-width:0px;border-right-style:none;border-right-width:0px;border-top-style:none;border-top-width:0px;color:white;cursor:hand;font-family:Tahoma;font-size:11pt;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;">
                                <Nodes>
                                    <eo:TreeNode Text="Партија">
                                        <SubGroup>
                                            <Nodes>
                                                <eo:TreeNode NavigateUrl="~/ManagementTeam.aspx" Text="Раководство">
                                                </eo:TreeNode>
                                                <eo:TreeNode NavigateUrl="~/JuniorManagementTeam.aspx" Text="ЛК СДММ">
                                                </eo:TreeNode>
                                                <eo:TreeNode NavigateUrl="~/WomenManagementTeam.aspx" Text="Клуб на жени">
                                                </eo:TreeNode>
                                            </Nodes>
                                        </SubGroup>
                                    </eo:TreeNode>
                                    <eo:TreeNode NavigateUrl="~/Archive.aspx" Text="Архива">
                                    </eo:TreeNode>
                                    <eo:TreeNode Text="Мултимедија">
                                        <SubGroup>
                                            <Nodes>
                                                <eo:TreeNode Text="Слики">
                                                </eo:TreeNode>
                                                <eo:TreeNode NavigateUrl="~/Video.aspx" Text="Видео">
                                                </eo:TreeNode>
                                            </Nodes>
                                        </SubGroup>
                                    </eo:TreeNode>
                                    <eo:TreeNode Text="Програма" NavigateUrl="~/Program.aspx">
                                    </eo:TreeNode>
                                    <eo:TreeNode NavigateUrl="~/Contact.aspx" Text="Контакт">
                                    </eo:TreeNode>
                                </Nodes>
                            </TopGroup>
                            <LookNodes>
                                <eo:TreeNode DisabledStyle-CssText="background-color:transparent;border-bottom-style:none;border-left-style:none;border-right-style:none;border-top-style:none;color:Gray;padding-bottom:1px;padding-left:1px;padding-right:1px;padding-top:1px;"
                                    ItemID="_Default" NormalStyle-CssText="PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; COLOR: white; BORDER-TOP-STYLE: none; PADDING-TOP: 1px; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BACKGROUND-COLOR: transparent; BORDER-BOTTOM-STYLE: none"
                                    SelectedStyle-CssText="background-color:#316ac5;border-bottom-color:#999999;border-bottom-style:solid;border-bottom-width:1px;border-left-color:#999999;border-left-style:solid;border-left-width:1px;border-right-color:#999999;border-right-style:solid;border-right-width:1px;border-top-color:#999999;border-top-style:solid;border-top-width:1px;color:White;padding-bottom:0px;padding-left:0px;padding-right:0px;padding-top:0px;">
                                </eo:TreeNode>
                            </LookNodes>
                            <TextBoxStyle CssText="border-bottom-style:none;border-left-style:none;border-right-style:none;border-top-style:none;font-size:XX-Large;" />
                        </eo:TreeView>
                    </div>
                    <div id="error-label">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
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
                    <li><a href="#" id="topRightMenu2_Repeater1_ctl01_HLMenuLink" title="Мапа на сајтот">
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
