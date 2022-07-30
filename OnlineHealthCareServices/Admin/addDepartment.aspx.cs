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
    public partial class addDepartment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            cmd = new SqlCommand("insert into Department(departmentName,HOD,Status,createdBy,createdOn) values ('" + txtDepartName.Text + "','" + txtDepartHead.Text + "','"+txtStatus.Text+"',1,getdate())", con);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
    }
}