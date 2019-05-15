using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.Shared;

namespace EAMApp.Reports
{
    public partial class vwPaymentList : System.Web.UI.Page
    {
        rptPaymentList rpt = new rptPaymentList();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PaymentListReport_Load(object sender, EventArgs e)
        {
            string mm = Request.QueryString["mm"].ToString();
            string year = Request.QueryString["yy"].ToString();
            string cur = Request.QueryString["cur"].ToString();

            ParameterValues parameters = new ParameterValues();
            ParameterDiscreteValue currency = new ParameterDiscreteValue();

            currency.Value = cur;

            //adapter = new SqlDataAdapter("select PartnerID,PartnerName,PayFreq,PayDate,Payyear,Paymonth,PayMode,Amount,Reference from vwPayments where currency = '" + cur + "' and (paydate between '" + sdate + "' and '" + edate + "')", connection);
            adapter = new SqlDataAdapter("spGetPaymentByMonth", connection);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand.Parameters.Add("@months", SqlDbType.VarChar).Value = mm;
            adapter.SelectCommand.Parameters.Add("@year", SqlDbType.VarChar).Value = year;
            adapter.SelectCommand.Parameters.Add("@currency", SqlDbType.VarChar).Value = cur;
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "vwPayments");
            rpt.SetDataSource(ds);

            parameters.Add(currency);
            rpt.DataDefinition.ParameterFields["currency"].ApplyCurrentValues(parameters);

            PaymentListReport.ReportSource = rpt;
        }
    }
}