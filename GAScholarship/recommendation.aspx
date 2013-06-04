<%@ Page Title="Scholarship Recommendation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="recommendation.aspx.cs" Inherits="recommendation" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Recommend.</h1>
                </hgroup>
                <asp:Label ID="lblRecommendee" runat="server" Text="Karthik has requested a Letter of Recommendation from you." ForeColor="#000000" Font-Size="XX-Large"></asp:Label>
            <hgroup>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        //Reference -> shahed-kazi.blogspot.com/2010/12/textbox-textarea-max-number-of-words.html
        function WordCount() {
            var text = document.getElementById('<%= txtRecommendation.ClientID %>').value;
            var list = text.split(" ");

            var x; var upper; var lower;
            var count = 0;
            var max = 750;
            var val = "";

            for (x in list) {
                if (list[x].toUpperCase() != list[x].toLowerCase()) {
                    if (count + 1 <= max) {
                        count = count + 1;
                        val += list[x];
                    }
                }
                else {
                    if (count <= max) {
                        val += list[x];
                    }
                }
                if (x != list.length - 1) {
                    val += " ";
                }
            }

            document.getElementById('<%= txtRecommendation.ClientID %>').value = val;
            document.getElementById('wordCountDisplay').innerHTML = max - count;
        }
    </script>
    <p>Please type in your recommendation in not more than 750 words.</p> 
    <asp:Label ID="lblRecommendBy" runat="server"></asp:Label>
    <br /><br />
    <asp:TextBox ID="txtRecommendation" runat="server" Height="321px" TextMode="MultiLine" Width="584px" onkeyup="WordCount()"></asp:TextBox>
    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Recommendation required!" ControlToValidate="txtRecommendation" ForeColor="Red"></asp:RequiredFieldValidator>
    <br /><span id="wordCountDisplay" style="color:#000000;">750</span> word(s) remaining.
    <br /><br />
    <asp:Button ID="btnSubmitRecommendation" runat="server" Text="Submit" OnClick="btnSubmitRecommendation_Click" />
    <input id="Reset1" type="reset" value="Clear" />
</asp:Content>