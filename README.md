# Student Registration System (Java Servlets + MongoDB)

A CRUD web app for managing student records, built with plain Java
Servlets, JSP, and the MongoDB Java driver.

## Features

- Register a new student
- View all students in a table
- Edit an existing student
- Delete a student
- MongoDB used as the data store (no ORM, direct driver calls via a DAO)

## Project Structure

```
StudentRegistrationSystem/
├── Dockerfile                          # Multi-stage build for Render / Docker
├── .dockerignore
├── .gitignore
├── pom.xml
└── src/main/java/com/studentapp/
    ├── config/AppConfig.java           # Reads env vars (MONGODB_URI, DB_NAME)
    ├── model/Student.java              # POJO + Document mapping
    ├── dao/StudentDAO.java             # MongoDB CRUD operations
    ├── util/MongoDBConnection.java     # Mongo client singleton
    └── servlet/
        ├── RegisterServlet.java        # /register  (GET form, POST create)
        ├── ViewStudentsServlet.java    # /viewStudents (list)
        ├── EditServlet.java            # /edit?id=   (load record)
        ├── UpdateServlet.java          # /update    (POST save)
        └── DeleteServlet.java          # /delete?id=
```

---

## Local Development

### Prerequisites
- JDK 11+
- Apache Maven
- MongoDB running locally (`mongod`)
- Apache Tomcat 9+

### Run locally
```bash
mvn clean package
# Copy WAR to Tomcat webapps/ and start Tomcat, OR use your IDE's server integration
# Visit: http://localhost:8080/StudentRegistrationSystem/
```

No configuration file changes needed — the app defaults to `mongodb://localhost:27017`
and the database `student_registration_db` when no environment variables are set.

---

## Deploy to Render (Docker)

Render has no native Java/Tomcat runtime, so this project ships a `Dockerfile`
that builds and runs the app using a Tomcat 9 base image.

### Step 1 — MongoDB Atlas (free)

1. Go to [mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas) → create a free cluster
2. Create a database user (username + password)
3. Allow access from **all IPs** (`0.0.0.0/0`) under Network Access
4. Copy the **SRV connection string**, e.g.:
   ```
   mongodb+srv://<user>:<password>@cluster0.xxxxx.mongodb.net/
   ```

### Step 2 — Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/<you>/<repo>.git
git push -u origin main
```

### Step 3 — Create a Render Web Service

1. Go to [render.com](https://render.com) → **New → Web Service**
2. Connect your GitHub repo
3. Set these settings:

   | Setting | Value |
   |---------|-------|
   | **Environment** | Docker |
   | **Instance Type** | Free |
   | **Port** | 8080 |

4. Under **Environment Variables**, add:

   | Key | Value |
   |-----|-------|
   | `MONGODB_URI` | `mongodb+srv://<user>:<pass>@cluster0.xxxxx.mongodb.net/` |
   | `DB_NAME` | `student_registration_db` |

5. Click **Deploy** — Render will build the Docker image and start the container.

Your app will be live at `https://<your-service>.onrender.com/`

> **Note:** On Render's free tier, the service sleeps after 15 minutes of inactivity.
> The first request after sleep takes ~30 seconds to wake up.

---

## Environment Variables Reference

| Variable | Default (local) | Description |
|----------|----------------|-------------|
| `MONGODB_URI` | `mongodb://localhost:27017` | Full MongoDB connection string |
| `DB_NAME` | `student_registration_db` | Database name |

---

## Routes

| Method | Path              | Purpose                      |
|--------|-------------------|------------------------------|
| GET    | `/register`       | Show registration form        |
| POST   | `/register`       | Create a student              |
| GET    | `/viewStudents`   | List all students             |
| GET    | `/edit?id={id}`   | Load a student into edit form |
| POST   | `/update`         | Save edits                    |
| GET    | `/delete?id={id}` | Delete a student              |

---

## Notes

- Passwords/auth are intentionally out of scope — this is a records CRUD demo.
- The `students` collection is created automatically on first insert.
- The `mongodb-driver-sync` dependency is used directly; swap in
  Spring Data MongoDB if you prefer a repository abstraction later.
