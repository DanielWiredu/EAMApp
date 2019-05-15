﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAMApp.Reports
{
    public partial class MonthlyColumChartPerYear : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime nowdate = DateTime.Now;
                int year = nowdate.Year;
                for (int i = 2015; i <= year; i++)
                {
                    dlYear.Items.Add(i.ToString());
                }

                dlYear.SelectedText = "2019";
                dlYear.Enabled = false;

                RadHtmlChart2.ChartTitle.Text = dlCurrency.SelectedValue + " Contribution Comparison";
            }
        }
        protected void btnRun_Click(object sender, EventArgs e)
        {
            RadHtmlChart2.DataBind();
            RadHtmlChart2.ChartTitle.Text = dlCurrency.SelectedValue + " Contribution Comparison";
        }
    }
}