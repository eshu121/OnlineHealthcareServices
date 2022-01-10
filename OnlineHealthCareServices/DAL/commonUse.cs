using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineHealthCareServices.DAL
{
    public class commonUse
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        public int sendOTP(string emailId, string msgType = "Online HealthCare")
        {
            int otpCode = 0;

            Random r = new Random();
            string charset = "0123456789";
            otpCode = Convert.ToInt32(new string(Enumerable.Repeat(charset, 6).Select(a => a[r.Next(a.Length)]).ToArray()));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("Team.OHC.Services@gmail.com", "healthcare@2021");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Activation Code To Verify Your Account";

            msg.Body = "Dear Customer, Your Activation Code is " + otpCode + "\n\n\nThanks";
            string toAddress = emailId;
            msg.To.Add(toAddress);
            string fromAddress = "<Team.OHC.Services@gmail.com>";
            msg.From = new MailAddress(fromAddress, msgType);
            msg.Priority = MailPriority.High;
            try
            {
                smtp.Send(msg);
                return otpCode;
            }
            catch(Exception ex)
            {
                throw;
            }
        }

        public DataTable bindState()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select stateId, stateName from StateList where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            return dt;
        }
        public DataTable bindDistrict(int stateId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select distictId, distictName from DistictList where stateId=" + stateId, con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            return dt;
        }
        public DataTable bindGender()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select genderId, genderName from Gender where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            return dt;
        }
        public DataTable bindAddressType()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select addressId, addressType from AddressType where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            return dt;
        }

        
    }    
}