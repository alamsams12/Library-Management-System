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
    public class PublisherManagementController : ApiController
    {
        public static string conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd;

        [HttpPost]
        [Route("api/savePublisher")]

        public HttpResponseMessage savePublisher()
        {
            try
            {
                string publisher_name = HttpContext.Current.Request.Form["publisher_name"];
                string country = HttpContext.Current.Request.Form["country"];
                string description = HttpContext.Current.Request.Form["description"];

                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("save_publisher", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@publisher_name", publisher_name);
                cmd.Parameters.AddWithValue("@country", country);
                cmd.Parameters.AddWithValue("@description", description);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    var str = "Successfully inserted";

                    var respo = new
                    {
                        Message = "Successfully inserted!!"
                    };
                    HttpResponseMessage message_response = Request.CreateResponse(HttpStatusCode.OK, str);
                    return message_response;
                }
                else
                {
                    var str = "Not inserted";

                    var respo = new
                    {
                        Message = "Something went wrong!!"
                    };
                    HttpResponseMessage msg = Request.CreateResponse(HttpStatusCode.OK, str);
                    return msg;
                }
                
            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());

                return msg;
            }
        }

        [HttpGet]
        [Route("api/getPublisher")]

        public HttpResponseMessage getPublisher()
        {
            try
            {
                if (con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("get_publisher", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var publishers = new List<Dictionary<string, object>>();
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var rowData = new Dictionary<string, object>();
                        foreach (DataColumn col in ds.Tables[0].Columns)
                        {
                            rowData[col.ColumnName] = row[col];
                        }
                        publishers.Add(rowData);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Publishers = publishers,
                });
            }
            catch (Exception ex)
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
        [Route("api/deletePublisher")]

        public HttpResponseMessage deletePublisher()
        {
            try
            {
                string publisher_id = HttpContext.Current.Request.Form["publisher_id"];

                if (con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("delete_publisher", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@publisher_id", publisher_id);

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