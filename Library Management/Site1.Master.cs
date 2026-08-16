using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "admin")
                {

                    if (Session["fullname"] != null)
                    {
                        LinkHelloUser.Visible = true;
                        LinkHelloUser.Text = "Hello " + Session["fullname"].ToString();

                    }
                    else
                    {
                        LinkHelloUser.Text = "Hello User";
                    }
                    
                    LinkLogout.Visible = true;
                    LinkSignUp.Visible = false;

                    LinkAuthorManagement.Visible = true;
                    LinkPublisherManagement.Visible = true;
                    LinkBookInventory.Visible = true;
                    LinkBookIssuing.Visible = true;
                    LinkMemberManagement.Visible = true;

                }
                else if (Session["role"].ToString() == "user")
                {
                    if (Session["fullname"] != null)
                    {
                        LinkHelloUser.Visible = true;
                        LinkHelloUser.Text = "Hello " + Session["fullname"].ToString();
                        
                    }
                    else
                    {
                        LinkHelloUser.Text = "Hello User";
                    }
                    LinkUserLogin.Visible = false;
                    LinkLogout.Visible = true;
                    LinkSignUp.Visible = false;
                }
                
            }
            else
            {
                LinkHelloUser.Visible = false;
                LinkLogout.Visible = false;

                LinkAuthorManagement.Visible = false;
                LinkPublisherManagement.Visible = false;
                LinkBookInventory.Visible = false;
                LinkBookIssuing.Visible = false;
                LinkMemberManagement.Visible = false;
            }

        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissue.aspx");
        }

        protected void LinkButton1e_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmemberinfo.aspx");
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void LogoutButton(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("homepage.aspx");

            //LinkLogout.Visible = false;
            //LinkSignUp.Visible = true;
            //LinkUserLogin.Visible = true;
            //LinkHelloUser.Visible = false;

            //LinkAuthorManagement.Visible = true;
            //LinkPublisherManagement.Visible = false;
            //LinkBookInventory.Visible = false;
            //LinkBookIssuing.Visible = false;
            //LinkMemberManagement.Visible = false;

            //Response.Redirect("homepage.aspx");
        }
    }
}