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
    public partial class patients : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bindRepeater();
        }
        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select UD.FirstName, UD.LastName, UD.AddresssLine1, UD.EmailId, UD.MobileNumber, UD.Age, UD.PinCode, UD.ProfileImg, G.genderName, SL.stateName, DL.distictName from UserDetail UD inner join Gender G on G.genderId = UD.GenderId inner join StateList SL on SL.stateId = UD.StateId inner join DistictList DL on DL.distictId = UD.DistictId order by UD.UserDetailId desc", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
    }
}