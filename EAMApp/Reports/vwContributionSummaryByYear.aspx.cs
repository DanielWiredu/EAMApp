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
    public partial class vwContributionSummaryByYear : System.Web.UI.Page
    {
        rptContributionSummaryByYear rpt = new rptContributionSummaryByYear();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContributionSummaryByYearReport_Load(object sender, EventArgs e)
        {
            string years = Request.QueryString["yy"].ToString();
            string cur = Request.QueryString["cur"].ToString();

            //ParameterValues parameters = new ParameterValues();
            //ParameterDiscreteValue currency = new ParameterDiscreteValue();

            //currency.Value = cur;

            adapter = new SqlDataAdapter("spGetMonthlyPaymentByYear", connection);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand.Parameters.Add("@years", SqlDbType.VarChar).Value = years;
            adapter.SelectCommand.Parameters.Add("@currency", SqlDbType.VarChar).Value = cur;
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "spGetMonthlyPaymentByYear;1");
            rpt.SetDataSource(ds);
            rpt.SetParameterValue("@currency", cur);
            rpt.SetParameterValue("@years", years);

            //parameters.Add(currency);
            //rpt.DataDefinition.ParameterFields["currency"].ApplyCurrentValues(parameters);

            ContributionSummaryByYearReport.ReportSource = rpt;
        }
    }
}