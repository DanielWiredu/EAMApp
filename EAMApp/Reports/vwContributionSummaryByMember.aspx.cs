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
    public partial class vwContributionSummaryByMember : System.Web.UI.Page
    {
        rptContributionSummaryByMember rpt = new rptContributionSummaryByMember();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContributionSummaryByMemberReport_Load(object sender, EventArgs e)
        {
            string years = Request.QueryString["yy"].ToString();
            string cur = Request.QueryString["cur"].ToString();

            //ParameterValues parameters = new ParameterValues();
            //ParameterDiscreteValue currency = new ParameterDiscreteValue();

            //currency.Value = cur;

            adapter = new SqlDataAdapter("spGetMemberMonthlyPaymentByYear", connection);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand.Parameters.Add("@years", SqlDbType.VarChar).Value = years;
            adapter.SelectCommand.Parameters.Add("@currency", SqlDbType.VarChar).Value = cur;
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "spGetMemberMonthlyPaymentByYear;1");
            rpt.SetDataSource(ds);
            rpt.SetParameterValue("@currency", cur);
            rpt.SetParameterValue("@years", years);

            //var conString = new System.Data.SqlClient.SqlConnectionStringBuilder(connectionString);
            //rpt.SetDatabaseLogon(conString.UserID, conString.Password, conString.DataSource, conString.InitialCatalog);

            //parameters.Add(currency);
            //rpt.DataDefinition.ParameterFields["currency"].ApplyCurrentValues(parameters);

            ContributionSummaryByMemberReport.ReportSource = rpt;
        }
    }
}