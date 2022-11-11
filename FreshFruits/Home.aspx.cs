using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreshFruits
{
    
    public partial class Home : Page
    {
        MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=reon;password=mersades123;persistsecurityinfo=True;database=estoredb");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if(Session["cName"]!=null)
            {
                Name.Text = "Welcome " + Session["cName"].ToString();

            }

        }
    }
}