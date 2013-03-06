using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;


/// <summary>
/// Summary description for SendEmail
/// </summary>
public class SendEmail
{
    public SendEmail()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string SendMail(string toList, string from, string ccList, string subject, string body)
    {

        MailMessage message = new MailMessage();
        SmtpClient smtpClient = new SmtpClient();
        string msg = string.Empty;
        try
        {
            MailAddress fromAddress = new MailAddress(from);
            message.From = fromAddress;
            message.To.Add(toList);
            if (ccList != null && ccList != string.Empty)
                message.CC.Add(ccList);
            message.Subject = subject;
            message.IsBodyHtml = true;
            message.Body = body;
            smtpClient.Host = "smtp.gmail.com";   // gmail како smtp клиент
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("sdsmpehcevo@gmail.com", "JoPeDrTrNiJoSDSM");

            smtpClient.Send(message);
            msg = "Пораката е успешно пратена!";
        }
        catch (Exception ex)
        {
            msg = ex.Message;
        }
        return msg;
    }
}