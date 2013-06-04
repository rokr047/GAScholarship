<%@ Page Title="Scholarship Application" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Application.aspx.cs" Inherits="Application" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Success!.</h1>
                <h2>Your application has been submitted successfully.</h2>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>Your Scholarship application has been submitted successfully.</p>
    <p>You will get an email from us shortly, which will contain an application tracking number.</p>
    <p>You can use the tracking number to check the status of you application.</p>
    <asp:Button ID="btnStatusCheck" Text="Check Application Status" runat="server" PostBackUrl="~/applicationStatus.aspx"/>
</asp:Content>