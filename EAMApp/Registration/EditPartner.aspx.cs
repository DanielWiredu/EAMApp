using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace EAMApp.Registration
{
    public partial class EditPartner : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select * from tblCovenantPartners where Id = @Id";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@Id", SqlDbType.Int).Value = Request.QueryString["EditId"].ToString();
                        
                        try
                        {
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                txtPartnerID.Text = reader["PartnerId"].ToString();
                                dlTitle.SelectedValue = reader["Title"].ToString();
                                txtLastname.Text = reader["Lastname"].ToString();
                                txtFirstname.Text = reader["Firstname"].ToString();
                                txtCity.Text = reader["City"].ToString();
                                txtTelephone1.Text = reader["Telephone1"].ToString();
                                txtTelephone2.Text = reader["Telephone2"].ToString();
                                txtEmail.Text = reader["Email"].ToString();
                                dlProfession.SelectedValue = reader["Profession"].ToString();
                                txtProposedAmount.Text = reader["ProposedAmt"].ToString();
                                dlPayFreq.SelectedValue = reader["PayFreq"].ToString();
                                dlPaymode.SelectedValue = reader["PayMode"].ToString();
                                dlCurrency.SelectedValue = reader["Currency"].ToString();
                                dpRegdate.SelectedDate = Convert.ToDateTime(reader["DateRegistered"]);
                            }
                            else
                            {
                                txtPartnerID.Text = "No Partner Found";
                            }
                            reader.Close();
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                        }

                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spUpdatePartner", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@Title", SqlDbType.VarChar).Value = dlTitle.SelectedText;
                    command.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = txtLastname.Text;
                    command.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = txtFirstname.Text;
                    command.Parameters.Add("@City", SqlDbType.VarChar).Value = txtCity.Text;
                    command.Parameters.Add("@Telephone1", SqlDbType.VarChar).Value = txtTelephone1.Text;
                    command.Parameters.Add("@Telephone2", SqlDbType.VarChar).Value = txtTelephone2.Text;
                    command.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
                    command.Parameters.Add("@Profession", SqlDbType.VarChar).Value = dlProfession.SelectedText;
                    command.Parameters.Add("@ProposedAmt", SqlDbType.Float).Value = txtProposedAmount.Text;
                    command.Parameters.Add("@Payfreq", SqlDbType.VarChar).Value = dlPayFreq.SelectedText;
                    command.Parameters.Add("@PayMode", SqlDbType.VarChar).Value = dlPaymode.SelectedText;
                    command.Parameters.Add("@DateRegistered", SqlDbType.DateTime).Value = dpRegdate.SelectedDate;
                    command.Parameters.Add("@UpdatedBy", SqlDbType.VarChar).Value = User.Identity.Name;
                    command.Parameters.Add("@DateUpdated", SqlDbType.DateTime).Value = DateTime.Now;
                    command.Parameters.Add("@PartnerId", SqlDbType.VarChar).Value = txtPartnerID.Text;
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retVal = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        if (retVal == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "toastr.success('Partner Updated Successfully', 'Success');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }

                }
            }
        }
    }
}