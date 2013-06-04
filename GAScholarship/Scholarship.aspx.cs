using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;

public partial class Scholarship : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == "" || Request.QueryString["id"] == null)
        {
            Response.Redirect("error.aspx");
        }
        else
        {
            string id = Request.QueryString["id"];
            lblApplicationNumber.Text = id;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Check user has entered the filepath
        if (fuResume.HasFile)
        {
            try
            {
                if (fuResume.PostedFile.ContentLength > 512000)
                {
                    lblFileSizeError.Text = "Max file size (500KB) exceeded! Current file size:" + (fuResume.PostedFile.ContentLength / 1024).ToString() + "KB";
                }
                else
                {
                    /*
                    //Create the path for the file.
                    string file = @"C:\\Users\\Rokr047\\Downloads\\Applications\" + lblApplicationNumber.Text + "_" + txtLastName.Text + "_" + txtFirstName.Text + "\\";
                    Directory.CreateDirectory(file);

                    string filename = Path.GetFileName(fuResume.FileName);
                    fuResume.SaveAs(file + "\\" + filename);
                    */

                    //Upload the resume file to ~/Applications/Resume  Filename Format: <Application#>_<LastName>_<FirstName>.ext
                    //Create the path to upload the file to.
                    string resumeLink = "~/Applications/Resume/" + lblApplicationNumber.Text.Trim() + "_" +Path.GetFileName(fuResume.FileName);
                    fuResume.SaveAs(Server.MapPath(resumeLink));

                    //Insert Data into Database Table t_Application
                    var appAdapter = new dsMajorTableAdapters.t_ApplicationTableAdapter();                    

                    //Generate data to insert into t_Recommendation
                    Random objRandom = new Random();
                    int reco1Number = 0;
                    int reco2Number = 0;

                    while(reco1Number == reco2Number)
                    {
                        reco1Number = objRandom.Next(1000,9999);
                        reco2Number = objRandom.Next(1000,9999);
                    }

                    //Insert Data into t_Recommendation
                    var appAdapterReco = new dsMajorTableAdapters.t_RecommendationTableAdapter();

                    //perform Inserts
                    appAdapter.Insert(Convert.ToInt32(lblApplicationNumber.Text.Trim()), txtFirstName.Text.Trim(), txtLastName.Text.Trim(), txtEmail.Text.Trim(), txtUSCID.Text.Trim(), ddlMajor.SelectedValue.Trim(), resumeLink, "Submitted", reco1Number, reco2Number);
                    appAdapterReco.Insert(reco1Number,txtReco1Name.Text.Trim(),txtReco1Email.Text.Trim(),"NA","incomplete");
                    appAdapterReco.Insert(reco2Number, txtReco2Name.Text.Trim(), txtReco2Email.Text.Trim(), "NA", "incomplete");

                    //build query string for emailing recommenders
                    string virtualPath = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
                    string Reco1Link = virtualPath + "recommendation.aspx?id=" + lblApplicationNumber.Text + "&r=" + reco1Number;
                    string Reco2Link = virtualPath + "recommendation.aspx?id=" + lblApplicationNumber.Text + "&r=" + reco2Number;

                    //Mail to Recommender 1
                    MailMessage mailReco = new MailMessage();
                    mailReco.To.Add(txtReco1Email.Text.Trim());
                    mailReco.From = new MailAddress("rokr047@gmail.com");
                    mailReco.Subject = "GA Scholarship - Request for Recommendation";
                    mailReco.IsBodyHtml = true;
                    string Body = "Hi "+txtReco1Name.Text+", <br /> <br />"+
                                  txtFirstName.Text+" "+txtLastName.Text+" is applying for a scholarship and has requested you for a recommendation."+
                                  "<br />Click on the link below to submit your recommendation. <br />"+
                                  "<a href=\"" + Reco1Link + "\">" + Reco1Link + "</a>" + "<br />Thank You.<br /><br />This is an auto-generated mail, please do not reply.";
                    mailReco.Body = Body;
                    
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential
                         ("rokr047@gmail.com", "k@rthiK01");
                    smtp.EnableSsl = true;
                    smtp.Send(mailReco);

                    //Mail to Recommender 2
                    mailReco.To.Clear();
                    mailReco.To.Add(txtReco2Email.Text.Trim());

                    Body = "Hi " + txtReco2Name.Text + ", <br /> <br />" +
                                  txtFirstName.Text + " " + txtLastName.Text + " is applying for a scholarship and has requested you for a recommendation." +
                                  "<br />Click on the link below to submit your recommendation. <br />"+
                                  "<a href=\""+Reco2Link+"\">" + Reco2Link + "</a>" + "<br />Thank You.<br /><br />This is an auto-generated mail, please do not reply.";
                    mailReco.Body = Body;
                    smtp.Send(mailReco);

                    //Mail to Applicant
                    mailReco.To.Clear();
                    mailReco.To.Add(txtEmail.Text.Trim());
                    mailReco.Subject = "GA Scholarship - Application Submitted";
                    Body = "Hi " + txtFirstName.Text + " " + txtLastName.Text + " USC ID:"+ txtUSCID.Text +", <br /> <br />" +
                                  "Your application for Scholarship has been successfully submitted."+
                                  "<br />Your Application Number : "+lblApplicationNumber.Text +
                                  "<br />You can check the status of you application by following the below link:<br />"+
                                  "<a href=\""+virtualPath + "applicationStatus.aspx\">"+virtualPath + "applicationStatus.aspx</a>  <br />Thank you.<br /><br />This is an auto-generated mail, please do not reply.";
                    mailReco.Body = Body;
                    smtp.Send(mailReco);
                    Response.Redirect("Application.aspx");
                }
            }
            catch (Exception _err)
            {
                lblFileSizeError.Text = "File could not be uploaded!! Error: " + _err.Message;
            }
        }
        else
        {
            lblFileSizeError.Text = "Invalid/Empty FileName!";
        }        
    }
}