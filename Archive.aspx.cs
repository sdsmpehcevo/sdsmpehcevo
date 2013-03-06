using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Archive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cleanControls();
            fillNewsGrid();            
        }
    }

    protected void fillNewsGrid()
    {
        DataSet ds = new DataSet();

        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.GetNewsArchive");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
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
            lblError.Text = "Нема внесено актуелности во базата на податоци!";
            return;
        }

        ViewState["dsNews"] = ds;
        gvNews.DataSource = ds.Tables["News"];
        gvNews.DataBind();
        cleanControls();
    }

    protected void gvNews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {

                NewsTemplate nTmp = (NewsTemplate)e.Row.FindControl("newsTmp");
                DataRowView row = (DataRowView)e.Row.DataItem;
                Label lblDate = (Label)nTmp.FindControl("lblDate");
                LinkButton lnkTitle = (LinkButton)nTmp.FindControl("lnkTitle");
                Label lblDescription = (Label)nTmp.FindControl("lblDescription");
                ImageButton imgImage = (ImageButton)nTmp.FindControl("imgImage");
                LinkButton lnkMore = (LinkButton)nTmp.FindControl("lnkMore");

                imgImage.ImageUrl = row.Row["title_image_url"].ToString();
                imgImage.PostBackUrl = "News.aspx?id=" + row.Row["news_id"].ToString();
                lblDate.Text = row.Row["date"].ToString();
                lnkTitle.Text = row.Row["title"].ToString();
                lnkTitle.PostBackUrl = "News.aspx?id=" + row.Row["news_id"].ToString();

                int strLength = 0;
                if (row.Row["description"].ToString().Length <= 120)
                {
                    strLength = row.Row["description"].ToString().Length;
                }
                else
                {
                    strLength = 120;
                }

                lblDescription.Text = row.Row["description"].ToString().Substring(0, strLength) + "... ";
                lnkMore.PostBackUrl = "News.aspx?id=" + row.Row["news_id"].ToString();

                imgImage.ToolTip = lnkTitle.Text;
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void gvNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNews.PageIndex = e.NewPageIndex;
        gvNews.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["dsNews"];
        gvNews.DataSource = ds;
        gvNews.DataBind();
    }

    protected void cleanControls()
    {
        lblError.Text = "";
    }
}