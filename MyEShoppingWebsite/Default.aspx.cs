using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Email"] != null)
        {
            //lblSuccess.Text = "Login Successfully,Welcome" + Session["Email"].ToString() + "</b>";
            btnSignUp.Visible = false;
            btnSignIn.Visible = false;
            btnlogout.Visible = true;
        }
        else
        {
            btnlogout.Visible = false;
            btnSignUp.Visible = true;
            btnSignIn.Visible = true;
            //Response.Redirect("~/Default.aspx");

        }
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

   

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["Email"] = null;
        Response.Redirect("~/Default.aspx");
    }
}