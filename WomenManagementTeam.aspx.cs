using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class WomenManagementTeam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillManagementTeam();
            cleanControls();
        }
    }

    protected void cleanControls()
    {
        lblError.Text = "";
    }

    protected void fillManagementTeam()
    {
        getCoordinator();
    }

    protected void getCoordinator()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetCoordinatorZ");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Coordinator");
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        if (ds.Tables["Coordinator"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено податоци за координаторот во базата!";
            return;
        }

        try
        {
            string name = "<h2>" + ds.Tables["Coordinator"].Rows[0][1].ToString() + " "
                            + ds.Tables["Coordinator"].Rows[0][2].ToString() +
                            " </h2>" + "Контакт Email: <a href=\"mailto:" + ds.Tables["Coordinator"].Rows[0][3].ToString() +
                            "\">" + ds.Tables["Coordinator"].Rows[0][3].ToString() + "</a><br/><br/>";

            string imageUrl = ds.Tables["Coordinator"].Rows[0][5].ToString();

            MemberTemplate mb = (MemberTemplate)LoadControl("~/MemberTemplate.ascx");
            Image img = (Image)mb.FindControl("MemberImage");
            Label lbl = (Label)mb.FindControl("LabelInfo");
            lbl.Text = name;
            img.ImageUrl = imageUrl;

            coordinatorContent.Controls.Add(mb);
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }
}