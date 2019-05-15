using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EAMApp.Reports
{
    public partial class AggregateReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int year = DateTime.Now.Year;
                for (int i = 2015; i <= year; i++)
                {
                    dlYear.Items.Add(i.ToString());

                    dlYears.Items.Add(i.ToString());
                }
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/vwContributionAggregateGrid.aspx?cur=" + dlCurrency.SelectedValue + "&yy=" + dlYear.SelectedText + "');", true);
        }

        protected void btnRunAggregate_Click(object sender, EventArgs e)
        {
            string years = "";
            foreach (RadComboBoxItem item in dlYears.CheckedItems)
            {
                years += item.Text + ",";
            }
            years = years.TrimEnd(',');

            if (years == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Please select month(s)','Error')", true);
                return;
            }

            if (dlSummaryType.SelectedText == "Aggregrate")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/vwContributionSummaryByYear.aspx?cur=" + dlCurrency1.SelectedValue + "&yy=" + years + "');", true);
            }
            else if (dlSummaryType.SelectedText == "Per Member")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/vwContributionSummaryByMember.aspx?cur=" + dlCurrency1.SelectedValue + "&yy=" + years + "');", true);
            } 
            
        }
    }
}