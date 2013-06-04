<%@ Page Title="Scholarship Application" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Scholarship.aspx.cs" Inherits="Scholarship" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Apply for a Scholarship.</h2>
            </hgroup>
            <p>Please complete and submit the below form to create an application.</p>
            <h5>ALL FIELDS ARE MANDATORY.</h5>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Label ID="lblApplication" runat="server" Text="Application # : " Font-Size="Large" height="41px" width="194px" /><asp:Label ID="lblApplicationNumber" runat="server" Text="123456" Font-Size="Large" height="41px" width="194px" />
<br />
    <asp:Label ID="lblFirstName" runat="server" Text="FirstName : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtFirstName" runat="server" Width="244px" />
    <asp:RequiredFieldValidator ID="rvalFirstName" runat="server" ErrorMessage="&lt;-- Firstname Required" ControlToValidate="txtFirstName" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="LastName : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtLastName" runat="server" Width="244px"/>
    <asp:RequiredFieldValidator ID="rvalLastName" runat="server" ErrorMessage="&lt;-- Lastname Required" ControlToValidate="txtLastName" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="E-Mail address : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="244px" />
    <asp:RequiredFieldValidator ID="rvalEmail" runat="server" ErrorMessage="&lt;-- Email Required" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
    <asp:RegularExpressionValidator ID="regValEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Incorrect Email format e.g: ttrojan@usc.edu" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@usc\.edu"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="lblUSCID" runat="server" Text="USC ID : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtUSCID" runat="server" Width="244px" />
    <asp:RequiredFieldValidator ID="rvalUSCID" runat="server" ErrorMessage="&lt;-- USC ID Required" ControlToValidate="txtUSCID" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUSCID" ErrorMessage="Invalid USC ID. e.g: 1234-5678-09" ForeColor="Red" ValidationExpression="\d{4}\-\d{4}\-\d{2}"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="lblMajor" runat="server" Text="Major : " Font-Size="Large" height="33px" width="194px" /><asp:DropDownList ID="ddlMajor" runat="server" height="33px" Width="244px" Font-Size="Medium" DataSourceID="odsMajor" DataTextField="Major" DataValueField="Id">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="odsMajor" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMajorTableAdapters.t_MajorTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Major" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Major" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:RequiredFieldValidator ID="rvalMajor" runat="server" ErrorMessage="&lt;-- Please select Major" ControlToValidate="ddlMajor" ForeColor="Red" InitialValue="1" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
<asp:Label ID="lblFileSizeError" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Label ID="lblResume" runat="server" Text="Resume : " Font-Size="Large" height="41px" width="194px" /><asp:FileUpload ID="fuResume" runat="server" Width="256px" />
    <asp:RequiredFieldValidator ID="rvalResume" runat="server" ControlToValidate="fuResume" ErrorMessage="&lt;-- Resume Required" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="regvalResume" runat="server" ControlToValidate="fuResume" ErrorMessage="File can either be doc,docx or pdf only!" ForeColor="Red" ValidationExpression="((.*\.([Dd][Oo][Cc])|.*\.([Dd][Oo][Cc][Xx])|.*\.([Pp][Dd][Ff]))$)"></asp:RegularExpressionValidator>
    <br />
    <asp:Panel ID="panelReco1" runat="server" BorderStyle="None" Direction="LeftToRight" HorizontalAlign="Left" Width="700px">
        <asp:Label ID="lblReco1" runat="server" Text="Recommendation 1" Font-Size="Large" height="41px" width="194px" BorderStyle="None" />
        <br />
        <asp:Label ID="lblReco1Name" runat="server" Text="Name : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtReco1Name" runat="server" Width="244px" />
        <asp:RequiredFieldValidator ID="rvalReco1Name" runat="server" ControlToValidate="txtReco1Name" ErrorMessage="&lt;-- Name Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblReco1Email" runat="server" Text="E-Mail address : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtReco1Email" runat="server" TextMode="Email" Width="244px" />
        <asp:RequiredFieldValidator ID="rvalReco1Email" runat="server" ControlToValidate="txtReco1Email" ErrorMessage="&lt;-- Email Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="regValReco1Email" runat="server" ControlToValidate="txtReco1Email" Display="Dynamic" ErrorMessage="Incorrect Email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </asp:Panel>
    <br />
        <asp:Panel ID="panelReco2" runat="server" BorderStyle="None" Direction="LeftToRight" HorizontalAlign="Left" Width="700px">
        <asp:Label ID="lblReco2" runat="server" Text="Recommendation 2" Font-Size="Large" height="41px" width="194px" BorderStyle="None" />
        <br />
        <asp:Label ID="lblReco2Name" runat="server" Text="Name : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtReco2Name" runat="server" Width="244px" />
            <asp:RequiredFieldValidator ID="rvalReco2Name" runat="server" ControlToValidate="txtReco2Name" ErrorMessage="&lt;-- Name Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblReco2Email" runat="server" Text="E-Mail address : " Font-Size="Large" height="41px" width="194px" /><asp:TextBox ID="txtReco2Email" runat="server" ToolTip="Enter a valid email address. E.g: myname@abc.edu" TextMode="Email" Width="244px" />
            <asp:RequiredFieldValidator ID="rvalReco2Email" runat="server" ControlToValidate="txtReco2Email" ErrorMessage="&lt;-- Email Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="regValReco2Email" runat="server" ControlToValidate="txtReco2Email" Display="Dynamic" ErrorMessage="Incorrect Email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Recommender Names CANNOT be the same" ControlToCompare="txtReco1Name" ControlToValidate="txtReco2Name" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
            <br /><asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtReco1Email" ControlToValidate="txtReco2Email" ErrorMessage="Recommender Emails CANNOT be the same" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
    </asp:Panel>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><input id="Reset1" type="reset" value="Reset" />
</asp:Content>
