<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Hello.</h1>
                <h2>Welcome to the Scholarship Portal.</h2>
            </hgroup>
            <p>
                If you are a student and want to apply for a scholarship, please click the button below.</p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Button Text="Apply for Scholarship" runat="server" ID="btnApply" OnClick="btnClick" Width="239px" />
</asp:Content>