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
    public partial class Link : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            bindNews();
        }
        private void bindNews()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select newsName,newsLink from News order by newsId desc", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            //repOrderHistory.DataSource = dt;
            //repOrderHistory.DataBind();
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
}