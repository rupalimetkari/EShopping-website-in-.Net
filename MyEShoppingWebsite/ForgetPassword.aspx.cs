using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from users where Email=@email", con);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int id = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("insert into ForgotPass(Uid,id,RequestDateTime) values('" + myGUID + "','" + id + "',GETDATE())", con);
                cmd1.ExecuteNonQuery();

                //SEND RESET LINK ON EMAIL

                string ToEmailAddress = dt.Rows[0][2].ToString();
                string Username = dt.Rows[0][1].ToString();
                string EmailBody = "Hi," + Username + ",<br/><br/>Click the link below to reset your password <br/> http://localhost:59364/RecoverPassword.aspx?id=" + myGUID;

                MailMessage PassRecMail = new MailMessage("rupalimetkari1@gmail.com", ToEmailAddress);

                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";

                //using (SmtpClient client = new SmtpClient())
                //{
                //    client.EnableSsl = true;
                //    client.UseDefaultCredentials = false;
                //    client.Credentials = new NetworkCredential("rupalimetkari1@gmail.com", 587);
                //    client.Host = "smtp.gmail.com";
                //    client.Port = 587;
                //    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                //    client.Send(PassRecMail);
                //}
                SmtpClient smtp = new SmtpClient("rupalimetkari1@gmail.com", 587);
                smtp.Credentials = new NetworkCredential()
                {
                    UserName = "rupalimetkari1@gmail.com",
                    Password = ""

                };
                smtp.EnableSsl = true;
                smtp.Send(PassRecMail);


                //SEND RESET LINK ON EMAIL

                lblResetPassMsg.Text = "Reset link send your email";
                lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                txtEmail.Text = string.Empty;
            }
            else
            {
                lblResetPassMsg.Text = "Oopss this email does not exist..try again";
                lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                txtEmail.Text = string.Empty;
                txtEmail.Focus();

            }

        }

    }
}