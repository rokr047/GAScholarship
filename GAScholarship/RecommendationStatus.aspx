<%@ Page Title="Recommendation Status" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="RecommendationStatus.aspx.cs" Inherits="RecommendationStatus" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Success!.</h1>
                <h2>Your Recommendation has been submitted successfully.</h2>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>Your recommendation for Karthik has been submitted successfully.</p>
    <p>Thank You.</p>
</asp:Content>