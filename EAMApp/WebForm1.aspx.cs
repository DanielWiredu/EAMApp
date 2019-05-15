using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace EAMApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection;
        SqlCommand command;
        SqlDataReader reader;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtPartners = new DataTable();
                //string query = "SELECT Id from tblCovenantPartners";
                string query = "select id, phonenumber from tblCovenantPartners where len(phonenumber) <= 15";
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dtPartners);
                        }
                    }
                }
                string id = "";
                //string partnerid = "";
                string phoneNumber = "";
                string[] telephones;
                foreach (DataRow row in dtPartners.Rows)
                {
                    phoneNumber = row["PHONENUMBER"].ToString();

                    id = row["Id"].ToString();
                    //switch (id.Length)
                    //{
                    //    case 1:
                    //        partnerid = "000" + id;
                    //        break;
                    //    case 2:
                    //        partnerid = "00" + id;
                    //        break;
                    //    case 3:
                    //        partnerid = "0" + id;
                    //        break;
                    //    default:
                    //        return;
                    //}
                    //partnerid = "EAM" + partnerid;

                    //query = "update tblCovenantPartners set PartnerId='" + partnerid + "' where id='" + id + "'";
                    query = "update tblCovenantPartners set Telephone1='" + phoneNumber + "' where id='" + id + "'";
                    connection = new SqlConnection(connectionString);
                    command = new SqlCommand(query, connection);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    command.ExecuteNonQuery();
                    command.Dispose();
                    connection.Dispose();
                }
            }
            catch (Exception ex)
            {
                lblMsg.InnerText = ex.Message;
            }
        }
    }
}