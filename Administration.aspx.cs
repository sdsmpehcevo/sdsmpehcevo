using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text.RegularExpressions;

public partial class Administration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("~/AdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            string tempDirectory = Server.MapPath("~/Images/Temp");
            //DeleteDirectoryIfExist(tempDirectory);
            CreateDirectoryIfNotExist(tempDirectory);
            cleanControls();
            fillUpdateGrid();
            fillUpdateVideoGrid();
            fillDeleteNewsGrid();
            fillDeleteAlbumGrid();
        }

    }
    protected void btnAddMember_Click(object sender, EventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.InsertMember");
        cmd.Parameters.AddWithValue("@name", txtName.Text);
        cmd.Parameters.AddWithValue("@surname", txtSurname.Text);
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@role", ddlRole.SelectedValue);

        string imageUrl = "";
        if (fuImage.HasFile)
        {
            imageUrl = Path.GetFileName(fuImage.PostedFile.FileName);
            string fileExtension = Path.GetExtension(fuImage.PostedFile.FileName.ToString());
            string pattern = @"^(.jpg|.JPG|.jpeg|.JPEG|.png|.PNG|.gif|.GIF)$";
            Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
            MatchCollection matches = rgx.Matches(fileExtension);
            if (matches.Count > 0)
            {
                try
                {
                    fuImage.SaveAs(Server.MapPath("~/Images/Members/" + imageUrl));
                    cmd.Parameters.AddWithValue("@image_url", "~/Images/Members/" + imageUrl);
                }
                catch (Exception ex)
                {
                    lblError.Text = "Настана грешка при зачувувањето на сликата.";
                    return;
                }
            }
            else
            {
                lblError.Text = "Неправилен формат на слика. Дозволени се: .jpg .JPG .jpeg .JPEG .png .PNG .gif .GIF.";
                return;
            }
        }
        else
        {
            cmd.Parameters.AddWithValue("@image_url", "~/Images/logo.jpg");
        }

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
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
        cleanControls();
        fillUpdateGrid();
    }
    protected void fillUpdateGrid()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.FillUpdateGrid");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Members");
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

        if (ds.Tables["Members"].Rows.Count == 0)
        {
            lblError.Text = "Нема внесено членови на раководство во базата!";
            gvUpdate.DataSource = ds.Tables["Members"];
            gvUpdate.DataBind();
            return;
        }

        ViewState["ds"] = ds;
        gvUpdate.DataSource = ds.Tables["Members"];
        gvUpdate.DataBind();
    }

    protected void cleanControls()
    {
        lblError.Text = "";
        txtName.Text = "";
        txtSurname.Text = "";
        txtEmail.Text = "";
        ddlRole.SelectedIndex = 0;
        txtVideoTitle.Text = "";
        txtVideoUrl.Text = "";
        txtNewsVideo.Text = "";
        txtNewsTitle.Text = "";
        txtNewsDescription.Text = "";
    }
    protected void gvUpdate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUpdate.PageIndex = e.NewPageIndex;
        gvUpdate.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["ds"];
        gvUpdate.DataSource = ds;
        gvUpdate.DataBind();
    }
    protected void gvUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["ds"];

        Label lblImagUrl = (Label)gvUpdate.Rows[e.NewEditIndex].FindControl("lblImagUrl");
        string oldImageUrl = lblImagUrl.Text;

        Session["oldImageUrl"] = oldImageUrl;

        gvUpdate.EditIndex = e.NewEditIndex;
        gvUpdate.DataSource = ds;
        gvUpdate.DataBind();
    }
    protected void gvUpdate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["ds"];
        gvUpdate.EditIndex = -1;
        gvUpdate.DataSource = ds;
        gvUpdate.DataBind();
    }
    protected void gvUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.UpdateMember");

        int ID = Convert.ToInt32(gvUpdate.DataKeys[e.RowIndex].Values[0].ToString());
        cmd.Parameters.AddWithValue("@member_id", ID);

        TextBox tb = (TextBox)gvUpdate.Rows[e.RowIndex].FindControl("txtName");
        cmd.Parameters.AddWithValue("@name", tb.Text);

        tb = (TextBox)gvUpdate.Rows[e.RowIndex].FindControl("txtSurname");
        cmd.Parameters.AddWithValue("@surname", tb.Text);

        tb = (TextBox)gvUpdate.Rows[e.RowIndex].FindControl("txtEmail");
        cmd.Parameters.AddWithValue("@email", tb.Text);

        DropDownList cdmRole = (DropDownList)gvUpdate.Rows[e.RowIndex].FindControl("cmbRole");
        cmd.Parameters.AddWithValue("@role", cdmRole.SelectedItem.Text);

        FileUpload fuImage = (FileUpload)gvUpdate.Rows[e.RowIndex].FindControl("fupImage");

        string imageUrl = "";
        if (fuImage.HasFile)
        {
            imageUrl = Path.GetFileName(fuImage.PostedFile.FileName);
            string fileExtension = Path.GetExtension(fuImage.PostedFile.FileName.ToString());
            string pattern = @"^(.jpg|.JPG|.jpeg|.JPEG|.png|.PNG|.gif|.GIF)$";
            Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
            MatchCollection matches = rgx.Matches(fileExtension);
            if (matches.Count > 0)
            {
                try
                {
                    string oldImage = Session["oldImageUrl"].ToString();
                    if (File.Exists(Server.MapPath("~/Images/Members/" + oldImage)))
                        File.Delete(Server.MapPath("~/Images/Members/" + oldImage));

                    fuImage.SaveAs(Server.MapPath("~/Images/Members/" + imageUrl));
                    cmd.Parameters.AddWithValue("@image_url", "~/Images/Members/" + imageUrl);

                }
                catch (Exception ex)
                {
                    lblError.Text = "Настана грешка при зачувувањето на сликата.";
                    return;
                }
            }
            else
            {
                lblError.Text = "Неправилен формат на слика. Дозволени се: .jpg .JPG .jpeg .JPEG .png .PNG .gif .GIF.";
                return;
            }
        }
        else
        {
            cmd.Parameters.AddWithValue("@image_url", DBNull.Value);
        }

        int numChanges = 0;
        try
        {
            conn.Open();
            numChanges = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
        finally
        {
            gvUpdate.EditIndex = -1;
            conn.Close();
            conn.Dispose();
        }
        if (numChanges != 0)
        {
            cleanControls();
            fillUpdateGrid();
        }
    }

    protected void gvUpdate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.DeleteMember");

        int ID = Convert.ToInt32(gvUpdate.DataKeys[e.RowIndex].Values[0].ToString());
        cmd.Parameters.AddWithValue("@member_id", ID);

        int numChanges = 0;
        try
        {
            conn.Open();
            numChanges = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
        finally
        {
            gvUpdate.EditIndex = -1;
            conn.Close();
            conn.Dispose();
        }
        if (numChanges != 0)
        {
            cleanControls();
            fillUpdateGrid();
        }
    }
    protected void gvUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton l = (LinkButton)e.Row.FindControl("lbtnDelete");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Дали сте сигурни дека сакате да го избришете членот " +
                DataBinder.Eval(e.Row.DataItem, "name") + " " + DataBinder.Eval(e.Row.DataItem, "surname") + "?" + "')");
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/AdminLogin.aspx");
    }

    protected void fillUpdateVideoGrid()
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
            gvUpdateVideo.DataSource = ds.Tables["Videos"];
            gvUpdateVideo.DataBind();
            return;
        }

        ViewState["dsVideos"] = ds;
        gvUpdateVideo.DataSource = ds.Tables["Videos"];
        gvUpdateVideo.DataBind();
    }
    protected void btnAddVideo_Click(object sender, EventArgs e)
    {
        string pattern = @"(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^""&?\/ ]{11})$";
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
        MatchCollection matches = rgx.Matches(txtVideoUrl.Text);
        if (matches.Count > 0)
        {
            DataBase db = new DataBase();
            SqlConnection conn = db.Connection();
            SqlCommand cmd = db.GetCommand(conn, "dbo.InsertVideo");
            cmd.Parameters.AddWithValue("@title", txtVideoTitle.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@video_url", txtVideoUrl.Text);

            int numChanges = 0;
            try
            {
                conn.Open();
                numChanges = cmd.ExecuteNonQuery();
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
            if (numChanges != 0)
            {
                cleanControls();
                fillUpdateVideoGrid();
            }
        }
        else
        {
            lblError.Text = "Невалиден линк за видео!";
        }
    }
    protected void gvUpdateVideo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton l = (LinkButton)e.Row.FindControl("lbtnDelete");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Дали сте сигурни дека сакате да го избришете видеото " +
                DataBinder.Eval(e.Row.DataItem, "title") + "?" + "')");
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void gvUpdateVideo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.DeleteVideo");

        int ID = Convert.ToInt32(gvUpdateVideo.DataKeys[e.RowIndex].Values[0].ToString());
        cmd.Parameters.AddWithValue("@video_id", ID);

        int numChanges = 0;
        try
        {
            conn.Open();
            numChanges = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
        finally
        {
            gvUpdateVideo.EditIndex = -1;
            conn.Close();
            conn.Dispose();
        }
        if (numChanges != 0)
        {
            cleanControls();
            fillUpdateVideoGrid();
        }
    }
    protected void gvUpdateVideo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dsVideos"];
        gvUpdateVideo.EditIndex = e.NewEditIndex;
        gvUpdateVideo.DataSource = ds;
        gvUpdateVideo.DataBind();
    }
    protected void gvUpdateVideo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["dsVideos"];
        gvUpdateVideo.EditIndex = -1;
        gvUpdateVideo.DataSource = ds;
        gvUpdateVideo.DataBind();
    }
    protected void gvUpdateVideo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string pattern = @"(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^""&?\/ ]{11})$";
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
        TextBox tb = (TextBox)gvUpdateVideo.Rows[e.RowIndex].Cells[2].Controls[0];
        MatchCollection matches = rgx.Matches(tb.Text);
        if (matches.Count > 0)
        {
            DataBase db = new DataBase();
            SqlConnection conn = db.Connection();
            SqlCommand cmd = db.GetCommand(conn, "dbo.UpdateVideo");

            tb = (TextBox)gvUpdateVideo.Rows[e.RowIndex].Cells[1].Controls[0];
            cmd.Parameters.AddWithValue("@title", tb.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);

            int ID = Convert.ToInt32(gvUpdateVideo.DataKeys[e.RowIndex].Values[0].ToString());
            cmd.Parameters.AddWithValue("@video_id", ID);

            tb = (TextBox)gvUpdateVideo.Rows[e.RowIndex].Cells[2].Controls[0];
            cmd.Parameters.AddWithValue("@video_url", tb.Text);

            int numChanges = 0;
            try
            {
                conn.Open();
                numChanges = cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                gvUpdateVideo.EditIndex = -1;
            }
            if (numChanges != 0)
            {
                cleanControls();
                fillUpdateVideoGrid();
            }
        }
        else
        {
            lblError.Text = "Невалиден линк за видео!";
            return;
        }
    }
    protected void btnAddNewsVideo_Click(object sender, EventArgs e)
    {
        string pattern = @"(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^""&?\/ ]{11})$";
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
        MatchCollection matches = rgx.Matches(txtNewsVideo.Text);
        if (matches.Count > 0)
        {
            lbxNewsVideos.Items.Add(txtNewsVideo.Text);
            txtNewsVideo.Text = "";
            lblError.Text = "";
        }
        else
        {
            lblError.Text = "Невалиден линк за видео!";
        }
    }
    protected void btnAddNewsImage_Click(object sender, EventArgs e)
    {
        string imageUrl = "";
        if (fuNewsImage.HasFile)
        {
            imageUrl = Path.GetFileName(fuNewsImage.PostedFile.FileName);
            string fileExtension = Path.GetExtension(fuNewsImage.PostedFile.FileName.ToString());
            string pattern = @"^(.jpg|.JPG|.jpeg|.JPEG|.png|.PNG|.gif|.GIF)$";
            Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
            MatchCollection matches = rgx.Matches(fileExtension);
            if (matches.Count > 0)
            {
                lbxNewsImages.Items.Add(imageUrl);
                fuNewsImage.SaveAs(Server.MapPath("~/Images/Temp/" + imageUrl));
                lblError.Text = "";
            }
            else
            {
                lblError.Text = "Неправилен формат на слика. Дозволени се: .jpg .JPG .jpeg .JPEG .png .PNG .gif .GIF.";
            }
        }
        else
        {
            lblError.Text = "Изберете слика!";
        }
    }
    protected void btnRemoveNewsImage_Click(object sender, EventArgs e)
    {
        if (lbxNewsImages.SelectedIndex == -1)
        {
            lblError.Text = "Изберете слика за отстранување!";
            return;
        }
        int index = lbxNewsImages.SelectedIndex;

        if (File.Exists(Server.MapPath("~/Images/Temp/" + lbxNewsImages.Items[index].ToString())))
            File.Delete(Server.MapPath("~/Images/Temp/" + lbxNewsImages.Items[index].ToString()));

        lbxNewsImages.Items.RemoveAt(index);
        lblError.Text = "";
    }
    protected void btnRemoveNewsVideo_Click(object sender, EventArgs e)
    {
        if (lbxNewsVideos.SelectedIndex == -1)
        {
            lblError.Text = "Изберете видео за отстранување!";
            return;
        }
        int index = lbxNewsVideos.SelectedIndex;
        lbxNewsVideos.Items.RemoveAt(index);
        lblError.Text = "";
    }

    protected void CreateDirectoryIfNotExist(string NewDirectory)
    {
        try
        {
            if (!Directory.Exists(NewDirectory))
            {
                Directory.CreateDirectory(NewDirectory);
            }
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }
    protected void DeleteDirectoryIfExist(string DeleteDirectory)
    {
        try
        {
            DirectoryInfo dir = new DirectoryInfo(DeleteDirectory);
            foreach (FileInfo file in dir.GetFiles())
            {
                file.Delete();
            }
            Directory.Delete(DeleteDirectory);
            string tempDirectory = Server.MapPath("~/Images/Temp");            
            CreateDirectoryIfNotExist(tempDirectory);
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
    }
    protected void btnAddNews_Click(object sender, EventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.InsertNews");

        cmd.Parameters.AddWithValue("@title", txtNewsTitle.Text);
        cmd.Parameters.AddWithValue("@description", txtNewsDescription.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@title_image_url", "~/Images/logo.jpg");

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "ID");
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

        if (ds.Tables["ID"].Rows.Count == 0)
        {
            lblError.Text = "Грешка при зачувувањето на сликите!";
            return;
        }

        string newsDirectory = Server.MapPath("~/Images/News/" + ds.Tables["ID"].Rows[0]["ID"].ToString() + "/");
        CreateDirectoryIfNotExist(newsDirectory);

        if (lbxNewsImages.Items.Count > 0)
        {
            conn = db.Connection();
            cmd = db.GetCommand(conn, "dbo.UpdateTitleImage");

            cmd.Parameters.AddWithValue("@news_id", ds.Tables["ID"].Rows[0]["ID"].ToString());
            cmd.Parameters.AddWithValue("@title_image_url", "~/Images/News/" + ds.Tables["ID"].Rows[0]["ID"].ToString() + "/" + lbxNewsImages.Items[0].ToString());

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
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

            string sourceFile = Server.MapPath("~/Images/Temp/" + lbxNewsImages.Items[0].ToString());
            string destinationFile = Server.MapPath("~/Images/News/" + ds.Tables["ID"].Rows[0]["ID"].ToString() + "/" + lbxNewsImages.Items[0].ToString());

            File.Move(sourceFile, destinationFile);

            if (lbxNewsImages.Items.Count > 1)
            {
                for (int i = 1; i < lbxNewsImages.Items.Count; i++)
                {
                    conn = db.Connection();
                    cmd = db.GetCommand(conn, "dbo.InsertNewsImage");

                    cmd.Parameters.AddWithValue("@news_id", ds.Tables["ID"].Rows[0]["ID"].ToString());
                    cmd.Parameters.AddWithValue("@image_url", "~/Images/News/" + ds.Tables["ID"].Rows[0]["ID"].ToString() + "/" + lbxNewsImages.Items[i].ToString());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
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

                    sourceFile = Server.MapPath("~/Images/Temp/" + lbxNewsImages.Items[i].ToString());
                    destinationFile = Server.MapPath("~/Images/News/" + ds.Tables["ID"].Rows[0]["ID"].ToString() + "/" + lbxNewsImages.Items[i].ToString());

                    File.Move(sourceFile, destinationFile);
                }

            }
        }

        if (lbxNewsVideos.Items.Count > 0)
        {
            for (int i = 0; i < lbxNewsVideos.Items.Count; i++)
            {
                conn = db.Connection();
                cmd = db.GetCommand(conn, "dbo.InsertNewsVideo");

                string video_url = lbxNewsVideos.Items[i].ToString();

                cmd.Parameters.AddWithValue("@news_id", ds.Tables["ID"].Rows[0]["ID"].ToString());
                cmd.Parameters.AddWithValue("@video_url", video_url);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
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
            }
        }

        string tempDirectory = Server.MapPath("~/Images/Temp/");
        DeleteDirectoryIfExist(tempDirectory);

        txtNewsVideo.Text = "";
        txtNewsTitle.Text = "";
        txtNewsDescription.Text = "";
        lblError.Text = "";

        int imagesCount = lbxNewsImages.Items.Count;
        for (int i = 0; i < imagesCount; i++)
        {
            lbxNewsImages.Items.RemoveAt(0);
        }
        int videosCount = lbxNewsVideos.Items.Count;
        for (int i = 0; i < videosCount; i++)
        {
            lbxNewsVideos.Items.RemoveAt(0);
        }

        fillDeleteNewsGrid();
    }

    protected void fillDeleteNewsGrid()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.FillDeleteNewsGrid");

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
            lblError.Text = "Нема внесено вести во базата!";
            gvDeleteNews.DataSource = ds.Tables["News"];
            gvDeleteNews.DataBind();
            return;
        }

        ViewState["dsDeleteNews"] = ds;
        gvDeleteNews.DataSource = ds.Tables["News"];
        gvDeleteNews.DataBind();
    }
    protected void gvDeleteNews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton l = (LinkButton)e.Row.FindControl("lbtnDeleteNews");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Дали сте сигурни дека сакате да ја избришете веста " +
                DataBinder.Eval(e.Row.DataItem, "title") + "?" + "')");
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void gvDeleteNews_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.DeleteNews");

        int ID = Convert.ToInt32(gvDeleteNews.DataKeys[e.RowIndex].Values[0].ToString());
        cmd.Parameters.AddWithValue("@news_id", ID);

        int numChanges = 0;
        try
        {
            conn.Open();
            numChanges = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
        finally
        {
            gvDeleteNews.EditIndex = -1;
            conn.Close();
            conn.Dispose();
        }
        if (numChanges != 0)
        {
            cleanControls();
            fillDeleteNewsGrid();
        }
        string directory = Server.MapPath("~/Images/News/" + ID.ToString());
        DeleteDirectoryIfExist(directory);
    }
    protected void gvDeleteNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDeleteNews.PageIndex = e.NewPageIndex;
        gvDeleteNews.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["dsDeleteNews"];
        gvDeleteNews.DataSource = ds;
        gvDeleteNews.DataBind();
    }
    protected void btnAddAlbumImage_Click(object sender, EventArgs e)
    {
        string imageUrl = "";
        if (fuAlbumImage.HasFile)
        {
            imageUrl = Path.GetFileName(fuAlbumImage.PostedFile.FileName);
            string fileExtension = Path.GetExtension(fuAlbumImage.PostedFile.FileName.ToString());
            string pattern = @"^(.jpg|.JPG|.jpeg|.JPEG|.png|.PNG|.gif|.GIF)$";
            Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
            MatchCollection matches = rgx.Matches(fileExtension);
            if (matches.Count > 0)
            {
                lbxAlbumImages.Items.Add(imageUrl);
                fuAlbumImage.SaveAs(Server.MapPath("~/Images/Temp/" + imageUrl));
                lblError.Text = "";
            }
            else
            {
                lblError.Text = "Неправилен формат на слика. Дозволени се: .jpg .JPG .jpeg .JPEG .png .PNG .gif .GIF.";
            }
        }
        else
        {
            lblError.Text = "Изберете слика!";
        }
    }
    protected void btnRemoveAlbumImage_Click(object sender, EventArgs e)
    {
        if (lbxAlbumImages.SelectedIndex == -1)
        {
            lblError.Text = "Изберете слика за отстранување!";
            return;
        }
        int index = lbxAlbumImages.SelectedIndex;

        if (File.Exists(Server.MapPath("~/Images/Temp/" + lbxAlbumImages.Items[index].ToString())))
            File.Delete(Server.MapPath("~/Images/Temp/" + lbxAlbumImages.Items[index].ToString()));

        lbxAlbumImages.Items.RemoveAt(index);
        lblError.Text = "";
    }
    protected void btnAddAlbum_Click(object sender, EventArgs e)
    {
        if (lbxAlbumImages.Items.Count == 0)
        {
            lblError.Text = "Изберете слики за албумот";
            return;
        }

        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.InsertAlbum");

        cmd.Parameters.AddWithValue("@album_name", txtAlbumName.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "IDAlbum");
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

        if (ds.Tables["IDAlbum"].Rows.Count == 0)
        {
            lblError.Text = "Грешка при зачувувањето на албумот!";
            return;
        }

        string albumDirectory = Server.MapPath("~/Images/Albums/" + ds.Tables["IDAlbum"].Rows[0]["ID"].ToString() + "/");
        CreateDirectoryIfNotExist(albumDirectory);

        if (lbxAlbumImages.Items.Count > 0)
        {
            for (int i = 0; i < lbxAlbumImages.Items.Count; i++)
            {
                conn = db.Connection();
                cmd = db.GetCommand(conn, "dbo.InsertAlbumImage");

                cmd.Parameters.AddWithValue("@album_id", ds.Tables["IDAlbum"].Rows[0]["ID"].ToString());
                cmd.Parameters.AddWithValue("@image_url", "~/Images/Albums/" + ds.Tables["IDAlbum"].Rows[0]["ID"].ToString() + "/" + lbxAlbumImages.Items[i].ToString());

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
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

                string sourceFile = Server.MapPath("~/Images/Temp/" + lbxAlbumImages.Items[i].ToString());
                string destinationFile = Server.MapPath("~/Images/Albums/" + ds.Tables["IDAlbum"].Rows[0]["ID"].ToString() + "/" + lbxAlbumImages.Items[i].ToString());

                File.Move(sourceFile, destinationFile);
            }

        }

        string tempDirectory = Server.MapPath("~/Images/Temp/");
        DeleteDirectoryIfExist(tempDirectory);

        txtAlbumName.Text = "";
        lblError.Text = "";

        int imagesCount = lbxAlbumImages.Items.Count;
        for (int i = 0; i < imagesCount; i++)
        {
            lbxAlbumImages.Items.RemoveAt(0);
        }

        fillDeleteAlbumGrid();
    }

    protected void fillDeleteAlbumGrid()
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.FillDeleteAlbumGrid");

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
            gvDeleteAlbum.DataSource = ds.Tables["Albums"];
            gvDeleteAlbum.DataBind();
            return;
        }

        ViewState["dsAlbums"] = ds;
        gvDeleteAlbum.DataSource = ds.Tables["Albums"];
        gvDeleteAlbum.DataBind();
    }
    protected void gvDeleteAlbum_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDeleteAlbum.PageIndex = e.NewPageIndex;
        gvDeleteAlbum.SelectedIndex = -1;
        DataSet ds = (DataSet)ViewState["dsAlbums"];
        gvDeleteAlbum.DataSource = ds;
        gvDeleteAlbum.DataBind();
    }
    protected void gvDeleteAlbum_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton l = (LinkButton)e.Row.FindControl("lbtnDeleteAlbum");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Дали сте сигурни дека сакате да го избришете албумот " +
                DataBinder.Eval(e.Row.DataItem, "album_name") + "?" + "')");
            }
            catch (Exception err)
            {
                lblError.Text = err.Message;
            }
        }
    }
    protected void gvDeleteAlbum_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.DeleteAlbum");

        int ID = Convert.ToInt32(gvDeleteAlbum.DataKeys[e.RowIndex].Values[0].ToString());
        cmd.Parameters.AddWithValue("@album_id", ID);

        int numChanges = 0;
        try
        {
            conn.Open();
            numChanges = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            lblError.Text = err.Message;
        }
        finally
        {
            gvDeleteAlbum.EditIndex = -1;
            conn.Close();
            conn.Dispose();
        }
        if (numChanges != 0)
        {
            cleanControls();
            fillDeleteAlbumGrid();
        }

        string directory = Server.MapPath("~/Images/Albums/" + ID.ToString());
        DeleteDirectoryIfExist(directory);
    }
}