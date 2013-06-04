<%@ Page Title="Admin Console" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="adminConsole.aspx.cs" Inherits="adminConsole" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Admin Console.</h1>
            </hgroup>
            <asp:LoginView ID="LoginView2" runat="server">
                <RoleGroups>
                    <asp:RoleGroup Roles="Department Admin">
                        <ContentTemplate>
                            <hgroup class="title"><h2>Manage your department application submissions.</h2></hgroup>
                            <asp:Button ID="btnViewDeptApplicants" runat="server" Text="Show All Applicants" CausesValidation="false" OnClick="btnViewDeptApplicants_Click" />
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="superAdmin">
                        <ContentTemplate>
                            <hgroup class="title"><h2>Manage the entire Web application.</h2></hgroup>
                            <asp:Button ID="btnViewApplicants" runat="server" Text="List Applicants" CausesValidation="false" />
                            <asp:Button ID="btnManageDeptAdmin" runat="server" Text="Manage Department Administrators" CausesValidation="false" PostBackUrl="~/manageAdmins.aspx" />
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>                
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentGrid">
    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Department Admin">
                <ContentTemplate>
                    &nbsp;<br />
                    <asp:TextBox ID="txtSearchDept" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearchDept" runat="server" OnClick="btnSearchDept_Click" Text="Search" />
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="applicationNumber" DataSourceID="ObjectDataSource3">
                        <Columns>
                            <asp:BoundField DataField="applicationNumber" HeaderText="applicationNumber" ReadOnly="True" SortExpression="applicationNumber" />
                            <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                            <asp:BoundField DataField="emailAddress" HeaderText="emailAddress" SortExpression="emailAddress" />
                            <asp:BoundField DataField="uscID" HeaderText="uscID" SortExpression="uscID" />
                            <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
                            <asp:BoundField DataField="resume" HeaderText="resume" SortExpression="resume" />
                            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                            <asp:BoundField DataField="recommender1" HeaderText="recommender1" SortExpression="recommender1" />
                            <asp:BoundField DataField="recommender2" HeaderText="recommender2" SortExpression="recommender2" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSourceDept" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySearchDept" TypeName="dsMajorTableAdapters.t_ApplicationTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="applicationNumber" Type="Int32" />
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Dept" SessionField="Department" Type="String" />
                            <asp:ControlParameter ControlID="txtSearchDept" Name="FirstName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtSearchDept" Name="LastName" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDept" TypeName="dsMajorTableAdapters.t_ApplicationTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="applicationNumber" Type="Int32" />
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Dept" SessionField="Department" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="superAdmin">
                <ContentTemplate>
                    &nbsp;&nbsp;<asp:TextBox ID="txtSearchAdmin" runat="server" Width="339px"></asp:TextBox>
                    <asp:Button ID="btnSearchAdmin" runat="server" OnClick="btnSearchAdmin_Click" Text="Search" Width="118px" />
&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" DataKeyNames="applicationNumber" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="applicationNumber" HeaderText="applicationNumber" ReadOnly="True" SortExpression="applicationNumber" />
                            <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                            <asp:BoundField DataField="emailAddress" HeaderText="emailAddress" SortExpression="emailAddress" />
                            <asp:BoundField DataField="uscID" HeaderText="uscID" SortExpression="uscID" />
                            <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
                            <asp:BoundField DataField="resume" HeaderText="resume" SortExpression="resume" />
                            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                            <asp:BoundField DataField="recommender1" HeaderText="recommender1" SortExpression="recommender1" />
                            <asp:BoundField DataField="recommender2" HeaderText="recommender2" SortExpression="recommender2" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMajorTableAdapters.t_Application1TableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="applicationNumber" Type="Int32" />
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySearch" TypeName="dsMajorTableAdapters.t_ApplicationTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="applicationNumber" Type="Int32" />
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtSearchAdmin" Name="FirstName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtSearchAdmin" Name="Lastname" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="emailAddress" Type="String" />
                            <asp:Parameter Name="uscID" Type="String" />
                            <asp:Parameter Name="Major" Type="String" />
                            <asp:Parameter Name="resume" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="recommender1" Type="Int32" />
                            <asp:Parameter Name="recommender2" Type="Int32" />
                            <asp:Parameter Name="Original_applicationNumber" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
