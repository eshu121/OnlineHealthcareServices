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

            StringBuilder sbtemp = new StringBuilder();
            sbtemp.Append("<div style='width:50%;'><h6>Online HealthCare Services</h6></div>");
            sbtemp.Append("<div style='width:50%;float:right;'><h6>Tax Invoice/Bill of Supply/Cash Memo</h6></div>");
            sbtemp.Append("<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'>"+
                "< div class='container'><div class='col-md-12'><div class='invoice'><div class='invoice-company text-inverse f-w-600'><span class='pull-right hidden-print'><a href = 'javascript:;' class='btn btn-sm btn-white m-b-10 p-l-5'><i class='fa fa-file t-plus-1 text-danger fa-fw fa-lg'></i> Export as PDF</a>"+
            "<a href = 'javascript:;' onclick='window.print()' class='btn btn-sm btn-white m-b-10 p-l-5'><i class='fa fa-print t-plus-1 fa-fw fa-lg'></i> Print</a></span>Company Name, Inc</div>"+
        "<div class='invoice-header'><div class='invoice-from'><small>from</small><address class='m-t-5 m-b-5'><strong class='text-inverse'>Twitter, Inc.</strong><br/>Street Address<br/>City, Zip Code<br/>Phone: (123) 456-7890<br/>Fax: (123) 456-7890</address></div>" +
        "<div class='invoice-to'><small>to</small><address class='m-t-5 m-b-5'><strong class='text-inverse'>Company Name</strong><br/>Street Address<br/>City, Zip Code<br/>Phone: (123) 456-7890<br/>Fax: (123) 456-7890</address></div>" +
        "<div class='invoice-date'><small>Invoice / July period</small>< div class='date text-inverse m-t-5'>August 3,2012</div>< div class='invoice-detail'> #0000123DSS<br/> Services Product</ div ></ div ></ div >" +
        "<div class='invoice-content'><div class='table-responsive'><table class='table table-invoice'><thead><tr><th>TASK DESCRIPTION</th><th class='text-center' width='10%'>RATE</th><th class='text-center' width='10%'>HOURS</th><th class='text-right' width='20%'>LINE TOTAL</th></tr></thead><tbody>" +
        "<tr><td><span class='text-inverse'>Website design &amp; development</span><br/><small>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed id sagittis arcu.</small> </td>< td class='text-center'>$50.00</td><td class='text-center'>50</td><td class='text-right'>$2,500.00</td></tr>" +
        "<tr><td><span class='text-inverse'>Branding</span><br/><small>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed id sagittis arcu.</small></td><td class='text-center'>$50.00</td><td class='text-center'>40</td><td class='text-right'>$2,000.00</td></tr>" +
        "<tr><td><span class='text-inverse'>Redesign Service</span><br/><small>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed id sagittis arcu.</small></td><td class='text-center'>$50.00</td> <td class='text-center'>50</td><td class='text-right'>$2,500.00</td> </tr></tbody></table></div>"+
        "<div class='invoice-price'><div class='invoice-price-left'><div class='invoice-price-row'><div class='sub-price'><small>SUBTOTAL</small><span class='text-inverse'>$4,500.00</span></div><div class='sub-price'><i class='fa fa-plus text-muted'></i></div> <div class='sub-price'><small>PAYPAL FEE(5.4%)</small><span class='text-inverse'>$108.00</span></div></div></div><div class='invoice-price-right'><small>TOTAL</small> <span class='f-w-600'>$4508.00</span></div></div></div>"+
        "<div class='invoice-note'>* Make all cheques payable to[Your Company Name]<br/>* Payment is due within 30 days<br/>* If you have any questions concerning this invoice, contact[Name, Phone Number, Email]</div><div class='invoice-footer'><p class='text-center m-b-5 f-w-600'> THANK YOU FOR YOUR BUSINESS</p><p class='text-center'><span class='m-r-10'><i class='fa fa-fw fa-lg fa-globe'></i> matiasgallipoli.com</span><span class='m-r-10'><i class='fa fa-fw fa-lg fa-phone-volume'></i> T:016-18192302</span><span class='m-r-10'><i class='fa fa-fw fa-lg fa-envelope'></i> rtiemps @gmail.com</span></p></div></div></div></div>");


            //sbtemp.Append("<table border='1'>");
            //sbtemp.Append("<tr> <td colspan='6' style='color:red; text-align:center;'></td> </tr>");
            //sbtemp.Append("<tr> <td>hello</td> <td>done</td> </tr>");
            //sbtemp.Append("</table>");


            string FileName = "SalarySlip_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".pdf";
            StringReader sr = new StringReader(sbtemp.ToString());
            Document pdfDoc = new Document(PageSize.A4, 20f, 10f, 10f, 10f);
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
            pdfDoc.Close();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.End();

        }
       
        
    }
}