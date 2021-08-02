using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddBrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindBrandRepeater();
        }
    }

    private void BindBrandRepeater()
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Brands", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptrBrands.DataSource = dt;
                    rptrBrands.DataBind();
                }
            }

        }
    }

    protected void btnAddBrand_Click1(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Brands(Name) values('" + txtBrandName.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Brand Add Successfully'); </script>");
            txtBrandName.Text = string.Empty;
            con.Close();
            
            txtBrandName.Focus();
     
        }
        BindBrandRepeater();
    }
}