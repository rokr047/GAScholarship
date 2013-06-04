using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminConsole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Session["Department"] = null;
            var appAdapterDept = new adminTableAdapters.Users1TableAdapter();
            string deptID = appAdapterDept.GetDataDept("AeroAdmin").Rows[0].ItemArray[0].ToString();
            Session["Department"] = deptID;
        }
        catch (Exception _err)
        {

        }
    }
    protected void btnSearchAdmin_Click(object sender, EventArgs e)
    {
        try
        {
            GridView gView1 = (GridView)LoginView1.FindControl("GridView1");
            gView1.DataSourceID = "";

            ObjectDataSource objDSAdmin = (ObjectDataSource)LoginView1.FindControl("ObjectDataSource2");
            gView1.DataSource = objDSAdmin;

            gView1.DataBind();
        }
        catch (Exception _err)
        {

        }

    }
    protected void btnSearchDept_Click(object sender, EventArgs e)
    {
        try
        {
            GridView gView2 = (GridView)LoginView1.FindControl("GridView2");
            gView2.DataSourceID = "";

            ObjectDataSource objDSAdmin = (ObjectDataSource)LoginView1.FindControl("ObjectDataSourceDept");
            gView2.DataSource = objDSAdmin;

            gView2.DataBind();
        }
        catch (Exception _err)
        {

        }
    }
    protected void btnViewDeptApplicants_Click(object sender, EventArgs e)
    {
        try
        {
            GridView gView2 = (GridView)LoginView1.FindControl("GridView2");
            gView2.DataSourceID = "";

            ObjectDataSource objDSAdmin = (ObjectDataSource)LoginView1.FindControl("ObjectDataSource3");
            gView2.DataSource = objDSAdmin;

            gView2.DataBind();
        }
        catch (Exception _err)
        {

        }

        try
        {
            GridView gView2 = (GridView)LoginView1.FindControl("GridView2");
            gView2.DataSourceID = "";

            ObjectDataSource objDSAdmin = (ObjectDataSource)LoginView1.FindControl("ObjectDataSource1");
            gView2.DataSource = objDSAdmin;

            gView2.DataBind();
        }
        catch (Exception _err)
        {

        }

        try
        {
            GridView gView1 = (GridView)LoginView1.FindControl("GridView2");
            gView1.DataSourceID = "";

            ObjectDataSource objDSAdmin = (ObjectDataSource)LoginView1.FindControl("ObjectDataSource3");
            gView1.DataSource = objDSAdmin;

            gView1.DataBind();
        }
        catch (Exception _err)
        {

        }

        try
        {
            GridView gView1 = (GridView)LoginView1.FindControl("GridView2");
            gView1.DataSourceID = "";

            ObjectDataSource objDSAdmin = (ObjectDataSource)LoginView1.FindControl("ObjectDataSource1");
            gView1.DataSource = objDSAdmin;

            gView1.DataBind();
        }
        catch (Exception _err)
        {

        }
    }
}