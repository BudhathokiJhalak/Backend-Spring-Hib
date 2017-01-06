/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.dao.impl;

import com.leapfrog.sampleweb.dao.StudentDAO;
import com.leapfrog.sampleweb.entity.Student;
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
@Repository(value = "studentDAO")
public class StudentDAOImpl implements StudentDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Student> getAll() {
        session = sessionFactory.openSession();
        List<Student> studentList = session.createQuery("SELECT s FROM Student s").list();
        session.close();
        return studentList;
    }

    @Override
    public Student getById(int id) {
        Student student = null;
        session = sessionFactory.openSession();
        student = (Student) session.get(Student.class, id);
        session.close();
        return student;
    }

    @Override
    public void insert(Student s) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(s);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Student s) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(s);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Student student = (Student) session.get(Student.class, id);
        session.delete(student);
        trans.commit();
        session.close();
    }

}
