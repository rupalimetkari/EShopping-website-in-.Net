using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class UserHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Email"]!= null)
        {
            btnlogout.Visible = true;
            btnlogin.Visible = false;
            lblSuccess.Text = "Login Successfully,Welcome"  +  Session["Email"].ToString() + "</b>";
         }
        else
        {
            btnlogout.Visible = false;
            btnlogin.Visible = true;
            //Response.Redirect("~/SignIn.aspx");
        }
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["Email"] = null;
        Response.Redirect("~/Default.aspx");

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }
    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }
}