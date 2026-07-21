package com.studentapp.model;

import org.bson.Document;

/**
 * Simple POJO representing a Student document stored in MongoDB.
 */
public class Student {

    private String id;
    private String name;
    private String email;
    private String phone;
    private String course;
    private int age;
    private String address;

    public Student() {}

    public Student(String name, String email, String phone, String course, int age, String address) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.course = course;
        this.age = age;
        this.address = address;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    /** Converts this Student into a MongoDB Document for persistence. */
    public Document toDocument() {
        Document doc = new Document();
        doc.append("name", name)
           .append("email", email)
           .append("phone", phone)
           .append("course", course)
           .append("age", age)
           .append("address", address);
        return doc;
    }

    /** Builds a Student instance from a MongoDB Document. */
    public static Student fromDocument(Document doc) {
        Student s = new Student();
        s.setId(doc.getObjectId("_id").toString());
        s.setName(doc.getString("name"));
        s.setEmail(doc.getString("email"));
        s.setPhone(doc.getString("phone"));
        s.setCourse(doc.getString("course"));
        Integer ageVal = doc.getInteger("age");
        s.setAge(ageVal == null ? 0 : ageVal);
        s.setAddress(doc.getString("address"));
        return s;
    }
}
