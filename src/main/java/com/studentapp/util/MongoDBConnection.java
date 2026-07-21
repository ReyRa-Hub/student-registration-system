package com.studentapp.util;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import com.studentapp.config.AppConfig;

/**
 * Centralized MongoDB connection handler.
 * Reads connection details from AppConfig (environment variables or defaults).
 */
public class MongoDBConnection {

    private static MongoClient mongoClient;

    private MongoDBConnection() {}

    public static synchronized MongoClient getClient() {
        if (mongoClient == null) {
            mongoClient = MongoClients.create(AppConfig.MONGODB_URI);
        }
        return mongoClient;
    }

    public static MongoDatabase getDatabase() {
        try {
            MongoDatabase db = getClient().getDatabase(AppConfig.DB_NAME);
            // Verify the connection is actually alive
            db.listCollectionNames().first();
            return db;
        } catch (Exception e) {
            throw new RuntimeException(
                    "Failed to connect to MongoDB at " + AppConfig.MONGODB_URI
                    + " (database: " + AppConfig.DB_NAME + "): " + e.getMessage(), e);
        }
    }

    public static void close() {
        if (mongoClient != null) {
            mongoClient.close();
            mongoClient = null;
        }
    }
}
