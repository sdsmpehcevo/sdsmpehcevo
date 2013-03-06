using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {
            cleanControls();

            HttpCookie cookie = Request.Cookies["cedentials"];
            if (cookie != null)
            {
                txtUsername.Text = cookie["user"].ToString();
                txtPassword.Attributes["value"] = cookie["password"].ToString();
                chkRemember.Checked = true;               
            }
        }
    }

    protected void cleanControls()
    {
        lblError.Text = "";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataBase db = new DataBase();
        SqlConnection conn = db.Connection();
        SqlCommand cmd = db.GetCommand(conn, "dbo.LoginInfo");
        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            da.Fill(ds, "Admin");
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

        if (ds.Tables["Admin"].Rows.Count == 0)
        {
            lblError.Text = "Погрешен username или password!";
        }
        else
        {
            if (txtUsername.Text == ds.Tables["Admin"].Rows[0]["username"].ToString())
            {
                string pass = EncryptDecrypt.Decrypt(ds.Tables["Admin"].Rows[0]["password"].ToString());
                if (txtPassword.Text == pass)
                {
                    Session["admin"] = txtUsername.Text;

                    if (chkRemember.Checked)
                    {
                        HttpCookie cookie = new HttpCookie("cedentials");
                        cookie["user"] = txtUsername.Text;
                        cookie["password"] = txtPassword.Text;
                        cookie.Expires = DateTime.Now.AddDays(30d);
                        Response.Cookies.Add(cookie);
                    }
                    else
                    {
                        HttpCookie cookie = new HttpCookie("cedentials");
                        cookie.Expires = DateTime.Now.AddDays(-1d);
                        Response.Cookies.Add(cookie);
                    }

                    Response.Redirect("~/Administration.aspx");
                }
                else
                {
                    lblError.Text = "Погрешен password";
                }
            }
            else
            {
                lblError.Text = "Погрешен username";
            }
        }
    }
}