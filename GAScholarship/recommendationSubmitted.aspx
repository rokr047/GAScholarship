<%@ Page Language="C#" Title="Recommendation Submitted" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="recommendationSubmitted.aspx.cs" Inherits="recommendationSubmitted" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Thank You.</h1>
                </hgroup>              
            <asp:Label ID="lblRecStatus" runat="server" Text="Recommendation Submitted." ForeColor="White" Font-Size="1.50em"></asp:Label>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label><br /><br />
    <p>Thank You.</p>
</asp:Content>
