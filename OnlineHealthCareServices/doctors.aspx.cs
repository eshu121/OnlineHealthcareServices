﻿using System;
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
    public partial class doctors : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            bindDoctor();
        }
        private void bindDoctor()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from DoctorDetails ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }
}