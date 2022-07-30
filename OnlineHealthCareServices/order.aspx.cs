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
    public partial class order_status : System.Web.UI.Page
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

            bindPrescriptionDetail();
        }

        protected void bindPrescriptionDetail()
        {
            SqlDataAdapter adap = new SqlDataAdapter("  select top 1 PD.PatientName,PD.PrescriptionImg,PD.DoctorName,PD.Addresss,PD.MobileNO,PD.PinCode,PD.NumberOfDays,PM.paymentMode,SL.stateName,DL.distictName from PrescriptionDetail PD inner join StateList SL on SL.stateId = PD.StateId inner join DistictList DL on DL.distictId = PD.DistictId inner join PaymentMode PM on PM.paymentId = PD.PaymentMode where PD.UserDetailId = 1 order by PD.PrescriptionDetailId desc", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                lblPatientName.Text = dt.Rows[0]["PatientName"].ToString();
                lblDoctorName.Text = dt.Rows[0]["DoctorName"].ToString();
                lblAddress.Text = dt.Rows[0]["Addresss"].ToString();
                lblMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
                lblNOD.Text = dt.Rows[0]["NumberOfDays"].ToString();
                lblPayment.Text = dt.Rows[0]["paymentMode"].ToString();
                Image1.ImageUrl = "~/Prescription/" + dt.Rows[0]["PrescriptionImg"].ToString();
            }

                lblMsg.Text = "Your Order has been placed Successfully";
        }
    }
}