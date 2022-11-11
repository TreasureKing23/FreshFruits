using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreshFruits.Users
{
    public partial class Registration : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=reon;password=mersades123;persistsecurityinfo=True;database=estoredb");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void R_Click(object sender, EventArgs e)
        {
            con.Open();
            MySqlCommand reg = new MySqlCommand("Insert into  customer (CustomerName,Email,Password,Role)  Values('" + TextBox1.Text.Trim() + "', '" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','U')", con);
            try
            {
                reg.ExecuteNonQuery();
                MySqlCommand getInfo = new MySqlCommand("Select CustomerID, CustomerName from customer where CustomerName = '" + TextBox1.Text.Trim() + "' and Password = '" + TextBox3.Text.Trim() + "' ", con);
                MySqlDataReader dr = getInfo.ExecuteReader();
                while (dr.Read())
                {
                    Session.Add("cID", dr.GetValue(0).ToString());
                    Session.Add("cName", dr.GetValue(1).ToString());
                }
                
                Response.Redirect("~/Products.aspx");
            }
            catch (MySqlException)
            {
                emailInUse.Text = "Email is already in use";     
            }
            con.Close();


        }
    }
}