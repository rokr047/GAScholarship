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

public partial class manageAdmins : System.Web.UI.Page
{
    string username;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddAdmin_Click(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        var usernameBox = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
        username = usernameBox.Text;
    }
    protected void btnAddAdmintoDept_Click(object sender, EventArgs e)
    {
        //create a connectionString
        string connectionString = @"Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-GAScholarship-20130209012020;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-GAScholarship-20130209012020.mdf";

        //Create a new SQL connection
        SqlConnection sqlCon = new SqlConnection(connectionString);
        SqlCommand sqlCmd = new SqlCommand();

        sqlCmd.CommandText = "UPDATE Users SET Department='" + "Computer Science" + "' WHERE UserName='" + username + "'";
        sqlCmd.Connection = sqlCon;

        sqlCon.Open();
        int rowsAffected = sqlCmd.ExecuteNonQuery();
        sqlCon.Close();

        if (rowsAffected > 0)
        {
            lblStatus.Text = "User has been added to the Department.";
        }
    }
}