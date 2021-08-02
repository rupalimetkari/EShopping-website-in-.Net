using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductCart();
            
        }
    }

    private void BindProductCart()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            DataTable dt = new DataTable();
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if(CookieDataArray.Length > 0)
            {
                h4Noitems.InnerText = "My Cart(" + CookieDataArray.Length + " items)";
                Int64 CartTotal = 0;
                Int64 Total = 0;
                for(int i=0; i<CookieDataArray.Length;i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string SizeID = CookieDataArray[i].ToString().Split('-')[1];
                    using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-A6MSJPN\\SQLEXPRESS;Initial Catalog=MyEShopping;Integrated Security=True"))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName("+SizeID+") as SizeNamee," +SizeID+ " as SizeIDD,SizeData.Name,SizeData,Extension from Products A cross apply(select top 1, B.Name,Extension from ProductImages B where B.PID = A.PID) SizeData where A.PID='" + PID + "' ", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {
                               
                                da.Fill(dt);
                               
                            } 
                        }

                    }

                    CartTotal += Convert.ToInt64(dt.Rows[i]["PPrice"]);
                    Total += Convert.ToInt64(dt.Rows[i]["PSelPrice"]);
                }

                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();
                //Price Details.Visible = true;
                spanCartTotal.InnerText = spanCartTotal.ToString();
                spanTotal.InnerText = "Rs. " + Total.ToString();
                spanDiscount.InnerText = "-" + (CartTotal - Total).ToString();
            }

            else
            {
                h4Noitems.InnerText = "Your Shopping Cart is Empty";
                
            }


        }
        else
        {
            h4Noitems.InnerText = "Your Shopping Cart is Empty";

        }
    }

    protected void btnRemoveCart_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        Button btn = (Button) (sender);
        string PIDSIZE = btn.CommandArgument;
        List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PIDSIZE);
        string CookiePIDUpdated = string.Join(",", CookiePIDList.ToArray());
        if(CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);
        }
        else
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("~/Cart.aspx");
    }

    protected void btnBuy_Click(object sender, EventArgs e)
    {

    }
}