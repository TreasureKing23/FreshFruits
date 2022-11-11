using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySql.Data.Types;

namespace FreshFruits.Users
{
    public partial class Login : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=reon;password=mersades123;persistsecurityinfo=True;database=estoredb");
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Add("cID", null);
            Session.Add("cName", null);
            Session.Add("role", null);


         /*   if (!Page.IsPostBack)
            {
                if (Session["cID"] != null)
                {
                    logindiv.Visible = false;
                    titlelabel.Text = "YOU ARE ALREADY LOGGED IN" + Session["cName"].ToString();
                }

            } */
              
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

     
        protected void L_Click(object sender, EventArgs e)
        {


           
            con.Open();

           
            MySqlCommand login = new MySqlCommand("Select CustomerID, CustomerName, Role from customer where Email = '"+TextBox1.Text.Trim()+"' and Password = '"+TextBox2.Text.Trim()+"' ",con);
            MySqlDataReader dr = login.ExecuteReader();
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    Label3.Text = dr.GetValue(0).ToString();
                    Session["cID"]= dr.GetValue(0).ToString();
                    Session["cName"] = dr.GetValue(1).ToString();
                    Session["role"] = dr.GetValue(2).ToString();
                    Response.Redirect("~/Products.aspx");
                }
            }
            else
            {
                Label3.Text = "Invalid Email or Password";
            }

            con.Close();
            
            

        }
    }
}