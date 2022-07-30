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
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text;
using iTextSharp.tool.xml;
using System.Text;


namespace OnlineHealthCareServices
{
    public partial class order_Status : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;
        DataTable dt = new DataTable();
        string fileName = "../Prescription/";
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
                    


            bindRepOrderHistory(UserDetailId);
        }
        private void bindRepOrderHistory(int UserDetailId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS SNo, PD.UserDetailId,PD.PrescriptionDetailId, PD.PatientName, PD.Addresss,PD.CreatedDate,AOS.adminOrderStatus, PD.OrderStatusId, PD.Amount, PD.Discount, (PD.Amount - PD.Discount) as Paid,PD.PrescriptionImg,SL.stateName,DL.distictName,PD.invoice,isnull(PD.paymentStatus, 0) as paymentStatus from PrescriptionDetail PD inner join AdminOrderStatus AOS on AOS.adminOrderStatusId = PD.AdminOrderStatusId inner join StateList SL on SL.stateId=PD.StateId inner join DistictList DL on DL.distictId=PD.DistictId where PD.UserDetailId = 1 order by PrescriptionDetailId desc", con);
            
            adap.Fill(dt);

            //repOrderHistory.DataSource = dt;
            //repOrderHistory.DataBind();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            //GridView1.DataSource = dt;
            //GridView1.DataBind();

        }

        public void EditOrder(object sender, EventArgs e)
        {
            int PrescriptionId = 0;
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            HiddenField hdnPresId = (HiddenField)item.FindControl("hdnPresId");
            PrescriptionId = Convert.ToInt32(hdnPresId.Value);

            Response.Redirect("user_Prescription.aspx?PresId=" + PrescriptionId);
        }


        public void CancelOrder(object sender, EventArgs e)
        {
            
            int PrescriptionId = 0;
            RepeaterItem item = (sender as HtmlButton).NamingContainer as RepeaterItem;
            HiddenField hdnPresId = (HiddenField)item.FindControl("hdnPresId");
            PrescriptionId = Convert.ToInt32(hdnPresId.Value);


            Response.Redirect("cancle_order.aspx?PresId=" + PrescriptionId);
        }
        public void btnExport_Click(object sender, EventArgs e)
        {
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //Panel1.RenderControl(hw);
            //StringReader sr = new StringReader(sw.ToString());
            //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //pdfDoc.Open();
            //htmlparser.Parse(sr);
            //pdfDoc.Close();
            //Response.Write(pdfDoc);
            //Response.End();

            //sbtemp.Append("<table border='1'>");
            //sbtemp.Append("<tr> <td colspan='6' style='color:red; text-align:center;'></td> </tr>");
            //sbtemp.Append("<tr> <td>hello</td> <td>done</td> </tr>");
            //sbtemp.Append("</table>");


            //string FileName = "SalarySlip_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".pdf";
            //StringReader sr = new StringReader(sbtemp.ToString());
            //Document pdfDoc = new Document(PageSize.A4, 20f, 10f, 10f, 10f);
            //PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //pdfDoc.Open();
            //XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
            //pdfDoc.Close();
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Write(pdfDoc);
            //Response.End();

        }
       
        
    }
}