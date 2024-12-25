using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9.Admin.Views
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string GetActiveClass(string pageName)
        {
            string currentUrl = Request.Url.AbsolutePath;
            return currentUrl.EndsWith(pageName, StringComparison.OrdinalIgnoreCase) ? "active" : string.Empty;
        }
    }
}