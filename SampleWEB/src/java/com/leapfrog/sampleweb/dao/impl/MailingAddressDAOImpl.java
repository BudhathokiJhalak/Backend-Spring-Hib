/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.dao.impl;

import com.leapfrog.sampleweb.dao.MailingAddressDAO;
import com.leapfrog.sampleweb.entity.MailingAddress;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author zak
 */
@Repository(value = "mailingAddressDAO")
public class MailingAddressDAOImpl implements MailingAddressDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<MailingAddress> getAll() {
        session = sessionFactory.openSession();
        List<MailingAddress> mailingAddressList = session.createQuery("SELECT m FROM MailingAddress m").list();
        session.close();
        return mailingAddressList;
    }

    @Override
    public MailingAddress getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void insert(MailingAddress t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(MailingAddress t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
