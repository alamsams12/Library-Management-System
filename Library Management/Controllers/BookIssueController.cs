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
    }
}