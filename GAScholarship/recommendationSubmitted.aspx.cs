using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recommendationSubmitted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["st"] == "success")
        {
            lblRecStatus.Text = "Recommendation Submitted.";
            lblStatus.Text = "Your recommendation for "+Request.QueryString["n"]+" has been submitted successfully.";
        }
        else if (Request.QueryString["st"] == "retry")
        {
            lblRecStatus.Text = "Recommendation previously Submitted";
            lblStatus.Text = "You have already submitted your recommendation for " + Request.QueryString["n"] + " successfully.";
        }
        else{
            Response.Redirect("~/");
        }
    }
}