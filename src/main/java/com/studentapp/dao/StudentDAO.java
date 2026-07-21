package com.studentapp.dao;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.studentapp.model.Student;
import com.studentapp.util.MongoDBConnection;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Updates.combine;
import static com.mongodb.client.model.Updates.set;

/**
 * Data Access Object encapsulating all MongoDB operations for students.
 */
public class StudentDAO {

    private static final String COLLECTION_NAME = "students";

    private MongoCollection<Document> getCollection() {
        MongoDatabase db = MongoDBConnection.getDatabase();
        return db.getCollection(COLLECTION_NAME);
    }

    public String addStudent(Student student) {
        Document doc = student.toDocument();
        getCollection().insertOne(doc);
        return doc.getObjectId("_id").toString();
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        FindIterable<Document> docs = getCollection().find();
        for (Document doc : docs) {
            students.add(Student.fromDocument(doc));
        }
        return students;
    }

    public Student getStudentById(String id) {
        Document doc = getCollection().find(eq("_id", new ObjectId(id))).first();
        return doc == null ? null : Student.fromDocument(doc);
    }

    public boolean updateStudent(Student student) {
        UpdateResult result = getCollection().updateOne(
                eq("_id", new ObjectId(student.getId())),
                combine(
                        set("name", student.getName()),
                        set("email", student.getEmail()),
                        set("phone", student.getPhone()),
                        set("course", student.getCourse()),
                        set("age", student.getAge()),
                        set("address", student.getAddress())
                )
        );
        return result.getModifiedCount() > 0;
    }

    public boolean deleteStudent(String id) {
        DeleteResult result = getCollection().deleteOne(eq("_id", new ObjectId(id)));
        return result.getDeletedCount() > 0;
    }
}
