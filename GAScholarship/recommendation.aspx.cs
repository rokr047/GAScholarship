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
using System.IO;

public partial class recommendation : System.Web.UI.Page
{
    string fName;

    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        {
            if (Request.QueryString["id"] == "" || Request.QueryString["id"] == null || Request.QueryString["r"] == "" || Request.QueryString["r"] == null)
            {
                Response.Redirect("error.aspx");
            }
            else
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                int rID = Convert.ToInt32(Request.QueryString["r"]);
                //create a connectionString
                string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GAScholarship.mdf;Integrated Security=True";

                //Create a new SQL connection
                SqlConnection sqlCon = new SqlConnection(connectionString);
                SqlCommand sqlCmd = new SqlCommand();
                SqlCommand sqlCmdR = new SqlCommand();
                sqlCmd.Connection = sqlCon;
                sqlCmdR.Connection = sqlCon;

                sqlCmd.CommandText = "select firstName,recommender1,recommender2 from t_Application where applicationNumber=" + id;

                sqlCon.Open();
                SqlDataReader reader = sqlCmd.ExecuteReader();
                
                int rec1ID, rec2ID;

                if (reader.Read())
                {
                    fName = reader[0].ToString();
                    rec1ID = Convert.ToInt32(reader[1]);
                    rec2ID = Convert.ToInt32(reader[2]);
                    reader.Close();

                    //Check if the recommender has already given the recommendation.
                    sqlCmdR.CommandText = "select recommendationStatus from t_Recommendation where recommendationNumber=" + rID;
                    
                    string rStatus = (string)sqlCmdR.ExecuteScalar();
                    sqlCon.Close();

                    if (rStatus == "complete")
                    {
                        Response.Redirect("recommendationSubmitted.aspx?st=retry&n=" + fName);
                    }
                    else
                    {
                        if (fName == null || fName == "")
                        {
                            Response.Redirect("error.aspx");
                        }
                        else
                        {
                            if (rec1ID == rID || rec2ID == rID)
                            {
                                sqlCmdR.CommandText = "select recommendationName from t_Recommendation where recommendationNumber=" + rID;
                                sqlCon.Open();
                                string rName = ((string)sqlCmdR.ExecuteScalar());
                                sqlCon.Close();

                                if (rName == null || rName == "")
                                {
                                    Response.Redirect("error.aspx");
                                }

                                lblRecommendee.Text = fName + " has requested a Recommendation from You.";
                                lblRecommendBy.Text = "Recommendation by: " + rName;
                            }
                            else
                            {
                                reader.Close();
                                sqlCon.Close();
                                Response.Redirect("error.aspx");
                            }
                        }
                    }
                }
                sqlCon.Close();
            }
        }
        /*catch (Exception _err)
        {
            Response.Redirect("error.aspx");
        }*/
    }

    protected void btnSubmitRecommendation_Click(object sender, EventArgs e)
    {
        //Save the recommendation as a text file
        string file = "~/Applications/Recommendation/" + Request.QueryString["id"] + "_" + Request.QueryString["r"] + "_Recommendation.txt";
        string filePath = Server.MapPath(file);
        StreamWriter objStreamWriter = new StreamWriter(filePath, false);
        objStreamWriter.WriteLine(txtRecommendation.Text);
        objStreamWriter.Close();

        //Update the records in the t_Recommendation table.
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GAScholarship.mdf;Integrated Security=True";
        //try
        {
            //Create a new SQL connection
            SqlConnection sqlCon = new SqlConnection(connectionString);
            SqlCommand sqlCmd = new SqlCommand();

            sqlCmd.CommandText = "update t_Recommendation set recommendationStatus='complete',recommendationFile='"+file+"' where recommendationNumber=" + Convert.ToInt32(Request.QueryString["r"]);
            sqlCmd.Connection = sqlCon;

            sqlCon.Open();
            int rowsAffected = sqlCmd.ExecuteNonQuery();
            sqlCon.Close();

            //Update the records in the database.
            //try
            {
                if (rowsAffected > 0)
                {
                    string recommender1="", recommender2="";

                    sqlCmd.CommandText = "select recommender1,recommender2 from t_Application where applicationNumber=" + Convert.ToInt32(Request.QueryString["id"]);

                    sqlCon.Open();
                    SqlDataReader reader = sqlCmd.ExecuteReader();
                    if (reader.Read())
                    {
                        recommender1 = reader[0].ToString();
                        recommender2 = reader[1].ToString();
                    }
                    //string status = ((string)sqlCmd.ExecuteScalar());
                    sqlCon.Close();
                    reader.Close();

                    if (recommender1 == Request.QueryString["r"] || recommender2 == Request.QueryString["r"])
                    {
                        string appStatus = "";
                        //Recommender 1 is submitting
                        //Check to see the status of the recommendation
                        //is the Convert.ToInt32 redundent here???
                        sqlCmd.CommandText = "select recommendationStatus from t_Recommendation where recommendationNumber=" + Convert.ToInt32(recommender1);
                        sqlCon.Open();
                        string statusReco1 = (string)sqlCmd.ExecuteScalar();
                        sqlCon.Close();
                        sqlCmd.CommandText = "select recommendationStatus from t_Recommendation where recommendationNumber=" + Convert.ToInt32(recommender2);
                        sqlCon.Open();
                        string statusReco2 = (string)sqlCmd.ExecuteScalar();
                        sqlCon.Close();

                        if (statusReco1 == "complete" && statusReco2 == "complete")
                        {
                            appStatus = "Recommendation 2 Received";
                        }
                        else if (statusReco1 == "complete" && statusReco2 == "incomplete" || statusReco1 == "incomplete" && statusReco2 == "complete")
                        {
                            appStatus = "Recommendation 1 Received";
                        }

                        //Push this status into t_Application
                        if (appStatus != "")
                        {
                            sqlCmd.CommandText = "update t_Application set status='" + appStatus + "' where applicationNumber=" + Convert.ToInt32(Request.QueryString["id"]);
                            sqlCon.Open();
                            rowsAffected = sqlCmd.ExecuteNonQuery();
                            sqlCon.Close();

                            sqlCmd.Dispose();

                            Response.Redirect("recommendationSubmitted.aspx?st=success&n="+fName);
                        }
                    }
                }
            }
            /*catch (Exception _err)
            {
                Response.Redirect("error.aspx");
            }*/
        }
        /*catch (Exception _err)
        {
            Response.Redirect("error.aspx");
        }*/
    }
}