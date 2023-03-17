using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace DataBound
{
    public partial class SeachProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //need to get connectionstring path from web.config file and
            // open the connection to db

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            //write sql Statement
            string strSelect = "Select SUM((UnitPrice * Quantity) * (1 - Discount))" +
                " as [Total Price] from [Order Details]" +
                " INNER JOIN Orders" +
                " ON Orders.OrderId = [Order Details].OrderId" +
                " where Orders.EmployeeID = @empID" +
                " AND" +
                " YEAR(Orders.OrderDate) = @Yr";



            //need sqlcommand to execute sql query
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@empID", ddlName.SelectedValue.ToString());
            cmdSelect.Parameters.AddWithValue("@Yr", ddlYear.SelectedItem.ToString());
            double tPrice = (double)cmdSelect.ExecuteScalar();



            lblTitleGridView.Text = "Sales Order by " + ddlName.SelectedItem + " in the year of " + ddlYear.SelectedValue + ". Grand Total Sales = " + tPrice.ToString("C2");

            con.Close();


            GridView1.AutoGenerateColumns = true;
            GridView1.AutoGenerateSelectButton = true;

            //in design gridview1.datasource must be = none
            GridView1.DataSource = SqlDataSource3;
            GridView1.DataBind();

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = SqlDataSource3;

            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}