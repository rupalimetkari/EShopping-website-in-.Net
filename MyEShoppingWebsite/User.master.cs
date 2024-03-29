﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Email"] != null)
        {
            //lblSuccess.Text = "Login Successfully,Welcome" + Session["Email"].ToString() + "</b>";
            btnlogout.Visible = true;
            btnlogin.Visible = false;
        }
        else
        {
            btnlogout.Visible = false;
            btnlogin.Visible = true;
            Response.Redirect("~/Default.aspx");

        }
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
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
