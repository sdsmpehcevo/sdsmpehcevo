using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

public partial class News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            news.Visible = true;
            comments.Visible = true;
            lblError.Text = "";
            lblVideo.Text = "";
            lblImages.Text = "";
            if (!checkQuerryString())
                return;
            fillNewsData();
            getNewsVideos();
            getNewsImages();
        }
    }

    protected bool checkQuerryString()
    {
        int number;
        string qs = Request.QueryString["id"].ToString();
        bool result = Int32.TryParse(qs, out number);
        if (!result)
        {
            news.Visible = false;
            comments.Visible = false;
            lblError.Text = "Нема податоци за веста!";
            lblVideo.Text = "";
            lblImages.Text = "";
            return false;
        }
        else
        {
            if (qs == null)
            {
                news.Visible = false;
                comments.Visible = false;
                lblError.Text = "Нема податоци за веста!";
                lblVideo.Text = "";
                lblImages.Text = "";
                return false;
            }
        }
        return true;
    }

    protected void fillNewsData()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.FillNewsData");
        cmd.Parameters.AddWithValue("@news_id", Convert.ToInt32(Request.QueryString["id"].ToString()));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "News");
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

        if (ds.Tables["News"].Rows.Count == 0)
        {
            news.Visible = false;
            comments.Visible = false;
            lblError.Text = "Нема податоци за веста!";
            return;
        }        

        ViewState["title"] = ds.Tables["News"].Rows[0]["title"].ToString();

        imgTitleImage.ImageUrl = ds.Tables["News"].Rows[0]["title_image_url"].ToString();
        lblNewsTitle.Text = ds.Tables["News"].Rows[0]["title"].ToString();
        lblNewsDate.Text = ds.Tables["News"].Rows[0]["date"].ToString();
        lblNewsContent.Text = ds.Tables["News"].Rows[0]["description"].ToString();
    }

    protected void getNewsVideos()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetNewsVideos");
        cmd.Parameters.AddWithValue("@news_id", Convert.ToInt32(Request.QueryString["id"].ToString()));
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
            lblVideo.Text = "";
            return;
        }

        lblVideo.Text = "Поставени видеа за веста...";

        string pattern = @"(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^""&?\/ ]{11})$";

        for (int i = 0; i < ds.Tables["Videos"].Rows.Count; i++)
        {
            string video_url = Regex.Match(ds.Tables["Videos"].Rows[i]["video_url"].ToString(), pattern).Groups[1].Value.ToString();
            VideoTemplate2 vidTmp2 = (VideoTemplate2)LoadControl("~/VideoTemplate2.ascx");
            HtmlControl player = (HtmlControl)vidTmp2.FindControl("player");
            player.Attributes["src"] = "http://www.youtube.com/embed/" + video_url + "?enablejsapi=1";
            newsVideo.Controls.Add(vidTmp2);
        }
    }

    protected void getNewsImages()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetNewsImages");
        cmd.Parameters.AddWithValue("@news_id", Convert.ToInt32(Request.QueryString["id"].ToString()));
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Images");
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

        if (ds.Tables["Images"].Rows.Count == 0)
        {
            lblImages.Text = "";
            return;
        }

        lblImages.Text = "Поставени слики за веста...";

        ImageTemplate imgTmp = (ImageTemplate)LoadControl("~/ImageTemplate.ascx");
        HtmlGenericControl newDiv = (HtmlGenericControl)imgTmp.FindControl("image");

        string title = ViewState["title"].ToString();

        if (ds.Tables["Images"].Rows.Count == 1)
        {
            string imageUrl = ds.Tables["Images"].Rows[0]["image_url"].ToString();
            imageUrl = imageUrl.Remove(0, 2);
            newDiv.InnerHtml += "<div class=\"single\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:200px; height:153px; \" src=\"" + imageUrl + "\" /></a></div>";
        }
        else
        {
            string imageUrl = ds.Tables["Images"].Rows[0]["image_url"].ToString();
            imageUrl = imageUrl.Remove(0, 2);
            newDiv.InnerHtml += "<div class=\"single first\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:200px; height:153px; \" src=\"" + imageUrl + "\" /></a></div>";

            for (int i = 1; i < ds.Tables["Images"].Rows.Count - 1; i++)
            {
                imageUrl = ds.Tables["Images"].Rows[i]["image_url"].ToString();
                imageUrl = imageUrl.Remove(0, 2);
                newDiv.InnerHtml += "<div class=\"single\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:200px; height:153px; \" src=\"" + imageUrl + "\" /></a></div>";
            }

            imageUrl = ds.Tables["Images"].Rows[ds.Tables["Images"].Rows.Count - 1]["image_url"].ToString();
            imageUrl = imageUrl.Remove(0, 2);
            newDiv.InnerHtml += "<div class=\"single last\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:200px; height:153px; \" src=\"" + imageUrl + "\" /></a></div>";
        }

        newsImages.Controls.Add(imgTmp);
    }
}