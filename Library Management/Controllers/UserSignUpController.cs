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
    public class UserSignUpController : ApiController
    {
        // GET: UserSignUp
       private static String conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpPost]
        [Route("api/saveUser")]

        public HttpResponseMessage Save_User()
        {

            try
            {
                string name = HttpContext.Current.Request.Form["name"];
                string dob = HttpContext.Current.Request.Form["dob"];
                string contactno = HttpContext.Current.Request.Form["contactno"];
                string email = HttpContext.Current.Request.Form["email"];
                string state = HttpContext.Current.Request.Form["state"];
                string city = HttpContext.Current.Request.Form["city"];
                string pincode = HttpContext.Current.Request.Form["pincode"];
                string address = HttpContext.Current.Request.Form["address"];
                string userid = HttpContext.Current.Request.Form["userid"];
                string password = HttpContext.Current.Request.Form["password"];

                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("save_user", con);

                cmd.CommandType = CommandType.StoredProcedure;

                
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@contact_no", contactno);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@state", state);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@pincode", pincode);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@password", password);

                int rowsAffected = cmd.ExecuteNonQuery();

                if(rowsAffected > 0)
                {
                    var str = "Successfully inserted.";

                    var respo = new
                    {
                        Message = "Successfully inserted."
                    };
                    HttpResponseMessage message_response = Request.CreateResponse(HttpStatusCode.OK, str);
                    return message_response;
                }
                else
                {
                    var str = "Not inserted.";

                    var respo = new
                    {
                        Message = "Not inserted"
                    };
                    HttpResponseMessage message_response = Request.CreateResponse(HttpStatusCode.OK, str);
                    return message_response;
                }
            

            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());

                return msg;
            }
            
        }
    }
}