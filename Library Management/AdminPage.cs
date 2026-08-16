using System;
using System.Web.UI;

namespace Library_Management
{
    public class AdminPage : Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            string role = Session["role"]?.ToString();

            Response.Write("ROLE = " + role);

            if (role != "admin")
            {
                Response.Redirect("adminlogin.aspx");
                return;
            }
        }
    }
}