<%@ Page Title="Application Status Check" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="applicationStatus.aspx.cs" Inherits="applicationStatus" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Application Status.</h1>
                <h2>Check the status of you Scholarship application.</h2>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>Enter your unique application number to check the status.</p>
    <p>{Your application number was mailed to you upon completion of the application}</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="txtApplicationNumber" runat="server" height="24px" width="279px"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnStatusCheck" Text="Check Application Status" runat="server" PostBackUrl="~/applicationStatus.aspx" Width="218px" OnClick="btnStatusCheck_Click"/>
            <br /><asp:RequiredFieldValidator ID="rvalApplicationNumber" runat="server" ErrorMessage="Application Number Required!" ControlToValidate="txtApplicationNumber" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtApplicationNumber" ErrorMessage="Invalid Application ID!" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
        
            <br />
                <asp:Label ID="lblStatus" runat="server" Text="Recommendation 1 received for Application # 121212" ForeColor="#009900" Font-Bold="True" Font-Size="X-Large" />     
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>