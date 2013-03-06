<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsTemplate.ascx.cs"
    Inherits="NewsTemplate" %>
<div id="newsMain" style="height: 100px; width: 500px; padding:10px;">
    <div id="newsImage" style="float:left; padding:0 10px 0 0;">
        <asp:ImageButton ID="imgImage" runat="server" Height="100px" Width="145px" BorderWidth="1px" BorderColor="White" />
    </div>    
    <div id="newsContent" style="float:right; width:340px; height:100px;">
        <asp:Label ID="lblDate" runat="server" ForeColor="#FFFF99" ></asp:Label><br />
        <asp:LinkButton ID="lnkTitle" runat="server" ForeColor="#FFFFFF" Font-Bold="true"></asp:LinkButton><br />
        <asp:Label ID="lblDescription" runat="server" ForeColor="#abd8ff" ></asp:Label>
        <asp:LinkButton ID="lnkMore" runat="server" ForeColor="Red" Font-Bold="true"> >>повеќе</asp:LinkButton>               
    </div>
</div>
