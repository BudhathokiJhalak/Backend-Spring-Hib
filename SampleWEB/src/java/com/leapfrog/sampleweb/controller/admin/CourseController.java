/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import com.leapfrog.sampleweb.dao.CourseDAO;
import com.leapfrog.sampleweb.entity.Course;
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
@RequestMapping(value = "/admin/course")
public class CourseController {

    @Autowired
    private CourseDAO courseDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/course/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "admin/course/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("course") Course course) {
        if (course.getCourseId() == null) {
            courseDAO.insert(course);
        } else {
            courseDAO.update(course);
        }
        return "redirect:/admin/course?success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        courseDAO.delete(id);
        return "redirect:/admin/course?success";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("course", courseDAO.getById(id));
        return "admin/course/edit";
    }
}
