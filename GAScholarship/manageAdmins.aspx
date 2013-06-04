<%@ Page Language="C#" Title="Manage Admins" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="manageAdmins.aspx.cs" Inherits="manageAdmins" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Admin Console.</h1>
            </hgroup>
            <asp:LoginView ID="LoginViewHead" runat="server">
                <RoleGroups>
                    <asp:RoleGroup Roles="Department Admin">
                        <ContentTemplate>
                            <hgroup class="title"><h2>Manage your department application submissions.</h2></hgroup>
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="superAdmin">
                        <ContentTemplate>
                            <hgroup class="title"><h2>Manage the entire Web application.</h2></hgroup>
                            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" PostBackUrl="~/adminConsole.aspx" />
                            <asp:Button ID="btnAddAdmin" runat="server" Text="Add Department Administrators" CausesValidation="false" OnClick="btnAddAdmin_Click" />
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>                
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
                   <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" LoginCreatedUser="False">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="ObjectDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" SortExpression="ApplicationId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
        </Columns>
                   </asp:GridView>
                     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="System.Guid" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="adminTableAdapters.UsersTableAdapter" UpdateMethod="Update">
                         <UpdateParameters>
                             <asp:Parameter DbType="Guid" Name="ApplicationId" />
                             <asp:Parameter Name="UserName" Type="String" />
                             <asp:Parameter Name="Department" Type="String" />
                             <asp:Parameter DbType="Guid" Name="Original_UserId" />
                         </UpdateParameters>
                   </asp:ObjectDataSource>
                     <br />
    <p>Create the User first, and then add the user to the Department.</p>
                   <br />
    <asp:Label ID="lblMajor" runat="server" Text="Department : " />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Major" DataValueField="Id">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMajorTableAdapters.t_MajorTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="Major" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:Button ID="btnAddAdmintoDept" runat="server" Text="Add Admin to Department" OnClick="btnAddAdmintoDept_Click" />
<br />
<asp:Label ID="lblStatus" runat="server"></asp:Label>
</asp:Content>
