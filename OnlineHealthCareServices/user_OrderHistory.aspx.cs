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
    public partial class user_OrderHistory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;
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

            bindRepOrderHistory(UserDetailId);
        }

        private void bindRepOrderHistory(int UserDetailId)
        {
            SqlDataAdapter adap = new SqlDataAdapter(" select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS SNo, PD.UserDetailId,PD.PrescriptionDetailId, PD.PatientName, PD.Addresss,PD.CreatedDate,AOS.adminOrderStatus, PD.OrderStatusId from PrescriptionDetail PD inner join AdminOrderStatus AOS on AOS.adminOrderStatusId = PD.AdminOrderStatusId where PD.UserDetailId="+UserDetailId+ " ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            repOrderHistory.DataSource = dt;
            repOrderHistory.DataBind();            
        }

        public void EditOrder(object sender, EventArgs e)
        {
            int PrescriptionId = 0;
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            HiddenField hdnPresId = (HiddenField)item.FindControl("hdnPresId");
            PrescriptionId = Convert.ToInt32(hdnPresId.Value);
            
            Response.Redirect("user_Prescription.aspx?PresId="+ PrescriptionId);
        }
        

        public void CancelOrder(object sender, EventArgs e)
        {
            int PrescriptionId = 0;
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            HiddenField hdnPresId = (HiddenField)item.FindControl("hdnPresId");
            PrescriptionId = Convert.ToInt32(hdnPresId.Value);
            

            Response.Redirect("cancle_order.aspx?PresId=" + PrescriptionId);
        }
    }
}