using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web;

namespace Library_Management.Controllers
{
    public class AdminLoginController : ApiController
    {
        
        private static String conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpPost]
        [Route("api/adminLogin")]

        public HttpResponseMessage adminLogin()
        {
            try
            {
                string admin = HttpContext.Current.Request.Form["admin"];
                string password = HttpContext.Current.Request.Form["password"];

                if (con.State != ConnectionState.Open) { con.Open(); };

                cmd = new SqlCommand("admin_login_proc", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@admin", admin);
                cmd.Parameters.AddWithValue("@password", password);

                object rowsAffected = cmd.ExecuteScalar();

                if (rowsAffected !=null && Convert.ToInt32(rowsAffected) > 0)
                {
                    HttpContext.Current.Session["role"] = "admin";
                    HttpContext.Current.Session["username"] = "admin";


                    var str = "Successfully logged in.";

                    var respo = new
                    {

                        Message = "Successfully logged in."
                        
                    };
                    HttpResponseMessage message_response = Request.CreateResponse(HttpStatusCode.OK, str);
                    return message_response;
                }
                else
                {
                    return Request.CreateResponse(
                        HttpStatusCode.Unauthorized,
                        new { Message = "Invalid Admin ID or Password." }
                    );
                }

            }
            catch (Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());

                return msg;
            }
            
        }

    }
}