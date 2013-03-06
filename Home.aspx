<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Src="NewsTemplate.ascx" TagName="NewsTemplate" TagPrefix="uc3" %>
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
    <!-- Slider style and script -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="Scripts/galleria-1.2.9.min.js" type="text/javascript"></script>
    <style>
        #galleria
        {
            height: 320px;
        }
    </style>
    <!-- JQuery script -->
    <script src="Scripts/jquery-1.9.0.min.js" type="text/javascript"></script>
</head>
<body>
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
		                    <li><a href="#">Почетна</a></li>
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
                        <a href="#">
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
                    <div id="galleria">
                        <img src="Images/Slider/gore1.jpg" data-title="СДСМ" data-description="" />
                        <img src="Images/Slider/gore0.jpg" />
                        <img src="Images/Slider/gore2.jpg" />
                        <img src="Images/Slider/gore3.jpg" />
                        <img src="Images/Slider/gore4.jpg" />
                        <img src="Images/Slider/gore9.jpg" />
                    </div>
                    <div id="news-wrapper">
                        <div id="news-title" style="margin: 0 0 5px 5px;">
                            <h2>
                                Актуелно</h2>
                        </div>
                        <div class="separator">
                        </div>
                        <div id="news-container">
                            <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" Width="100%"
                                OnRowDataBound="gvNews_RowDataBound" BorderStyle="None" GridLines="None" ShowHeader="False">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <uc3:NewsTemplate ID="newsTmp" runat="server" />
                                        </ItemTemplate>
                                        <ControlStyle BorderStyle="None" />
                                        <ItemStyle BorderStyle="None" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BorderStyle="None" />
                                <PagerSettings FirstPageText="прва" LastPageText="последна" Mode="NumericFirstLast"
                                    NextPageText="следна" PreviousPageText="претходна" />
                                <PagerStyle BorderStyle="None" Font-Bold="True" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                        <div id="archiveButton" style="float: right;">
                            <asp:HyperLink ID="hplArchive" runat="server" ForeColor="White" Font-Bold="true"
                                NavigateUrl="~/Archive.aspx">>>Архива</asp:HyperLink>
                        </div>
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
                    <li id="topRightMenu2_Repeater1_ctl00_liHome"><a href="#" id="topRightMenu2_Repeater1_ctl00_HLHome">
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
    <script type="text/javascript">
        Galleria.loadTheme('galleria.classic.min.js');
        Galleria.run('#galleria');
    </script>
    </form>
</body>
</html>
