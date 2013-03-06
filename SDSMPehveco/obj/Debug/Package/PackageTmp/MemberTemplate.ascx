<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="MemberTemplate" Codebehind="MemberTemplate.ascx.cs" %>
<div id="member-template" style="height: 200px; width: 500px;">
    <asp:Image ID="MemberImage" runat="server" Height="200px" Width="150px" 
        BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
    <span style="padding:10px;"></span>
    <asp:Label ID="LabelInfo" runat="server" Height="80px" Width="300px"></asp:Label>
</div>
<div class="separator">
</div>
