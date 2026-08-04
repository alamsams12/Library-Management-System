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
    public class AuthorManagementController : ApiController
    {
        private static string conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpPost]
        [Route("api/saveAuthor")]

        public HttpResponseMessage authorManagement()
        {
            try
            {
                string author_name = HttpContext.Current.Request.Form["author_name"];
                string country = HttpContext.Current.Request.Form["country"];
                string description = HttpContext.Current.Request.Form["description"];

                if (con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("save_author", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@author_name", author_name);
                cmd.Parameters.AddWithValue("@country", country);
                cmd.Parameters.AddWithValue("@description", description);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    var str = "Successfully inserted";

                    var respo = new
                    {
                        Message = "Author added successfully"
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
        

        [HttpGet]
        [Route("api/getAuthor")]

        public HttpResponseMessage getAuthor()
        {
            try
            {
                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("get_author", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var authors = new List<Dictionary<string, object>>();
                if(ds.Tables.Count > 0)
                {
                    foreach(DataRow row in ds.Tables[0].Rows)
                    {
                        var rowData = new Dictionary<string, object>();
                        foreach(DataColumn col in ds.Tables[0].Columns)
                        {
                            rowData[col.ColumnName] = row[col];
                        }
                        authors.Add(rowData);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Authors = authors,
                });
            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());
                return msg;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }


        [HttpPost]
        [Route("api/deleteAuthor")]

        public HttpResponseMessage deleteAuthor()
        {
            try {
                string author_id = HttpContext.Current.Request.Form["author_id"];

                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("delete_author",con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@author_id", author_id);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    var str = "Successfully deleted";

                    HttpResponseMessage message_response = Request.CreateResponse(HttpStatusCode.OK, str);
                    return message_response;
                }
                else
                {
                    var str = "Not inserted.";

                    HttpResponseMessage message_response = Request.CreateResponse(HttpStatusCode.OK, str);
                    return message_response;
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