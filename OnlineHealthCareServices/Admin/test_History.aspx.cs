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
    public partial class test_History : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;
        int TestId = 0;
        int labtestId = 0;
        string imgPath ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            
            if (Request.QueryString["TestId"] != null)
            {
                TestId = Convert.ToInt32(Request.QueryString["TestId"]);

                if (TestId > 0)
                {

                    bindRepOrderHistory(TestId);
                }
            }
        }
        
        private void bindRepOrderHistory(int TestId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select LT.labTestDetailId,LT.labTestId,SB.SubTestName,t.testName,LT.Report from LabTestDetail LT inner join SubTest SB on SB.subTestId=LT.subTestId inner join Test t on SB.TestId=t.TestId where LT.labTestId=" + TestId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }


        

    }
}