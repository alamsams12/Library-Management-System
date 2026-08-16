using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class adminmemberinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null ||
            Session["role"].ToString() != "admin")
            {
                Response.Redirect("adminlogin.aspx");
                return;
            }
        }
    }
}