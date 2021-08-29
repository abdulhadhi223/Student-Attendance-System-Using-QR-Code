/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Networks;

/**
 *
 * @author Lenovo
 */
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class QRMail {

    public static boolean secretMail(String imagePath, String sub, String email, String messageText, String name) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        // Assuming you are sending email from localhost
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("cloudapi90@gmail.com", "Cloud@123");
            }
        });

        System.out.println("Message" + messageText);
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress(sub));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("CLOUD SERVER");
           
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(messageText, "text/html");
 
            // Create a multipart message for attachment
            Multipart multipart = new MimeMultipart();
 
            // Set text message part
            multipart.addBodyPart(messageBodyPart);
 
            messageBodyPart = new MimeBodyPart();
 
            // Valid file location
            DataSource source = new FileDataSource(imagePath);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(name+".png");
            // Trick is to add the content-id header here
            messageBodyPart.setHeader("Content-ID", "image_id");
            multipart.addBodyPart(messageBodyPart);
 
            System.out.println("\n4th ===> third part for displaying image in the email body..");
            messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent("<br><h3>QR Code</h3>"
                    + "<img src='cid:image_id'>", "text/html");
            multipart.addBodyPart(messageBodyPart);
            message.setContent(multipart);
 
            System.out.println("\n5th ===> Finally Send message..");
 
            // Finally Send message
            Transport.send(message);
            
            System.out.println("Done");
            return true;

        } catch (MessagingException e) {
            System.out.println(e);
            e.printStackTrace();
            return false;
            // throw new RuntimeException(e);
        }
    }
}
