/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.dao.impl;

import com.leapfrog.sampleweb.dao.CourseDAO;
import com.leapfrog.sampleweb.entity.Course;
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
@Repository(value = "courseDAO")
public class CourseDAOImpl implements CourseDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Course> getAll() {
        session = sessionFactory.openSession();
        List<Course> courseList = session.createQuery("SELECT c FROM Course c").list();
        session.close();
        return courseList;
    }

    @Override
    public Course getById(int id) {
        Course course = null;
        session = sessionFactory.openSession();
        course = (Course) session.get(Course.class, id);
        session.close();
        return course;
    }

    @Override
    public void insert(Course c) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(c);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Course c) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(c);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Course course = (Course) session.get(Course.class, id);
        session.delete(course);
        trans.commit();
        session.close();
    }

}
