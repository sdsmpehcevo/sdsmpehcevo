using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

public partial class Video : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cleanControls();
            loadVideos();            
        }
    }

    protected void cleanControls()
    {
        lblError.Text = "";
    }

    protected void loadVideos()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetVideos");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Videos");
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

        if (ds.Tables["Videos"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено видеа во базата!";
            return;
        }

        ViewState["dsVideos"] = ds;
        gvVideos.DataSource = ds.Tables["Videos"];
        gvVideos.DataBind();

    }
    protected void gvVideos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                string pattern = @"(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^""&?\/ ]{11})$";


                VideoTemplate vidTmp = (VideoTemplate)e.Row.FindControl("vidTmp");
                DataRowView row = (DataRowView)e.Row.DataItem;

                string video_url = Regex.Match(row.Row["video_url"].ToString(), pattern).Groups[1].Value.ToString();

                Label lblTitle = (Label)vidTmp.FindControl("LabelTitle");
                HtmlControl player = (HtmlControl)vidTmp.FindControl("player");
                player.Attributes["src"] = "http://www.youtube.com/embed/" + video_url + "?enablejsapi=1";

                lblTitle.Text = row.Row["title"].ToString() + "<br/><h3>Објавенo: " + row.Row["date"].ToString() + "</h3>";
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void gvVideos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVideos.PageIndex = e.NewPageIndex;
        gvVideos.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["dsVideos"];
        gvVideos.DataSource = ds;
        gvVideos.DataBind();
    }
}