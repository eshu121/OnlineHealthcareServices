using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineHealthCareServices.Doctor
{
    public partial class Appointment_Update : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int AppId = 0;
        string imgPath="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppId"] != null)
            {
                AppId = Convert.ToInt32(Request.QueryString["AppId"]);
               
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            imgPath = string.Empty;
            string fileName = string.Empty;


            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                imgPath = "~/Prescription/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            }
            SqlCommand cmd = new SqlCommand("update Appointment set report='" + fileName + "' where appointmentid="+AppId+"",con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script language='javascript'>alert('Update Successfully.');</script>");
            Response.Redirect("Appointment.aspx");
        }
    }
}