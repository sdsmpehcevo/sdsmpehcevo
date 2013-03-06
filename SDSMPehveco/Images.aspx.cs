using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Images : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getAlbums();
        }
    }

    protected void getAlbums()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetAlbums");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Albums");
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

        if (ds.Tables["Albums"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено албуми во базата!";
            return;
        }

        ViewState["dsAlbums"] = ds;
        gvAlbums.DataSource = ds.Tables["Albums"];
        gvAlbums.DataBind();
    }
    protected void gvAlbums_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                AlbumTemplate albTmp = (AlbumTemplate)e.Row.FindControl("albumTmp");
                Label lblTitle = (Label)albTmp.FindControl("lblAlbumTitle");
                HtmlGenericControl newDiv = (HtmlGenericControl)albTmp.FindControl("image");

                lblTitle.Text = "<h3>" + row.Row["album_name"].ToString() + "</h3>Објавен: " + row.Row["date"].ToString();

                string ID = row.Row["album_id"].ToString();

                DataBase db = new DataBase();
                SqlConnection conn = db.Connection();
                SqlCommand cmd = db.GetCommand(conn, "dbo.GetImagesForAlbum");
                cmd.Parameters.AddWithValue("@album_id", ID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                try
                {
                    conn.Open();
                    da.Fill(ds, "AlbumImages");
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

                string title = row.Row["album_name"].ToString();

                if (ds.Tables["AlbumImages"].Rows.Count == 1)
                {
                    string imageUrl = ds.Tables["AlbumImages"].Rows[0]["image_url"].ToString();
                    imageUrl = imageUrl.Remove(0, 2);
                    newDiv.InnerHtml += "<div class=\"single\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:100px; height:75px; \" src=\"" + imageUrl + "\" /></a></div>";
                }
                else
                {
                    string imageUrl = ds.Tables["AlbumImages"].Rows[0]["image_url"].ToString();
                    imageUrl = imageUrl.Remove(0, 2);
                    newDiv.InnerHtml += "<div class=\"single first\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:100px; height:75px; \" src=\"" + imageUrl + "\" /></a></div>";

                    for (int i = 1; i < ds.Tables["AlbumImages"].Rows.Count - 1; i++)
                    {
                        imageUrl = ds.Tables["AlbumImages"].Rows[i]["image_url"].ToString();
                        imageUrl = imageUrl.Remove(0, 2);
                        newDiv.InnerHtml += "<div class=\"single\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:100px; height:75px; \" src=\"" + imageUrl + "\" /></a></div>";
                    }

                    imageUrl = ds.Tables["AlbumImages"].Rows[ds.Tables["AlbumImages"].Rows.Count - 1]["image_url"].ToString();
                    imageUrl = imageUrl.Remove(0, 2);
                    newDiv.InnerHtml += "<div class=\"single last\"><a href=\"" + imageUrl + "\" rel=\"lightbox[roadtrip]\" title=\"" + title + "\" ><img style=\"width:100px; height:75px; \" src=\"" + imageUrl + "\" /></a></div>";
                }
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void gvAlbums_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAlbums.PageIndex = e.NewPageIndex;
        gvAlbums.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["dsAlbums"];
        gvAlbums.DataSource = ds;
        gvAlbums.DataBind();
    }
}