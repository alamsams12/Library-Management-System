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
    public class MemberManagementController : ApiController

    {
        private static string conn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conn);

        SqlCommand cmd;

        [HttpGet]
        [Route("api/getUser")]

        public HttpResponseMessage getUser()
        {
            try
            {
                if(con.State != ConnectionState.Open) { con.Open(); }

                cmd = new SqlCommand("get_user", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var users = new List<Dictionary<string, object>>();
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var rowData = new Dictionary<string, object>();
                        foreach (DataColumn col in ds.Tables[0].Columns)
                        {
                            rowData[col.ColumnName] = row[col];
                        }
                        users.Add(rowData);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Users = users,
                });
            }
            catch(Exception ex)
            {
                HttpResponseMessage msg = this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message.ToString());
                return msg;
            }
            finally
            {
                if (con.State == ConnectionState.Open) { con.Close(); }
            }
        }
    }
}