using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class AddProduct : System.Web.UI.Page
{
    public static String CS = "Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBrand();
            BindCategory();
            BindGender();

            ddlSubCategory.Enabled = false;
            ddlGender.Enabled = false;


        }
    }

    private void BindGender()
    {
        using (SqlConnection con = new SqlConnection(CS))

        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Select * from Gender with(nolock)", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlGender.DataSource = dt;
                ddlGender.DataTextField = "GenderName";
                ddlGender.DataValueField = "GenderID";
                ddlGender.DataBind();
                ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    private void BindCategory()
    {
        using (SqlConnection con = new SqlConnection(CS))

        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Select * from Category", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CatName";
                ddlCategory.DataValueField = "CatID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    private void BindBrand()
    {
        using (SqlConnection con = new SqlConnection(CS))

        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Select * from Brands", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlBrand.DataSource = dt;
                ddlBrand.DataTextField = "Name";
                ddlBrand.DataValueField = "BrandID";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("sp_InserProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName",txtProductName.Text);
            cmd.Parameters.AddWithValue("@PPrice",TxtPrice.Text);
            cmd.Parameters.AddWithValue("@PSelPrice", txtSellingPrice.Text);
            cmd.Parameters.AddWithValue("@PBrandID",ddlBrand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PSubCatID", ddlSubCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PGenderID", ddlGender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@PProductsDetails", txtProductDetails.Text);
            cmd.Parameters.AddWithValue("@PMaterialCare", txtCare.Text);

            if (ckbFreeDelivery.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());

            }
            else
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());

            }

            if (ckbreturnPolicy.Checked == true)
            {
                cmd.Parameters.AddWithValue("@30DAyRet", 1.ToString());

            }
            else
            {
                cmd.Parameters.AddWithValue("@30DAyRet", 0.ToString());

            }

            if (ckbCashOnD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@COD", 1.ToString());

            }
            else
            {
                cmd.Parameters.AddWithValue("@COD", 0.ToString());


            }
            con.Open();
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

            for(int i =0; i<cblSize.Items.Count; i++)
            {
                if (cblSize.Items[i].Selected == true)
                {
                    Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                    int Quantity = Convert.ToInt32(txtQuantity.Text);

                    SqlCommand cmd2 = new SqlCommand("insert into ProductSizeQuantity values('" + PID + "','" + SizeID + "','" + Quantity + "')", con);
                    cmd2.ExecuteNonQuery();
                }

            }

            if(fuImg01.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProductImages/") + PID;
                if(!Directory.Exists (SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extension = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01"+ Extension);

                SqlCommand cmd3 = new SqlCommand("insert into ProductImages values('" + PID + "' , '" + txtProductName.Text.ToString().Trim() +"01"+ "' , '" + Extension + "' )", con);
                cmd3.ExecuteNonQuery();
            }

            if (fuImg02.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extension = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extension);

                SqlCommand cmd4 = new SqlCommand("insert into ProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extension + "')", con);
                cmd4.ExecuteNonQuery();
            }

            if (fuImg03.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extension = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extension);

                SqlCommand cmd5 = new SqlCommand("insert into ProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extension + "')", con);
                cmd5.ExecuteNonQuery();
            }

            if (fuImg04.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extension = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extension);

                SqlCommand cmd6 = new SqlCommand("insert into ProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extension + "')", con);
                cmd6.ExecuteNonQuery();
            }

            if (fuImg05.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extension = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg05.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "05" + Extension);

                SqlCommand cmd7 = new SqlCommand("insert into ProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "05" + "','" + Extension + "')", con);
                cmd7.ExecuteNonQuery();
            }

            Response.Write("<script> alert('Products Add Successfully'); </script>");
            txtProductName.Text = string.Empty;
            TxtPrice.Text = string.Empty;
            txtSellingPrice.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtCare.Text = string.Empty;
            txtProductDetails.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            ddlBrand.ClearSelection();
            ddlCategory.ClearSelection();
            ddlSubCategory.ClearSelection();
            ddlGender.ClearSelection();
            ckbFreeDelivery.Checked = false;
            ckbreturnPolicy.Checked = false;

            ckbCashOnD.Checked = false;
            cblSize.ClearSelection();

            ddlSubCategory.Enabled = false;
            ddlGender.Enabled = false;
            cblSize.Enabled = false;
            fuImg01.Enabled = false;
            fuImg02.Enabled = false;
            fuImg03.Enabled = false;
            fuImg04.Enabled = false;
            fuImg05.Enabled = false;
        }


    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubCategory.Enabled = true;
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(CS))

        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Select * from SubCategory where MainCatID = '" + ddlCategory.SelectedItem.Value + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))

        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Select * from Sizes where BrandID = '" + ddlBrand.SelectedItem.Value + "' and CategoryID = '" + ddlCategory.SelectedItem.Value + "' and SubCategoryID = '" + ddlSubCategory.SelectedItem.Value + "' and GenderID = '" + ddlGender.SelectedItem.Value + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                cblSize.DataSource = dt;
                cblSize.DataTextField = "SizeName";
                cblSize.DataValueField = "SizeID";
                cblSize.DataBind();
            }
        }
    }

    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlSubCategory.SelectedIndex != 0)
        {
            ddlGender.Enabled = true;

        }
        else
        {
            ddlGender.Enabled = false;

        }

    }
}