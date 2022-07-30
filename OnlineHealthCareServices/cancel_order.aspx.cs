using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineHealthCareServices
{
    public partial class cancle_order : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;
        int PrescriptionId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserDetailId"] != null && Session["UserDetailId"].ToString() != "")
            {
                UserDetailId = Convert.ToInt32(Session["UserDetailId"]);
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
            if (IsPostBack)
                return;

            if (Request.QueryString["PresId"] != null)
            {
                PrescriptionId = Convert.ToInt32(Request.QueryString["PresId"]);

                
            }
            bindRepOrderHistory(UserDetailId);
        }

        private void bindRepOrderHistory(int UserDetailId)
        {
            SqlDataAdapter adap = new SqlDataAdapter(" select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS SNo, PD.UserDetailId,PD.PrescriptionDetailId, PD.PatientName, PD.Addresss,PD.CreatedDate,AOS.adminOrderStatus, PD.OrderStatusId from PrescriptionDetail PD inner join AdminOrderStatus AOS on AOS.adminOrderStatusId = PD.AdminOrderStatusId where PD.PrescriptionDetailId=" + PrescriptionId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            repOrderHistory.DataSource = dt;
            repOrderHistory.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            int PrescriptionId = 0;
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            HiddenField hdnPresId = (HiddenField)item.FindControl("hdnPresId");
            PrescriptionId = Convert.ToInt32(hdnPresId.Value);


            SqlCommand cmd = new SqlCommand("update PrescriptionDetail set OrderStatusId=2 where PrescriptionDetailId="+PrescriptionId+"", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Your order has Cancelled successfully";
        }
    }
}