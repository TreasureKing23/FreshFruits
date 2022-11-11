using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySql.Data.Types;

namespace FreshFruits
{
    public partial class Cart : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=reon;password=mersades123;persistsecurityinfo=True;database=estoredb");
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string id = (string)Session["ID"];
            string cid = (string)Session["cID"] ;
            string count = (string)Session["Quantity"];
            string pName = (string)Session["ProdName"];
            string pPrice = (string)Session["ProdPrice"];

            Boolean exist;
           


            if(Session["ID"] != null && Session["cID"]!=null)
            {
            
                int cidnum = Int32.Parse(cid);
                int c = Int32.Parse(count);
                int idnum = Int32.Parse(id);
                float price = float.Parse(pPrice);
                

                if (!Page.IsPostBack)
                {
                    


                    con.Open();
                     MySqlCommand search = new MySqlCommand("Select * from cart where  ProductID = @ProductID and CustomerID = @CustomerID", con);
                     search.Parameters.Add("@CustomerID", MySqlDbType.Int32).Value = cidnum;
                     search.Parameters.Add("@ProductID", MySqlDbType.Int32).Value = idnum;          
                     MySqlDataReader dr = search.ExecuteReader();
                    if (dr.HasRows)
                    {
                        exist = true;
                    }
                    else
                    {
                        exist = false;
                    }
                    
                    con.Close();

                    
                     if(exist == true)
                     {
                        con.Open();
                        MySqlCommand updatecart = new MySqlCommand("UPDATE cart set Quantity = @Quantity+Quantity where ProductID = @ProductID and CustomerID = @CustomerID", con);
                         updatecart.Parameters.Add("@CustomerID", MySqlDbType.Int32).Value = cidnum;
                         updatecart.Parameters.Add("@ProductID", MySqlDbType.Int32).Value = idnum;
                         updatecart.Parameters.Add("@Quantity", MySqlDbType.Int32).Value = c;
                         updatecart.ExecuteNonQuery();
                        con.Close();

                     }
                     else
                     {
                        con.Open();
                         MySqlCommand addcart = new MySqlCommand("Insert into cart (ProductID,CustomerID,ProductName,ProductPrice,Quantity) values(@ProductID, @CustomerID,@ProductName,@ProductPrice,@Quantity)", con);
                         addcart.Parameters.Add("@ProductID", MySqlDbType.Int32).Value = idnum;
                         addcart.Parameters.Add("@CustomerID", MySqlDbType.Int32).Value = cidnum;
                         addcart.Parameters.Add("@ProductName", MySqlDbType.Text).Value = pName;
                         addcart.Parameters.Add("@ProductPrice", MySqlDbType.Float).Value = price;
                         addcart.Parameters.Add("@Quantity", MySqlDbType.Int32).Value = c;
                         addcart.ExecuteNonQuery();
                        con.Close();

                     }
                    

                    Session["Quantity"] = "0";


                    con.Open();
                    MySqlCommand sub = new MySqlCommand("Update cart set Subtotal = Quantity * ProductPrice where ProductID = @ProductID and CustomerID = @CustomerID", con);
                    sub.Parameters.Add("@CustomerID", MySqlDbType.Int32).Value = cidnum;
                    sub.Parameters.Add("@ProductID", MySqlDbType.Int32).Value = idnum;
                    sub.ExecuteNonQuery();
                    con.Close();

      
                   

                }

            }
            if (Session["cID"] == null)
            {
                this.Button1.Visible = false;
                cartlabel.Text = "Please Sign in to See Cart";
            }



        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["cID"] != null)
            {





                Random r = new Random();

                int num = r.Next(0,100) + 256;
                Session.Add("orderID", num);

                con.Open();
                MySqlCommand check = new MySqlCommand("Insert into invoice(InvoiceID,CustomerName,CustomerID,Date,GrandTotal) values (@InvoiceID,@CustomerName,@CustomerID,@Date,(SELECT SUM(SubTotal) AS GrandTotal FROM cart where Quantity!=0 and CustomerID=@CustomerID))", con);
                check.Parameters.Add("@InvoiceID", MySqlDbType.Int32).Value = num;
                check.Parameters.Add("@CustomerName", MySqlDbType.Text).Value = Session["cName"];
                check.Parameters.Add("@CustomerID", MySqlDbType.Int32).Value = Session["cID"];
                check.Parameters.Add("@Date", MySqlDbType.Text).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm:ss");
                check.ExecuteNonQuery();
                con.Close();


                con.Open();
                MySqlCommand del = new MySqlCommand("delete from cart where CustomerID = @CustomerID", con);
                del.Parameters.Add("@CustomerID", MySqlDbType.Int32).Value = Session["cID"];
                del.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/InvoicePage.aspx");
            }
            

        }
    }
}