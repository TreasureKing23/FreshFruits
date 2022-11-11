using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreshFruits
{
    public partial class Products : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("server=127.0.0.1;user id=reon;password=mersades123;persistsecurityinfo=True;database=estoredb");


        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Add("ID", null);
            Session.Add("ProdName", null);
            Session.Add("ProdPrice", null);
            Session.Add("Quantity", null);


        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void AddToCart(object sender, EventArgs e)
        {
            
            string productId = ((((Button)sender).NamingContainer as RepeaterItem).FindControl("prodID") as Label).Text;
            string productName = ((((Button)sender).NamingContainer as RepeaterItem).FindControl("prodname") as Label).Text;
            string productPrice = ((((Button)sender).NamingContainer as RepeaterItem).FindControl("prodprice") as Label).Text;
            string count = ((((Button)sender).NamingContainer as RepeaterItem).FindControl("Quantity") as TextBox).Text;



            if(Session["cID"]!=null)
            {
                Session["ID"] =productId;
                Session["ProdName"]=productName;
                Session["ProdPrice"]= productPrice;
                Session["Quantity"]= count;
            }
            
            Response.Redirect("~/Cart.aspx");
            

        }


        
    }
}