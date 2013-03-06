using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillManagementTeam();
            cleanControls();
        }
    }

    protected void fillManagementTeam()
    {
        getPresident();
        getSecretary();
        getIOMembers();
        getNOMembers();
    }

    protected void cleanControls()
    {
        lblError.Text = "";
    }

    protected void getPresident()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetPresident");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "President");
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

        if (ds.Tables["President"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено податоци за претседателот во базата!";
            return;
        }

        try
        {
            string name = "<h2>" + ds.Tables["President"].Rows[0][1].ToString() + " "
                            + ds.Tables["President"].Rows[0][2].ToString() +
                            " </h2>" + "Контакт Email: <a href=\"mailto:" + ds.Tables["President"].Rows[0][3].ToString() +
                            "\">" + ds.Tables["President"].Rows[0][3].ToString() + "</a><br/><br/>";

            string imageUrl = ds.Tables["President"].Rows[0][5].ToString();

            MemberTemplate mb = (MemberTemplate)LoadControl("~/MemberTemplate.ascx");
            Image img = (Image)mb.FindControl("MemberImage");
            Label lbl = (Label)mb.FindControl("LabelInfo");
            lbl.Text = name;
            img.ImageUrl = imageUrl;

            presidentContent.Controls.Add(mb);
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }

    protected void getSecretary()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetSecretary");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Secretary");
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

        if (ds.Tables["Secretary"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено податоци за секретарот во базата!";
            return;
        }

        try
        {
            string name = "<h2>" + ds.Tables["Secretary"].Rows[0][1].ToString() + " "
                            + ds.Tables["Secretary"].Rows[0][2].ToString() +
                            " </h2>" + "Контакт Email: <a href=\"mailto:" + ds.Tables["Secretary"].Rows[0][3].ToString() +
                            "\">" + ds.Tables["Secretary"].Rows[0][3].ToString() + "</a><br/><br/>";

            string imageUrl = ds.Tables["Secretary"].Rows[0][5].ToString();

            MemberTemplate mb = (MemberTemplate)LoadControl("~/MemberTemplate.ascx");
            Image img = (Image)mb.FindControl("MemberImage");
            Label lbl = (Label)mb.FindControl("LabelInfo");
            lbl.Text = name;
            img.ImageUrl = imageUrl;

            secretaryContent.Controls.Add(mb);
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }

    protected void getIOMembers()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetIOMembers");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "IOMembers");
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

        if (ds.Tables["IOMembers"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено податоци за членови на извршен одбор во базата!";
            return;
        }

        string name = "";
        string imageUrl = "";

        try
        {

            for (int i = 0; i < ds.Tables["IOMembers"].Rows.Count; i++)
            {
                name = "<h2>" + ds.Tables["IOMembers"].Rows[i][1].ToString() + " "
                            + ds.Tables["IOMembers"].Rows[i][2].ToString() +
                            " </h2>" + "Контакт Email: <a href=\"mailto:" + ds.Tables["IOMembers"].Rows[0][3].ToString() +
                            "\">" + ds.Tables["IOMembers"].Rows[0][3].ToString() + "</a><br/><br/>";

                imageUrl = ds.Tables["IOMembers"].Rows[i][5].ToString();

                MemberTemplate mb = (MemberTemplate)LoadControl("~/MemberTemplate.ascx");
                Image img = (Image)mb.FindControl("MemberImage");
                Label lbl = (Label)mb.FindControl("LabelInfo");
                lbl.Text = name;
                img.ImageUrl = imageUrl;

                iomembersContent.Controls.Add(mb);
            }
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }

    protected void getNOMembers()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetNOMembers");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "NOMembers");
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

        if (ds.Tables["NOMembers"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено податоци за членови на надзорен одбор во базата!";
            return;
        }

        string name = "";
        string imageUrl = "";

        try
        {

            for (int i = 0; i < ds.Tables["NOMembers"].Rows.Count; i++)
            {
                name = "<h2>" + ds.Tables["NOMembers"].Rows[i][1].ToString() + " "
                            + ds.Tables["NOMembers"].Rows[i][2].ToString() +
                            " </h2>" + "Контакт Email: <a href=\"mailto:" + ds.Tables["NOMembers"].Rows[0][3].ToString() +
                            "\">" + ds.Tables["NOMembers"].Rows[0][3].ToString() + "</a><br/><br/>";
                imageUrl = ds.Tables["NOMembers"].Rows[i][5].ToString();

                MemberTemplate mb = (MemberTemplate)LoadControl("~/MemberTemplate.ascx");
                Image img = (Image)mb.FindControl("MemberImage");
                Label lbl = (Label)mb.FindControl("LabelInfo");
                lbl.Text = name;
                img.ImageUrl = imageUrl;

                nomembersContent.Controls.Add(mb);
            }
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }
}