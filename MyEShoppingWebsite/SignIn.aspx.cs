using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request .Cookies["Email"] != null && Request.Cookies["Password"] != null)
            {
                tbEmail.Text = Request.Cookies["Email"].Value;
                tbPass.Text = Request.Cookies["Password"].Value;
                ckbRemeber.Checked = true;
            }
        }
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from users where Email=@email and Password=@pwd", con);
            cmd.Parameters.AddWithValue("@email",tbEmail.Text);
            cmd.Parameters.AddWithValue("@pwd",tbPass.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if(dt.Rows .Count != 0)
            {
                if(ckbRemeber .Checked)
                {
                    Response.Cookies["Email"].Value = tbEmail.Text;
                    Response.Cookies["Password"].Value = tbPass.Text;

                    Response.Cookies["Email"].Expires = DateTime.Now.AddMonths(5);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddMonths(5);
                }
                else
                {
                    Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                }

                string Utype;
                Utype = dt.Rows[0][5].ToString().Trim();

                if(Utype == "User")
                {
                    Session["Email"] = tbEmail.Text;
                    Response.Redirect("~/UserHome.aspx");
                }

                if (Utype == "Admin")
                {
                    Session["Email"] = tbEmail.Text;
                    Response.Redirect("~/AdminHome.aspx");
                }



            }
            else
            {
                lblError.Text = "Invalid Email and Password";
            }

            //Response.Write("<script> alert('Login Successfully done'); </script>");
            clr();
            con.Close();
           
        }
    }

    private void clr()
    {
        tbEmail.Text = string.Empty;
        tbEmail.Focus();
        tbPass.Text = string.Empty;
       
    }
}