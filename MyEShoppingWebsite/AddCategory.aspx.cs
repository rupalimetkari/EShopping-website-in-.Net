using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategoryRepeater();
        }
    }

    private void BindCategoryRepeater()
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Category", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptrCategory.DataSource = dt;
                    rptrCategory.DataBind();
                }
            }

        }
    }

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Category(CatName) values('" + txtCategoryName.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Category Add Successfully'); </script>");
            txtCategoryName.Text = string.Empty;
            con.Close();
            //lblMsg.Text = "Registration Successfully done";
            //lblMsg.ForeColor = System.Drawing.Color.Green;
            txtCategoryName.Focus();

        }
        BindCategoryRepeater();
    }
}