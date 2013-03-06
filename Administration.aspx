<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administration.aspx.cs" Inherits="Administration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Дел за администрација</title>
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
    <!-- ConfirmationBoxDialog script -->
    <script type="text/javascript">
        function confirmDeleteResult(v, m, f) {
            if (v) //user clicked OK 
                $('#' + f.hidID).click();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main-wrapper">
        <div id="header-container">
            <div id="slogan" class="slogan">
                <img title="Имаме решенија" src="Images/resenija.gif" style="border-width: 0px;">
            </div>
        </div>
        <div id="title-admin">
            <div id="title">
                <h2>
                    Дел за администрација
                </h2>
            </div>
            <div id="logout">
                <asp:LinkButton CssClass="button" ID="lnkLogOut" runat="server" OnClick="lnkLogOut_Click">Одјава</asp:LinkButton>
            </div>
        </div>
        <div class="separator">
        </div>
        <div id="content-container">
            <div id="error-label">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </div>
            <div id="title">
                <h3>
                    Вести/Новости (Додади / Измени / Избриши вести)</h3>
            </div>
            <div class="separator">
            </div>
            <div id="insert-news">
                <div id="add-news">
                    <div id="login-box-name" style="margin-top: 20px;">
                        Наслов:</div>
                    <div id="login-box-field" style="margin-top: 20px;">
                        <asp:TextBox ID="txtNewsTitle" runat="server" CssClass="form-login" ToolTip="Име"
                            MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNewsTitle"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group3"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="login-box-name">
                        Содржина:</div>
                    <div id="login-box-field">
                        <asp:TextBox ID="txtNewsDescription" runat="server" CssClass="form-login" ToolTip="Име"
                            ValidationGroup="group3" TextMode="MultiLine" Height="150px"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNewsDescription"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group3"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="login-box-name">
                        Слика/и:</div>
                    <div id="login-box-field">
                        <asp:FileUpload ID="fuNewsImage" runat="server" CssClass="uploader" />
                        <div class="media-list">
                            <div style="float: left; width=20%; padding-right: 20px;">
                                <asp:Button ID="btnAddNewsImage" runat="server" Text=" + " CssClass="button" ValidationGroup="group3"
                                    OnClick="btnAddNewsImage_Click" Width="36px" />
                                <br />
                                <asp:Button ID="btnRemoveNewsImage" runat="server" Text=" - " CssClass="button" ValidationGroup="group3"
                                    Width="36px" OnClick="btnRemoveNewsImage_Click" />
                            </div>
                            <div style="float: left; width=80%;">
                                <asp:ListBox ID="lbxNewsImages" runat="server" Width="168px"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div id="login-box-name">
                        YouTube линк за видео:</div>
                    <div id="login-box-field">
                        <asp:TextBox ID="txtNewsVideo" runat="server" CssClass="form-login" ToolTip="Име"
                            ValidationGroup="group3"></asp:TextBox>
                        <div class="media-list">
                            <div style="float: left; width=20%; padding-right: 20px;">
                                <asp:Button ID="btnAddNewsVideo" runat="server" Text=" + " CssClass="button" ValidationGroup="group3"
                                    OnClick="btnAddNewsVideo_Click" Width="36px" />
                                <br />
                                <asp:Button ID="btnRemoveNewsVideo" runat="server" Text=" - " CssClass="button" ValidationGroup="group3"
                                    Width="36px" OnClick="btnRemoveNewsVideo_Click" />
                            </div>
                            <div style="float: left; width=80%;">
                                <asp:ListBox ID="lbxNewsVideos" runat="server" Width="168px"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div id="button">
                        <asp:Button ID="btnAddNews" runat="server" Text="Додади вест" CssClass="button" ValidationGroup="group3"
                            OnClick="btnAddNews_Click" />
                    </div>
                </div>
                <div id="deleteNewsGrid">
                    <asp:GridView ID="gvDeleteNews" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="news_id" OnPageIndexChanging="gvDeleteNews_PageIndexChanging" OnRowDataBound="gvDeleteNews_RowDataBound"
                        OnRowDeleting="gvDeleteNews_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Наслов">
                                <HeaderStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="date" HeaderText="Датум">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Избриши" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDeleteNews" CommandArgument='<%# Eval("news_id") %>' CommandName="Delete"
                                        runat="server" ForeColor="Red">Избриши</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="news_id" Visible="False" />
                        </Columns>
                        <HeaderStyle Font-Bold="True" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
            <div class="separator">
            </div>
            <div id="title">
                <h3>
                    Раководство (Додади / Измени / Избриши членови)</h3>
            </div>
            <div class="separator">
            </div>
            <div id="insesrt-member">
                <div id="add-member">
                    <div id="login-box-name" style="margin-top: 20px;">
                        Име:</div>
                    <div id="login-box-field" style="margin-top: 20px;">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-login" ToolTip="Име" MaxLength="2048"
                            ValidationGroup="group"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="login-box-name">
                        Презиме:</div>
                    <div id="login-box-field">
                        <asp:TextBox ID="txtSurname" runat="server" CssClass="form-login" ToolTip="Презиме"
                            MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSurname"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="login-box-name">
                        Email:</div>
                    <div id="login-box-field">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-login" ToolTip="Email" MaxLength="2048"
                            ValidationGroup="group"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ValidationGroup="group"></asp:RegularExpressionValidator>
                        </span>
                    </div>
                    <div id="login-box-name">
                        Улога:</div>
                    <div id="drop-down-field">
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="drop-down" ToolTip="Улога">
                            <asp:ListItem Value="pretsedatel">pretsedatel</asp:ListItem>
                            <asp:ListItem Value="pretsedatelM">pretsedatelM</asp:ListItem>
                            <asp:ListItem Value="sekretar">sekretar</asp:ListItem>
                            <asp:ListItem Value="sekretarM">sekretarM</asp:ListItem>
                            <asp:ListItem Value="koordinatorZ">koordinatorZ</asp:ListItem>
                            <asp:ListItem Value="clenIO">clenIO</asp:ListItem>
                            <asp:ListItem Value="clenNO">clenNO</asp:ListItem>
                            <asp:ListItem Value="clenIOM">clenIOM</asp:ListItem>
                            <asp:ListItem Value="clenNOM">clenNOM</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div id="login-box-name">
                        Слика:</div>
                    <div id="drop-down-field">
                        <asp:FileUpload ID="fuImage" runat="server" CssClass="uploader" />
                    </div>
                    <div id="button">
                        <asp:Button ID="btnAddMember" runat="server" Text="Додади член" CssClass="button"
                            OnClick="btnAddMember_Click" ValidationGroup="group" />
                    </div>
                </div>
                <div id="updateGrid">
                    <asp:GridView ID="gvUpdate" runat="server" AllowPaging="True" DataKeyNames="member_id"
                        PageSize="20" AutoGenerateColumns="False" OnPageIndexChanging="gvUpdate_PageIndexChanging"
                        OnRowCancelingEdit="gvUpdate_RowCancelingEdit" OnRowEditing="gvUpdate_RowEditing"
                        OnRowUpdating="gvUpdate_RowUpdating" OnRowDeleting="gvUpdate_RowDeleting" OnRowDataBound="gvUpdate_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" SortExpression="ID" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtID" runat="server" Text='<%# Eval("member_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewID" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("member_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Име" SortExpression="Име">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Презиме" SortExpression="Презиме">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSurname" runat="server" Text='<%# Eval("surname") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewSurname" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSurname" runat="server" Text='<%# Bind("surname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Улога">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cmbRole" runat="server" SelectedValue='<%# Eval("role") %>'>
                                        <asp:ListItem Value="pretsedatel" Text="pretsedatel"></asp:ListItem>
                                        <asp:ListItem Value="pretsedatelM" Text="pretsedatelM"></asp:ListItem>
                                        <asp:ListItem Value="sekretar" Text="sekretar"></asp:ListItem>
                                        <asp:ListItem Value="sekretarM" Text="sekretarM"></asp:ListItem>
                                        <asp:ListItem Value="koordinatorZ" Text="koordinatorZ"></asp:ListItem>
                                        <asp:ListItem Value="clenIO" Text="clenIO"></asp:ListItem>
                                        <asp:ListItem Value="clenNO" Text="clenNO"></asp:ListItem>
                                        <asp:ListItem Value="clenIOM" Text="clenIOM"></asp:ListItem>
                                        <asp:ListItem Value="clenNOM" Text="clenNOM"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRole" runat="server" Text='<%# Eval("role") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="cmbNewRole" runat="server">
                                        <asp:ListItem Selected="True" Value="pretsedatel" Text="pretsedatel"></asp:ListItem>
                                        <asp:ListItem Value="pretsedatelM" Text="pretsedatelM"></asp:ListItem>
                                        <asp:ListItem Value="sekretar" Text="sekretar"></asp:ListItem>
                                        <asp:ListItem Value="sekretarM" Text="sekretarM"></asp:ListItem>
                                        <asp:ListItem Value="koordinatorZ" Text="koordinatorZ"></asp:ListItem>
                                        <asp:ListItem Value="clenIO" Text="clenIO"></asp:ListItem>
                                        <asp:ListItem Value="clenNO" Text="clenNO"></asp:ListItem>
                                        <asp:ListItem Value="clenIOM" Text="clenIOM"></asp:ListItem>
                                        <asp:ListItem Value="clenNOM" Text="clenNOM"></asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Слика" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fupImage" runat="server" Width="85px" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblImagUrl" runat="server" Text='<%# Eval("image_url") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:FileUpload ID="fupNewImage" runat="server" />
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" HeaderText="Уредување" ShowEditButton="True"
                                UpdateText="Промени">
                                <ItemStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Yellow" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Избриши" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" CommandArgument='<%# Eval("member_id") %>' CommandName="Delete"
                                        runat="server" ForeColor="Red">Избриши</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
            <div class="separator">
            </div>
            <div id="title">
                <h3>
                    Видео Галерија (Додади / Измени / Избриши видео)</h3>
            </div>
            <div class="separator">
            </div>
            <div id="insert-video">
                <div id="add-video">
                    <div id="login-box-name" style="margin-top: 20px;">
                        Наслов:</div>
                    <div id="login-box-field" style="margin-top: 20px;">
                        <asp:TextBox ID="txtVideoTitle" runat="server" CssClass="form-login" ToolTip="Наслов"
                            MaxLength="2048" ValidationGroup="group"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVideoTitle"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="login-box-name" style="margin-top: 10px;">
                        YouTube линк:</div>
                    <div id="login-box-field" style="margin-top: 20px;">
                        <asp:TextBox ID="txtVideoUrl" runat="server" CssClass="form-login" ToolTip="YouTube линк"
                            MaxLength="2048" ValidationGroup="group2"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVideoUrl"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="button">
                        <asp:Button ID="btnAddVideo" runat="server" Text="Додади видео" CssClass="button"
                            ValidationGroup="group2" OnClick="btnAddVideo_Click" />
                    </div>
                </div>
                <div id="updateVideoGrid">
                    <asp:GridView ID="gvUpdateVideo" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvUpdateVideo_RowDataBound"
                        DataKeyNames="video_id" OnRowCancelingEdit="gvUpdateVideo_RowCancelingEdit" OnRowDeleting="gvUpdateVideo_RowDeleting"
                        OnRowEditing="gvUpdateVideo_RowEditing" OnRowUpdating="gvUpdateVideo_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="video_id" HeaderText="ID" Visible="False" />
                            <asp:BoundField DataField="title" HeaderText="Наслов" />
                            <asp:BoundField DataField="video_url" HeaderText="YouTube линк" />
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" ShowEditButton="True" UpdateText="Промени"
                                HeaderText="Уредување">
                                <ItemStyle Font-Bold="True" ForeColor="Yellow" HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Избриши" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" CommandArgument='<%# Eval("video_id") %>' CommandName="Delete"
                                        runat="server" ForeColor="Red">Избриши</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="separator">
            </div>
            <div id="title">
                <h3>
                    Галерија на слики (Додади / Измени / Избриши слики)</h3>
            </div>
            <div class="separator">
            </div>
            <div id="insert-album">
                <div id="add-album">
                    <div id="Div1" style="margin-top: 20px;">
                        Име на албумот:</div>
                    <div id="Div2" style="margin-top: 10px;">
                        <asp:TextBox ID="txtAlbumName" runat="server" CssClass="form-login" ToolTip="Име"
                            ValidationGroup="group" Width="285px"></asp:TextBox>
                        <span style="padding-right: 3px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAlbumName"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="group6"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div id="Div3" style="margin-top: 20px;">
                        Слики:</div>
                    <div id="Div4" style="margin-top: 10px;">
                        <asp:FileUpload ID="fuAlbumImage" runat="server" CssClass="uploader" Height="36px" />
                        <asp:Button ID="btnAddAlbumImage" runat="server" Text=" + " CssClass="button" ValidationGroup="group6"
                            Width="36px" Height="36px" OnClick="btnAddAlbumImage_Click" />
                        <asp:Button ID="btnRemoveAlbumImage" runat="server" Text=" - " CssClass="button"
                            ValidationGroup="group6" Width="36px" OnClick="btnRemoveAlbumImage_Click" />
                    </div>
                    <div id="Div5" style="margin-top: 10px;">
                        <asp:ListBox ID="lbxAlbumImages" runat="server" Width="285px" Height="100px"></asp:ListBox>
                    </div>
                    <div id="Div6" style="margin-top: 20px; margin-bottom: 50px; float: right;">
                        <asp:Button ID="btnAddAlbum" runat="server" Text="Додади албум" CssClass="button"
                            ValidationGroup="group6" OnClick="btnAddAlbum_Click" /></div>
                </div>
                <div id="deleteNewsGrid">
                    <asp:GridView ID="gvDeleteAlbum" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="album_id" OnPageIndexChanging="gvDeleteAlbum_PageIndexChanging"
                        OnRowDataBound="gvDeleteAlbum_RowDataBound" 
                        OnRowDeleting="gvDeleteAlbum_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="album_name" HeaderText="Име на албум">
                                <HeaderStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="date" HeaderText="Датум">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Избриши" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDeleteAlbum" CommandArgument='<%# Eval("album_id") %>' CommandName="Delete"
                                        runat="server" ForeColor="Red">Избриши</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="album_id" Visible="False" />
                        </Columns>
                        <HeaderStyle Font-Bold="True" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
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
                <li><a href="Program.aspx" id="topRightMenu2_Repeater1_ctl02_HLMenuLink"
                    title="Програма">Програма</a></li>
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
