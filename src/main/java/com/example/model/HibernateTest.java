package com.example.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateTest {
    //write service and get from uı
    public static void main(String[] args) {
        SimplePojo simplePojo = new SimplePojo();
        simplePojo.setId(2); // IDENTITY make it useless
        simplePojo.setName("veli");

        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        session.beginTransaction();
        session.save(simplePojo);
        session.getTransaction().commit();
    }
}
