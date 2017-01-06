/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.controller.admin;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "**/logout")
public class LogoutController {
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest req){
        req.getSession().invalidate();
        return "redirect:/login?logout";
    }
}
