using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BecomeMember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblError.Text = "";
            cleanControls();
        }
    }

    protected void btnBecomeMember_Click(object sender, EventArgs e)
    {
        string title = "Пристапница за членство";
        string body = "<br /><br />Информации за личноста:<br /><br />" +
                      "Име и Презиме: " + txtName.Text + "<br />" +
                      "Адреса: " + txtAddress.Text + "<br />" +
                      "Место: " + ddlMunicipalities.Items[ddlMunicipalities.SelectedIndex].ToString() + "<br />" +
                      "Email: " + txtEmail.Text + "<br />" +
                      "Телефон: " + txtPhone.Text + "<br />";

        if (txtEducation.Text != "")
        {
            body += "Образование: " + txtEducation.Text + "<br />";
        }

        if (txtJob.Text != "")
        {
            body += "Работа: " + txtJob.Text + "<br />";
        }

        string msg = SendEmail.SendMail("sdsmpehcevo@gmail.com", txtEmail.Text, "", title, body);
        lblError.Text = msg;
        cleanControls();
    }

    protected void cleanControls()
    {
        txtName.Text = "";
        txtEmail.Text = "";
        txtComment.Text = "";
        txtAddress.Text = "";
        txtEducation.Text = "";
        txtJob.Text = "";
        txtPhone.Text = "";
    }
}