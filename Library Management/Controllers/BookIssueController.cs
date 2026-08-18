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
    public class BookIssueController : ApiController
    {
        private static String conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpGet]
        [Route("api/searchBook")]

        public HttpResponseMessage searchBook(string searchTerm = "")
        {
            try
            {
                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("searchBook", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@searchTerm", string.IsNullOrEmpty(searchTerm) ? "" : searchTerm);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var servicesvendor = new List<Dictionary<string, object>>();
                if (ds.Tables.Count > 0)
                {

                    foreach (DataRow row in ds.Tables[0].Rows)
                    {

                        var rowData = new Dictionary<string, object>();
                        foreach (DataColumn col in ds.Tables[0].Columns)
                        {
                            rowData[col.ColumnName] = row[col];
                        }

                        servicesvendor.Add(rowData);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, servicesvendor);
            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());
                return msg;
            }
        }
        
        [HttpGet]
        [Route("api/searchMember")]

        public HttpResponseMessage searchMember(string searchTerm = "")
        {
            try
            {
                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("searchMember", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@searchTerm", string.IsNullOrEmpty(searchTerm) ? "" : searchTerm);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var servicesvendor = new List<Dictionary<string, object>>();
                if (ds.Tables.Count > 0)
                {

                    foreach (DataRow row in ds.Tables[0].Rows)
                    {

                        var rowData = new Dictionary<string, object>();
                        foreach (DataColumn col in ds.Tables[0].Columns)
                        {
                            rowData[col.ColumnName] = row[col];
                        }

                        servicesvendor.Add(rowData);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, servicesvendor);
            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());
                return msg;
            }
        }

        [HttpPost]
        [Route("api/issueBooks")]

        public HttpResponseMessage issue_Books()
        {
            string memberName = HttpContext.Current.Request.Form["memberName"];
            string bookName = HttpContext.Current.Request.Form["bookName"];
            string memberID = HttpContext.Current.Request.Form["memberID"];
            string bookID = HttpContext.Current.Request.Form["bookID"];
            string start_date = HttpContext.Current.Request.Form["start_date"];
            string end_date = HttpContext.Current.Request.Form["end_date"];

            if (con.State != ConnectionState.Open) { con.Open(); }

            cmd = new SqlCommand("issue_books", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@member_id", memberID);
            cmd.Parameters.AddWithValue("@member_name", memberName);
            cmd.Parameters.AddWithValue("@book_id", bookID);
            cmd.Parameters.AddWithValue("@book_name", bookName);
            cmd.Parameters.AddWithValue("@issue_date", start_date);
            cmd.Parameters.AddWithValue("@due_date", end_date);

            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                var str = "Successfully issued ";

                var respo = new
                {

                    Message = "Successfully issued",

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

        [HttpGet]
        [Route("api/getIssuedBooks")]

        public HttpResponseMessage get_issued_books()
        {
            try
            {
                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("get_issued_books", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var books = new List<Dictionary<string, object>>();
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var rowData = new Dictionary<string, object>();
                        foreach (DataColumn col in ds.Tables[0].Columns)
                        {
                            rowData[col.ColumnName] = row[col];
                        }
                        books.Add(rowData);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Books = books,
                });


            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());
                return msg;
            }
        }
    }
}
