package com.studentapp.config;

/**
 * Application configuration that reads from environment variables
 * with sensible defaults for local development.
 *
 * Set MONGODB_URI and DB_NAME environment variables for non-local deployments.
 */
public class AppConfig {

    public static final String MONGODB_URI =
            System.getenv("MONGODB_URI") != null
                    ? System.getenv("MONGODB_URI")
                    : "mongodb://localhost:27017";

    public static final String DB_NAME =
            System.getenv("DB_NAME") != null
                    ? System.getenv("DB_NAME")
                    : "student_registration_db";

    private AppConfig() {}
}
