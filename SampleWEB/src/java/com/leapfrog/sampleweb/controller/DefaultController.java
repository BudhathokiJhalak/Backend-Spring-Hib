/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller;

import com.leapfrog.sampleweb.dao.CourseDAO;
import com.leapfrog.sampleweb.dao.EnquiryDAO;
import com.leapfrog.sampleweb.entity.Enquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/")
public class DefaultController {

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private EnquiryDAO enquiryDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/enquiry", method = RequestMethod.GET)
    public String enquiry(Model model) {
        model.addAttribute("courses", courseDAO.getAll());
        return "enquiry";
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String send(@ModelAttribute("enquiry")Enquiry enquiry) {
        if(enquiry.getEnquiryId()==null){
            enquiryDAO.insert(enquiry);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        ModelAndView model = new ModelAndView();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetails.getUsername());
        }

        model.setViewName("403");
        return model;
    }
}
