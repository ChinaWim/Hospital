package com.ming.hospital.utils;

/**
 * Created by Ming on 2017/11/17.
 */

import com.ming.hospital.pojo.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;
/**
 * Created by Ming on 2017/8/24.
 */
public class MailUtil extends Thread  {

    private static String link;
    private User user;
    static {
        Properties properties = new Properties();
        try {
            properties.load(MailUtil.class.getResourceAsStream("/config.properties"));
            String my_ip = (String) properties.get("my_ip");
            link = my_ip;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public MailUtil(User user) {
        this.user = user;
    }

    @Override
    public void run() {
        try {
            Properties props = new Properties();
            props.setProperty("mail.host","smtp.qq.com");
            props.setProperty("mail.smtp.port","465");
            props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.setProperty("mail.smtp.socketFactory.port", "465");
            props.setProperty("mail.smtp.auth","true");

            Session session = Session.getDefaultInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("969130721@qq.com","pkqowyqqhnaxbgae");
                }
            });
            session.setDebug(true);
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("969130721@qq.com"));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(user.getEmail()));
            message.setSubject("医者天下注册激活邮件");
            String html = "<h2>亲爱的"+user.getName()+"用户你好：</h2><br/>";
            html += "&nbsp&nbsp恭喜你的账号："+user.getUser()+" 注册成功！请48小时内，点击此链接激活" +
                    "<a href = 'http://"+link+"/Hospital/user/active/"+user.getCode()+"'>"
                    +user.getCode()+"</a>";
            message.setContent(html,"text/html;charset=utf-8");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

}