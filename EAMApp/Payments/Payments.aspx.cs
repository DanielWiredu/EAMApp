using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EAMApp.Payments
{
    public partial class Payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void partnersGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                GridDataItem item = e.Item as GridDataItem;
                Response.Redirect("/Payments/PartnerPayments.aspx?pId=" + item["PartnerId"].Text + "&fname=" + item["Firstname"].Text + "&lname=" + item["Lastname"].Text + "&tel=" + item["Telephone1"].Text + "&em=" + item["Email"].Text);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            partnersGrid.Rebind();
        }
    }
}