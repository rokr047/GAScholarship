using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Web.UI.WebControls;

public partial class applicationStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblStatus.Visible = false;
    }
    protected void btnStatusCheck_Click(object sender, EventArgs e)
    {
        try
        {
            //create a connectionString
            string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GAScholarship.mdf;Integrated Security=True";

            //Create a new SQL connection
            SqlConnection sqlCon = new SqlConnection(connectionString);
            SqlCommand sqlCmd = new SqlCommand();
            

            sqlCmd.CommandText = "select status from t_Application where applicationNumber=" + Convert.ToInt32(txtApplicationNumber.Text);
            sqlCmd.Connection = sqlCon;
            sqlCon.Open();
            string status = ((string)sqlCmd.ExecuteScalar());
            sqlCon.Close();

            if (status == "" || status == null)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "We could not find an entry for the given application number!";
            }
            else
            {
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Application #" + txtApplicationNumber.Text + " Status : " + status;
            }
        }
        catch (Exception _err)
        {
            Response.Redirect("error.aspx");
        }
        
        lblStatus.Visible = true;
    }
}