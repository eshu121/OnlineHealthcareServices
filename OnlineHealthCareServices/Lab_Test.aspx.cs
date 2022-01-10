using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OnlineHealthCareServices.DAL;

namespace OnlineHealthCareServices
{
    public partial class user_testing : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        DataTable dt;
        int resCode = 0;
        int UserDetailId = 1;
        int testId = 0;
        int totalMarks = 0;
        string ta = string.Empty;
        SqlCommand cmd;
        commonUse cu = new commonUse();

        ArrayList lst = new ArrayList();
        string tmpTestId = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserDetailId"] != null && Session["UserDetailId"].ToString() != "")
            //{
            //    UserDetailId = Convert.ToInt32(Session["UserDetailId"]);
            //}
            //else
            //{
            //    Response.Redirect("userLogin.aspx");
            //}

            if (IsPostBack)
                return;

            bindGender();
            bindSlot();
            bindTest();
            bindCity();
            bindSample();

        }

        private void bindGender()
        {
            dt = new DataTable();
            dt = cu.bindGender();

            ddlGender.DataSource = dt;
            ddlGender.DataTextField = "genderName";
            ddlGender.DataValueField = "genderId";
            ddlGender.DataBind();
            ddlGender.Items.Insert(0, "Select Gender");
            ddlGender.SelectedIndex = 0;
        }
        protected void clear()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmailId.Text = "";
            txtMobileNo.Text = "";
            txtAge.Text = "";
            //txtDate.Text = "";
            ddlGender.Text = "Select Gender";
            ddlCity.Text = "Select City";
            txtAddress.Text = "";
            ddlSlot.Text = "Select Slot";
            ddlTest.Text = "Select Test";
        }

        private void bindCity()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select distictId, distictName from DistictList where isActive=1 ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataTextField = "distictName";
            ddlCity.DataValueField = "distictId";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, "Select City");
            ddlCity.SelectedIndex = 0;

        }

        private void bindTest()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select TestId, testName from Test where isActive=1 ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlTest.DataSource = dt;
            ddlTest.DataTextField = "testName";
            ddlTest.DataValueField = "TestId";
            ddlTest.DataBind();
            ddlTest.Items.Insert(0, "Select Test");
            ddlTest.SelectedIndex = 0;

        }
        private void bindSubTest(int TestId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from SubTest where isActive=1 and TestId=" + TestId + " ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlSubTest.DataSource = dt;
            ddlSubTest.DataTextField = "SubTestName";
            ddlSubTest.DataValueField = "subTestId";
            ddlSubTest.DataBind();
            ddlSubTest.Items.Insert(0, "Select Test");
            ddlSubTest.SelectedIndex = 0;

        }
        private void bindSlot()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from Slot where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlSlot.DataSource = dt;
            ddlSlot.DataTextField = "slotName";
            ddlSlot.DataValueField = "slotId";
            ddlSlot.DataBind();
            ddlSlot.Items.Insert(0, "Select Slot");
            ddlSlot.SelectedIndex = 0;

        }

        private void bindSample()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select sampleId,sampleName from TestSample where isActive=1 ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlSample.DataSource = dt;
            ddlSample.DataTextField = "sampleName";
            ddlSample.DataValueField = "sampleId";
            ddlSample.DataBind();
            ddlSample.Items.Insert(0, "Select ");
            ddlSample.SelectedIndex = 0;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ArrayList al = ViewState["al"] as ArrayList;

            //GridView1.DataSource = al;
            //GridView1.DataBind();

            cmd = new SqlCommand("sp_Lab", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@UserDetailId", UserDetailId));
            cmd.Parameters.Add(new SqlParameter("@Firstname", txtFirstName.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Lastname", txtLastName.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Age", txtAge.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMobileNo.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@EmailId", txtEmailId.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@GenderId", ddlGender.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Addresss", txtAddress.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@CityId", ddlCity.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Slot", ddlSlot.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@LabTest", ddlTest.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@testdate", txtDate.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@TestSample", ddlSample.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Price", ViewState["total"].ToString()));

            // get return value from procedure
            SqlParameter parm = new SqlParameter("@resCode", SqlDbType.BigInt); //output parameter
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            resCode = Convert.ToInt32(parm.Value);
            if (resCode == 1)
            {
                // Response.Redirect("Profile.aspx");
            }

            SqlDataAdapter adpt = new SqlDataAdapter("select top 1 labTestId from LabTest where UserDetailId=" + UserDetailId + " order by labTestId desc", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            int LabTestId = Convert.ToInt32(dt.Rows[0]["labTestId"].ToString());

            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    int subTestId = 0;
                    HiddenField hdnSubTestId = (HiddenField)item.FindControl("hdnSubTestId");
                    subTestId = Convert.ToInt32(hdnSubTestId.Value);
                    SqlCommand cmd = new SqlCommand(" insert into LabTestDetail(labTestId,subTestId, createdOn)values(" + LabTestId + "," + subTestId + ", getdate()) ", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            clear();
        }

        protected void ddlTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTest.SelectedIndex > 0)
            {
                int stateId = 0;
                testId = Convert.ToInt16(ddlTest.SelectedValue);
                bindSubTest(testId);
            }
            else
            {
                ddlSubTest.Items.Clear();
                ddlSubTest.Items.Insert(0, "Please Select");
                ddlSubTest.SelectedIndex = 0;
            }
        }

        private void bindSubTestId(string SubTestId)
        {
            if (SubTestId.Length > 0)
            {
                SqlDataAdapter adpt = new SqlDataAdapter("select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS SNo,subTestId,SubTestName,Price from SubTest where subTestId in (" + SubTestId + ")", con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                
                int totalMarks = dt.Select().Sum(p => Convert.ToInt32(p["Price"]));
                (Repeater1.Controls[Repeater1.Controls.Count - 1].Controls[0].FindControl("lblTotal") as Label).Text = totalMarks.ToString();
                ViewState["total"] = totalMarks;
            }
            else
            {
                Repeater1.DataSource = null;
            }
        }

        protected void btnAddTest_Click(object sender, EventArgs e)
        {
            int num = 1;
            tmpTestId = string.Empty;

            ViewState["tmp"] = ViewState["tmp"] + ddlSubTest.SelectedValue + ", ";
            tmpTestId = ViewState["tmp"].ToString();
            tmpTestId = tmpTestId.Substring(0, tmpTestId.Length - 2);

            if (tmpTestId != null)
            {
                bindSubTestId(tmpTestId);
            }
        }
        public void lnkDelete(object sender, EventArgs e)
        {

            int subTestId = 0;
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            HiddenField hdnSubTestId = (HiddenField)item.FindControl("hdnSubTestId");
            subTestId = Convert.ToInt32(hdnSubTestId.Value);

            if (subTestId != 0)
            {
                tmpTestId = string.Empty;
                tmpTestId = ViewState["tmp"].ToString();

                tmpTestId = tmpTestId.Replace(subTestId.ToString(), "0");
                bindSubTestId(tmpTestId.Substring(0, tmpTestId.Length - 2));

                ViewState["tmp"] = tmpTestId;
            }
        }
    }
}