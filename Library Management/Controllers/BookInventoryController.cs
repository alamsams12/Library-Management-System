using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace Library_Management.Controllers
{
    public class BookInventoryController : ApiController
    {
        private static string conn =ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpPost]
        [Route("api/saveBook")]

        public HttpResponseMessage saveBook()
        {
            try
            {
                string bookName = HttpContext.Current.Request.Form["bookName"];
                string language = HttpContext.Current.Request.Form["language"];
                string authorName = HttpContext.Current.Request.Form["authorName"];
                string publisher = HttpContext.Current.Request.Form["publisher"];
                DateTime publisherDate = Convert.ToDateTime(HttpContext.Current.Request.Form["publisherDate"]);
                string genre = HttpContext.Current.Request.Form["genre"];
                string edition = HttpContext.Current.Request.Form["edition"];
                int bookCost =Convert.ToInt32(HttpContext.Current.Request.Form["bookCost"]);
                int pages = Convert.ToInt32(HttpContext.Current.Request.Form["pages"]);
                int totalStock = Convert.ToInt32(HttpContext.Current.Request.Form["totalStock"]);
                int currentStock = Convert.ToInt32(HttpContext.Current.Request.Form["currentStock"]);
                int issuedStock = Convert.ToInt32(HttpContext.Current.Request.Form["issuedStock"]);
                string description = HttpContext.Current.Request.Form["description"];
                string file = HttpContext.Current.Request.Form["file"];

                string root = HttpContext.Current.Server.MapPath("~/Uploads/Books");
                if (!Directory.Exists(root))
                    Directory.CreateDirectory(root);
                string filePathForDb = "";
                if (HttpContext.Current.Request.Files.Count > 0)
                {
                    HttpPostedFile doc_file = HttpContext.Current.Request.Files[0];
                    if (doc_file != null && doc_file.ContentLength > 0)
                    {
                        string o_file_name = Path.GetFileName(doc_file.FileName);

                        if (!string.IsNullOrWhiteSpace(o_file_name))
                        {
                            string full_path = Path.Combine(root, o_file_name);

                            doc_file.SaveAs(full_path);

                            filePathForDb = "Uploads/Books/" + o_file_name;
                        }
                    }
                }

                if (con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("save_book", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@book_name", bookName);
                cmd.Parameters.AddWithValue("@genre",genre);
                cmd.Parameters.AddWithValue("@author_name",authorName);
                cmd.Parameters.AddWithValue("@publisher_name",publisher);
                cmd.Parameters.Add("@publish_date", SqlDbType.Date).Value = publisherDate; 
                cmd.Parameters.AddWithValue("@language",language);
                cmd.Parameters.AddWithValue("@edition",edition);
                cmd.Parameters.AddWithValue("@book_cost",bookCost);
                cmd.Parameters.AddWithValue("@pages",pages);
                cmd.Parameters.AddWithValue("@description",description);
                cmd.Parameters.AddWithValue("@actual_stock", totalStock);
                cmd.Parameters.AddWithValue("@current_stock",currentStock);
                cmd.Parameters.AddWithValue("@issued_stock",issuedStock);
                cmd.Parameters.AddWithValue("@file", filePathForDb);

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
        
    }
}