using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineHealthCareServices.Admin
{
    public partial class orderEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int PreId = 0;
        DataTable dt = new DataTable();
        string fileName = "";
        string imgPath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Request.QueryString["PpId"] != null)
            {
                PreId = Convert.ToInt32(Request.QueryString["PpId"]);
            }
            if (IsPostBack)
                return;

            bindStatus();
        }


        private void bindStatus()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from AdminOrderStatus", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlStatus.DataSource = dt;
            ddlStatus.DataTextField = "adminOrderStatus";
            ddlStatus.DataValueField = "adminOrderStatusId";
            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, "Select Department");
            ddlStatus.SelectedIndex = 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            imgPath = string.Empty;
            string fileName = string.Empty;

            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                imgPath = "~/DoctorImg/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            }
            SqlCommand cmd = new SqlCommand(" update PrescriptionDetail set Amount=" + txtAmount.Text + ",Discount=" + txtDiscount.Text + ",AdminOrderStatusId=" + ddlStatus.Text + ",invoice='" + fileName + "' where PrescriptionDetailId=" + PreId + " ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script language='javascript'>alert('Update Successfully.');</script>");
            Response.Redirect("orderHistory.aspx");

        }
    }
}