/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import com.leapfrog.sampleweb.dao.IspDAO;
import com.leapfrog.sampleweb.dao.MailingAddressDAO;
import com.leapfrog.sampleweb.dao.StudentDAO;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import static javax.mail.Transport.send;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/admin/mail")
public class MailCotroller {

    @Autowired
    private StudentDAO studentDAO;
    @Autowired
    private IspDAO ispDAO;
    @Autowired
    private MailingAddressDAO mailingAddressDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("students", studentDAO.getAll());
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailingAddress", mailingAddressDAO.getAll());
        return "admin/mail/index";
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String sendMail(HttpServletRequest req) {
        String to = req.getParameter("to");
        String from = req.getParameter("from");
        String host = req.getParameter("hostName");

        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);

        Session session = Session.getDefaultInstance(properties);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(req.getParameter("subject"));
            message.setText(req.getParameter("message"));

            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

        return "redirect:/admin?success";
    }

}
