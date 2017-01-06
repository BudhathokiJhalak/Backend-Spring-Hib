/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import com.leapfrog.sampleweb.dao.CourseDAO;
import com.leapfrog.sampleweb.dao.IspDAO;
import com.leapfrog.sampleweb.dao.MailingAddressDAO;
import com.leapfrog.sampleweb.dao.TutorDAO;
import com.leapfrog.sampleweb.entity.Tutor;
import com.sun.tracing.dtrace.ModuleAttributes;
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
@RequestMapping(value = "/admin/tutor")
public class TutorController {

    @Autowired
    private TutorDAO tutorDAO;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private IspDAO ispDAO;
    
    @Autowired
    private MailingAddressDAO mailingAddressDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("tutors", tutorDAO.getAll());
        return "admin/tutor/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/tutor/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("tutor") Tutor tutor) {
        if (tutor.getTutorId() == null) {
            tutorDAO.insert(tutor);
        } else {
            tutorDAO.update(tutor);
        }
        return "redirect:/admin/tutor?success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        tutorDAO.delete(id);
        return "redirect:/admin/tutor?success";
    }

    @RequestMapping(value = "/edit/{id}")
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("tutor", tutorDAO.getById(id));
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/tutor/edit";
    }

    @RequestMapping(value = "/mail/{id}")
    public String mail(Model model, @PathVariable("id") int id) {
        model.addAttribute("tutors", tutorDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailingAddress", mailingAddressDAO.getAll());
        return "admin/tutor/mail";
    }
}
