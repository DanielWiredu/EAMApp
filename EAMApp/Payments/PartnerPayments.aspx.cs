using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

namespace EAMApp.Payments
{
    public partial class PartnerPayments : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command;
        SqlDataReader reader;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtPartnerID.Text = Request.QueryString["pId"].ToString();
                hfFirstname.Value = Request.QueryString["fname"].ToString();
                txtFullname.Text = hfFirstname.Value + " " + Request.QueryString["lname"].ToString();
                txtTelephone.Text = Request.QueryString["tel"].ToString();
                hfEmail.Value = Request.QueryString["em"].ToString();

                getTotalPayment();

                int year = DateTime.Now.Year;
                for (int i = 2015; i <= year; i++)
                {
                    dlYear.Items.Add(i.ToString());
                    dlYear1.Items.Add(i.ToString());
                }

                dpPaydate.SelectedDate = DateTime.Now;
                //dpValueDate.SelectedDate = DateTime.Now;
            }
        }

        protected void getTotalPayment()
        {
            try
            {
                double totalamt = 0.0;
                string query = "select isnull(sum(amount),0) as totalpaid from tblPayments where partnerid = '" + txtPartnerID.Text + "'";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    totalamt = Convert.ToDouble(reader["totalpaid"]);
                }
                reader.Close();
                txtTotalAmt.Text = String.Format("{0:N02}", totalamt);
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void paymentGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["payid"] = item["id"].Text;
                try
                {
                    string query = "select * from tblPayments where id = '" + ViewState["payid"].ToString() + "'";
                    command = new SqlCommand(query, connection);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        dpPaydate1.SelectedDate = Convert.ToDateTime(reader["paydate"]);
                        dlMonth1.SelectedValue = reader["paymonth"].ToString();
                        dlYear1.SelectedText = reader["payyear"].ToString();
                        dlCurrency1.SelectedValue = reader["currency"].ToString();
                        txtAmount1.Text = reader["amount"].ToString();
                        dlPaymode1.SelectedText = reader["paymode"].ToString();
                        txtReference1.Text = reader["reference"].ToString();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editModal();", true);
                    }
                    reader.Close();
                }
                catch (SqlException ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                }
                finally
                {
                    connection.Close();
                }

                e.Canceled = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string paymsg = dlMonth.SelectedText + " " + dlYear.SelectedText;
                string query = "insert into tblpayments(partnerid,paydate,paymode,payyear,paymonth,paymsg,currency,amount,reference,createdby) ";
                query += "values(@partnerid,@paydate,@paymode,@payyear,@paymonth,@paymsg,@currency,@amount,@reference,@createdby)";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                command.Parameters.Add("@partnerid", SqlDbType.VarChar).Value = txtPartnerID.Text;
                command.Parameters.Add("@paydate", SqlDbType.DateTime).Value = dpPaydate.SelectedDate;
                command.Parameters.Add("@paymode", SqlDbType.VarChar).Value = dlPaymode.SelectedValue;
                command.Parameters.Add("@payyear", SqlDbType.Int).Value = dlYear.SelectedText;
                command.Parameters.Add("@paymonth", SqlDbType.Int).Value = dlMonth.SelectedValue;
                command.Parameters.Add("@paymsg", SqlDbType.VarChar).Value = paymsg;
                command.Parameters.Add("@currency", SqlDbType.VarChar).Value = dlCurrency.SelectedValue;
                command.Parameters.Add("@amount", SqlDbType.Float).Value = txtAmount.Text;
                command.Parameters.Add("@reference", SqlDbType.VarChar).Value = txtReference.Text;
                command.Parameters.Add("@createdby", SqlDbType.VarChar).Value = Context.User.Identity.Name;
                rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Payment Saved Successfully', 'Success');", true);
                    sendEmail(paymsg, String.Format("{0:N02}", txtAmount.Value), dlCurrency.SelectedValue);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                    paymentGrid.Rebind();
                    txtAmount.Text = "0.0";
                    txtReference.Text = "";
                    getTotalPayment();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string paymsg = dlMonth1.SelectedText + " " + dlYear1.SelectedText;
                string query = "update tblPayments set paydate=@paydate,paymode=@paymode,payyear=@payyear,paymonth=@paymonth,paymsg=@paymsg,currency=@currency,amount=@amount,";
                query += "reference=@reference,updateddate=@updateddate,updatedby=@updatedby where id = '" + ViewState["payid"].ToString() + "'";
                command = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                command.Parameters.Add("@paydate", SqlDbType.DateTime).Value = dpPaydate1.SelectedDate;
                command.Parameters.Add("@paymode", SqlDbType.VarChar).Value = dlPaymode1.SelectedValue;
                command.Parameters.Add("@payyear", SqlDbType.Int).Value = dlYear1.SelectedText;
                command.Parameters.Add("@paymonth", SqlDbType.Int).Value = dlMonth1.SelectedValue;
                command.Parameters.Add("@paymsg", SqlDbType.VarChar).Value = paymsg;
                command.Parameters.Add("@currency", SqlDbType.VarChar).Value = dlCurrency1.SelectedValue;
                command.Parameters.Add("@amount", SqlDbType.Float).Value = txtAmount1.Text;
                command.Parameters.Add("@reference", SqlDbType.VarChar).Value = txtReference1.Text;
                command.Parameters.Add("@updateddate", SqlDbType.DateTime).Value = DateTime.UtcNow;
                command.Parameters.Add("@updatedby", SqlDbType.VarChar).Value = Context.User.Identity.Name;
                rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Payment Updated Successfully', 'Success');", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditModal();", true);
                    paymentGrid.Rebind();
                    getTotalPayment();
                }
                command.Dispose();
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void paymentGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
                getTotalPayment();
            }
        }
        protected void sendEmail(string period, string amount, string currency)
        {
            try
            {
                string mailSubject = "ACKNOWLEDGEMENT OF CONTRIBUTION";
                string message = "Dear " + hfFirstname.Value + ", <br><br>";
                message += "Greetings in the name of Jesus our soon-coming King. <br><br> ";
                message += "I write on behalf of EAM, a Christian organisation committed to working towards achieving ";
                message += "the cause of repositioning the body of Christ for the return of our Lord Jesus Christ. <br><br>";
                message += "We acknowledge receipt of your Contribution of " + currency + " " + amount + " to Eastwood Anaba Ministries as contribution for the month of " + period + "<br><br>";
                message += "We express our appreciation for your contribution and may you be anointed by the Spirit of the Lord God to fulfill your PURPOSE on earth! <br><br>";
                message += "May the fulfilment of the vision of the ministry through your giving bring you total satisfaction. <br><br>";
                message += "Yours for the LOVE REVOLUTION, <br> <br>";
                message += "Dinah Bondzie (Mrs) <br> Finance Lead <br> 0208215660 <br><br>";
                message += "<b>Please do not reply to this email.<b>";
                MailMessage myMessage = new MailMessage();
                myMessage.From = (new MailAddress("admin@eampartners.net", "EAM Admin"));
                myMessage.To.Add(new MailAddress(hfEmail.Value));
                myMessage.Subject = mailSubject;
                myMessage.Body = message;
                myMessage.IsBodyHtml = true;
                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mailsuccess", "toastr.success('Email Sent Successfully', 'Success');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mailerror", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
        }
    }
}