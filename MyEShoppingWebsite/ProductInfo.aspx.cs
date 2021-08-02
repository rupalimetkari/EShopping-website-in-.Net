using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProductInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {    
        if(Request.QueryString["PID"]!= null)
        { 
          if (!IsPostBack)
          {
            BindImageRepeater();
                BindProductsInfo();
          }
        }
        else
        {
            Response.Redirect("~/ViewProducts.aspx");
        }

    }

    private void BindProductsInfo()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Products where PID='" + PID + "' ", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    repterProductInfo.DataSource = dt;
                    repterProductInfo.DataBind();
                }
            }

        }
    }

    private void BindImageRepeater()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand("select * from ProductImages where PID='"+PID+"' ", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }

        }
    }

 protected string GetActiveImgClass(int ItemIndex)
    {
        if(ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    protected void repterProductInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if(e.Item .ItemType==ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
        {
            string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
            string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;
            string SubCatID = (e.Item.FindControl("hfSubCatID") as HiddenField).Value;
            string GenderID = (e.Item.FindControl("hfGenderID") as HiddenField).Value;


            RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;

            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Sizes where BrandID='" + BrandID + "' and CategoryID = "+CatID+" and SubCategoryID = "+SubCatID+" and GenderID = "+GenderID+" ", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        rblSize.DataSource = dt;
                        rblSize.DataTextField = "Sizename";
                        rblSize.DataValueField = "Sizeid";
                        rblSize.DataBind();
                    }
                }

            }
        }
    }



    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {
        string SelectedSize = string.Empty;
        foreach (RepeaterItem item in repterProductInfo.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                var rbList = item.FindControl("rblSize") as RadioButtonList;
                SelectedSize = rbList.SelectedValue;
                var lblError = item.FindControl("lblError") as Label;
                lblError.Text = "";
            }

        }

        if (SelectedSize!="")
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            if(Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                CookiePID = CookiePID + "," + PID + "-" + SelectedSize;

                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = CookiePID;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            else
            {
                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedSize;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            Response.Redirect("~/ProductInfo.aspx?PID =" + PID);
        }
        else
        {
            foreach(RepeaterItem item in repterProductInfo.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "Please Select a Size";
                }
            }
        }
    }
}