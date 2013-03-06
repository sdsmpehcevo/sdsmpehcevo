using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            cleanControls();
        }
    }
    protected void btnContact_Click(object sender, EventArgs e)
    {
        string msg = SendEmail.SendMail("sdsmpehcevo@gmail.com", txtEmail.Text, "", "Коментар од " + txtName.Text, txtComment.Text + "<br />Пратено од: " + txtEmail.Text);
        cleanControls();
        lblError.Text = msg;        
    }
    protected void cleanControls()
    {
        lblError.Text = "";
        txtName.Text = "";
        txtEmail.Text = "";        
        txtComment.Text = "";       
    }
}