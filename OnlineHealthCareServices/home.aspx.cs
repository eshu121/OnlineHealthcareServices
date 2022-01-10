using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace OnlineHealthCareServices
{
    public partial class home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        int UserDetailId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            bindNews();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["UserDetailId"] != null && Session["UserDetailId"].ToString() != "")
            {

                Response.Redirect("Book_Appointment.aspx");
            }
            else
            {
                Session["pageInfo"] = "bookApp";
                Response.Redirect("userLogin.aspx");
            }

            
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
            if (Session["UserDetailId"] != null && Session["UserDetailId"].ToString() != "")
            {

                Response.Redirect("Lab_Test.aspx");
            }
            else
            {
                Session["pageInfo1"] = "bookLab";
                Response.Redirect("userLogin.aspx");
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Session["UserDetailId"] != null && Session["UserDetailId"].ToString() != "")
            {

                Response.Redirect("user_Prescription.aspx");
            }
            else
            {
                Session["pageInfo2"] = "order";
                Response.Redirect("userLogin.aspx");
            }
        }
        private void bindNews()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select top 5 newsName,newsLink from News order by newsId desc", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            //repOrderHistory.DataSource = dt;
            //repOrderHistory.DataBind();
            DataList1.DataSource = dt;
            DataList1.DataBind();
            DataList2.DataSource = dt;
            DataList2.DataBind();
            //GridView1.DataSource = dt;
            //GridView1.DataBind();

        }
       
    }
}