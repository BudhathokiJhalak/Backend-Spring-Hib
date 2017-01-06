/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import com.leapfrog.sampleweb.dao.EnquiryStatusDAO;
import com.leapfrog.sampleweb.entity.EnquiryStatus;
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
@RequestMapping(value = "/admin/enquirystatus")
public class EnquiryStatusController {

    @Autowired
    private EnquiryStatusDAO enquiryStatusDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("enquiryStatus", enquiryStatusDAO.getAll());
        return "admin/enquiryStatus/index";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("es", enquiryStatusDAO.getById(id));
        return "admin/enquiryStatus/edit";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("enquiryStatus") EnquiryStatus enquiryStatus) {
        if (enquiryStatus.getEnquiryStatusId() == null) {
            enquiryStatusDAO.insert(enquiryStatus);
        } else {
            enquiryStatusDAO.update(enquiryStatus);
        }
        return "redirect:/admin/enquirystatus?success";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "admin/enquiryStatus/add";
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id")int id){
        enquiryStatusDAO.delete(id);
        return "redirect:/admin/enquirystatus?success";
    }
}
