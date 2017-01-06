/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import com.leapfrog.sampleweb.dao.CourseDAO;
import com.leapfrog.sampleweb.dao.EnquiryDAO;
import com.leapfrog.sampleweb.dao.EnquiryStatusDAO;
import com.leapfrog.sampleweb.dao.IspDAO;
import com.leapfrog.sampleweb.dao.MailingAddressDAO;
import com.leapfrog.sampleweb.entity.Enquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/admin/enquiry")
public class EnquiryController {

    @Autowired
    private EnquiryDAO enquiryDAO;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private EnquiryStatusDAO enquiryStatusDAO;

    @Autowired
    private IspDAO ispDAO;

    @Autowired
    private MailingAddressDAO mailingAddressDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("enquries", enquiryDAO.getAll());
        model.addAttribute("enquiryStatus", enquiryStatusDAO.getAll());
        return "admin/enquiry/index";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@ModelAttribute("id") int id) {
        enquiryDAO.delete(id);
        return "redirect:/admin/enqury?success";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("courses", courseDAO.getAll());
        model.addAttribute("enquiry", enquiryDAO.getById(id));
        model.addAttribute("enquiryStatus", enquiryStatusDAO.getAll());
        return "admin/enquiry/edit";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("enquiry") Enquiry enquiry) {
        enquiryDAO.update(enquiry);
        return "redirect:/admin/enquiry?success";
    }

    @RequestMapping(value = "/mail/{id}", method = RequestMethod.GET)
    public String mail(Model model, @PathVariable("id") int id) {
        model.addAttribute("enquiry", enquiryDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailingAddress", mailingAddressDAO.getAll());
        
        return "/admin/enquiry/mail";
    }
}
