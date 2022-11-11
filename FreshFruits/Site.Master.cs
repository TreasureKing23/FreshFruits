using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace FreshFruits
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string role = (string)Session["role"];
            HtmlGenericControl listitem = this.admin as HtmlGenericControl;
            if(role == null)
            {
                cart.Visible = false;
                login.Visible = true;
                logout.Visible = false;
            }
            else
            {
                login.Visible = false;
                logout.Visible = true;
            }
            if (role == "A")
            {
                admin.Visible = true;
            }
            else
            {
                admin.Visible = false;
            }
        }
    }
}