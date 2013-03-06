<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="VideoTemplate" Codebehind="VideoTemplate.ascx.cs" %>
<div class="video">
    <h2>
        <asp:Label ID="LabelTitle" runat="server"></asp:Label></h2>
    <br />
    <div id="video" runat="server">
        <iframe runat="server" class="video" width="500" height="305" id="player" type="text/html" frameborder="0">
        </iframe>
    </div>
    <br />
</div>
<div class="separator">
</div>
