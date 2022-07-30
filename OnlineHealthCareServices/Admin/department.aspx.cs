using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OnlineHealthCareServices.DAL;

namespace OnlineHealthCareServices.Admin
{
    public partial class department : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            bindRepeater();
        }
        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from Department", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            cmd = new SqlCommand("insert into Department(departmentName,HOD,Status,createdBy,createdOn) values ('" + txtDepartName.Text + "','" + txtDepartHead.Text + "','" + txtStatus.Text + "',1,getdate())", con);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script language='javascript'>alert('Department Add Successfully.');</script>");
            Response.Redirect("department.aspx");
        }
    }
}