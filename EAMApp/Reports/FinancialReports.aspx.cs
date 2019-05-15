using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EAMApp.Reports
{
    public partial class FinancialReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int year = DateTime.Now.Year;
                for (int i = 2015; i <= year; i++)
                {
                    dlYear.Items.Add(i.ToString());
                }
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            //string sdate = dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            //string edate = dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/vwPaymentList.aspx?cur=" + dlCurrency.SelectedValue + "&sd=" + sdate + "&ed=" + edate + "');", true);


            string months = "";
            foreach (RadComboBoxItem item in dlMonth.CheckedItems)
            {
                months += item.Value + ",";
            }
            months = months.TrimEnd(',');

            if (months == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Please select month(s)','Error')", true);
                return;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/vwPaymentList.aspx?cur=" + dlCurrency.SelectedValue + "&mm=" + months + "&yy=" + dlYear.SelectedText + "');", true);
        }
    }
}