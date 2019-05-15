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
    public partial class NewPartner : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spAddPartner", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@PartnerId", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
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
                    command.Parameters.Add("@Currency", SqlDbType.VarChar).Value = dlCurrency.SelectedText;
                    command.Parameters.Add("@DateRegistered", SqlDbType.DateTime).Value = dpRegdate.SelectedDate;
                    command.Parameters.Add("@DateCreated", SqlDbType.DateTime).Value = DateTime.Now;
                    command.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = User.Identity.Name;
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retVal = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        if (retVal == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "toastr.success('Partner Created Successfully', 'Success');", true);
                            txtPartnerID.Text = command.Parameters["@PartnerId"].Value.ToString();
                            btnSave.Enabled = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "toastr.error('"+ ex.Message.Replace("'", "").Replace("\r\n", "") +"', 'Error');", true);
                    }
                    
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}