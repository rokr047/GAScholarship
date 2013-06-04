using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        RegisterHyperLink.NavigateUrl = "~/adminConsole.aspx";
        //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        returnUrl = "~/adminConsole.aspx";
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/adminConsole.aspx");
    }
}