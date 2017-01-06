/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.dao.impl;

import com.leapfrog.sampleweb.dao.EnquiryStatusDAO;
import com.leapfrog.sampleweb.entity.EnquiryStatus;
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
@Repository(value = "enquiryStatusDAO")
public class EnquiryStatusDAOImpl implements EnquiryStatusDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<EnquiryStatus> getAll() {
        session = sessionFactory.openSession();
        List<EnquiryStatus> enquiryStatusList = session.createQuery("SELECT es FROM EnquiryStatus es").list();
        session.close();
        return enquiryStatusList;
    }

    @Override
    public EnquiryStatus getById(int id) {
        EnquiryStatus enquiryStatus = null;
        session = sessionFactory.openSession();
        enquiryStatus = (EnquiryStatus) session.get(EnquiryStatus.class, id);
        session.close();
        return enquiryStatus;
    }

    @Override
    public void insert(EnquiryStatus es) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(es);
        trans.commit();
        session.close();
    }

    @Override
    public void update(EnquiryStatus es) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(es);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        EnquiryStatus enquiryStatus = (EnquiryStatus) session.get(EnquiryStatus.class, id);
        session.delete(enquiryStatus);
        trans.commit();
        session.close();
    }

}
