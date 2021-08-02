using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
       if(isformvalid())
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into users(Username,Email,Password,CPassword,Usertype) values('" + tbUname.Text + "','" + tbEmail.Text + "','" + tbPass.Text + "','" + tbCPass.Text + "','User')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Registration Successfully done'); </script>");
                clr();
                con.Close();
                lblMsg.Text = "Registration Successfully done";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
            Response.Redirect("~/SignIn.aspx");
        }

        else
        {
            Response.Write("<script> alert('Registration failed!!'); </script>");
            lblMsg.Text = "All Fields are mandatory";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }


    }

    private bool isformvalid()
    {
        if(tbUname.Text =="")
        {
            Response.Write("<script> alert('UserName not Valid'); </script>");
            tbUname.Focus();
            return false;
        }
        else if(tbPass.Text == "")
        {
            Response.Write("<script> alert('UserName not Valid'); </script>");
            tbPass.Focus();
            return false;
        }
        else if (tbPass.Text != tbCPass.Text)
        {
            Response.Write("<script> alert('Confirm password not Valid'); </script>");
            tbCPass.Focus();
            return false;
        }
        else if (tbEmail.Text == "")
        {
            Response.Write("<script> alert('Email not Valid'); </script>");
            tbEmail.Focus();
            return false;
        }

        return true;

    }

    public void clr()
    {
        tbUname.Text = string.Empty;
        tbEmail.Text = string.Empty;
        tbPass.Text = string.Empty;
        tbCPass.Text = string.Empty;
    }
}