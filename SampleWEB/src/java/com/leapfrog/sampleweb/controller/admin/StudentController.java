/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import com.leapfrog.sampleweb.dao.CourseDAO;
import com.leapfrog.sampleweb.dao.IspDAO;
import com.leapfrog.sampleweb.dao.MailingAddressDAO;
import com.leapfrog.sampleweb.dao.StudentDAO;
import com.leapfrog.sampleweb.entity.Student;
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
@RequestMapping(value = "/admin/student")
public class StudentController {

    @Autowired
    private StudentDAO studentDAO;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private IspDAO ispDAO;

    @Autowired
    private MailingAddressDAO mailingAddressDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("students", studentDAO.getAll());
        return "admin/student/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/student/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("student") Student student) {
        if (student.getStudentId() == null) {
            studentDAO.insert(student);
        } else {
            studentDAO.update(student);
        }
        return "redirect:/admin/student?success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        studentDAO.delete(id);
        return "redirect:/admin/student?success";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("student", studentDAO.getById(id));
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/student/edit";
    }

    @RequestMapping(value = "/mail/{id}", method = RequestMethod.GET)
    public String mail(Model model, @PathVariable("id") int id) {
        model.addAttribute("students", studentDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailingAddress", mailingAddressDAO.getAll());
        return "admin/student/mail";
    }
}
