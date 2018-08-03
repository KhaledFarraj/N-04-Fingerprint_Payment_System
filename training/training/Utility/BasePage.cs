using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace training.Utility
{
    public class BasePage : Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["test1"] == null)
            {
                Response.Redirect("~/Default.aspx", false);
            }
        }
    }
}