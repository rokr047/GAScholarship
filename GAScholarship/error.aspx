<%@ Page Title="Error!!!" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeFile="error.aspx.cs" Inherits="error" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Wow! Something just went wrong!</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <p>
        Maybe you pressed the wrong button or</p>
    <p>
        entered a worng URL address or</p>
    <p>
        we are having some problems back here.</p>
    <asp:Button runat="server" PostBackUrl="~/" Text="Go to Home" />

</asp:Content>