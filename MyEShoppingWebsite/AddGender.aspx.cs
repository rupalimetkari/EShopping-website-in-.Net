using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddGender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            BindGenderRepeater();
        }
    }

    private void BindGenderRepeater()
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Gender", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptrGender.DataSource = dt;
                    rptrGender.DataBind();
                }
            }

        }
    }

    protected void btnAddBrand_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Gender(GenderName) values('" + txtGender.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Gender Added Successfully'); </script>");
            txtGender.Text = string.Empty;
            con.Close();
            txtGender.Focus();

        }
        BindGenderRepeater();
    }
}