using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAMApp.Reports
{
    public partial class YearlyColumnChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime nowdate = DateTime.Now;
                int year = nowdate.Year;
                for (int i = 2015; i <= year; i++)
                {
                    dlYearFrom.Items.Add(i.ToString());
                    dlYearTo.Items.Add(i.ToString());
                }

                RadHtmlChart2.ChartTitle.Text = dlCurrency.SelectedValue + " Payment From " + dlYearFrom.SelectedText + " To " + dlYearTo.SelectedText;
            }
        }

        protected void btnRun_Click(object sender, EventArgs e)
        {
            RadHtmlChart2.DataBind();
            RadHtmlChart2.ChartTitle.Text = dlCurrency.SelectedValue + " Payment From " + dlYearFrom.SelectedText + " To " + dlYearTo.SelectedText;
        }
    }
}