using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace OnlineHealthCareServices.Admin
{
    public partial class orderHistory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int PreId = 0;
        DataTable dt = new DataTable();
        string fileName = "";
        string imgPath = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            bindRepOrderHistory(1);
        }
        private void bindRepOrderHistory(int UserDetailId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS SNo, PD.UserDetailId,PD.PrescriptionDetailId, PD.PatientName, PD.Addresss,PD.CreatedDate,AOS.adminOrderStatus, PD.OrderStatusId, PD.Amount, PD.Discount, (PD.Amount - PD.Discount) as Paid,PD.PrescriptionImg,SL.stateName,DL.distictName,PD.invoice,isnull(PD.paymentStatus, 0) as paymentStatus from PrescriptionDetail PD inner join AdminOrderStatus AOS on AOS.adminOrderStatusId = PD.AdminOrderStatusId inner join StateList SL on SL.stateId=PD.StateId inner join DistictList DL on DL.distictId=PD.DistictId where PD.UserDetailId = 1 order by PD.PrescriptionDetailId desc", con);

            adap.Fill(dt);
            
           
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }

    }
}