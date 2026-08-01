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
    public class UserLoginController : ApiController
    {
        private static String conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpPost]
        [Route("api/userLogin")]

        public HttpResponseMessage User_Login()
        {
            try
            {
                string userName = HttpContext.Current.Request.Form["userName"];
                string password = HttpContext.Current.Request.Form["password"];

                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("user_login", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@user_name", userName);
                cmd.Parameters.AddWithValue("@password", password);

                object rowsAffected = cmd.ExecuteScalar();

                if (rowsAffected != null && rowsAffected != DBNull.Value)
                {
                    string fullName = rowsAffected.ToString();

                    // Store user details in session variables
                    HttpContext.Current.Session["role"] = "user";
                    HttpContext.Current.Session["username"] = userName;
                    HttpContext.Current.Session["fullname"] = fullName;

                    var responseData = new
                    {
                        Message = "Successfully logged in.",
                        FullName = fullName
                    };

                    return Request.CreateResponse(HttpStatusCode.OK, responseData);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = "Invalid User ID or Password." });
                }

            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

    }
}