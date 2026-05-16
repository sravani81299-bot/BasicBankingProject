# 🏦 Banking CI/CD Project

This project demonstrates a complete CI/CD pipeline using:

- GitHub
- Jenkins
- Maven
- Docker
- Spring Boot

---

## 🚀 CI/CD Flow

1. Developer pushes code to GitHub
2. Jenkins pipeline triggers automatically
3. Maven builds the application
4. Docker image is created
5. Image pushed to DockerHub
6. Application deployed using Docker

---

## ▶️ Run Locally

### Build Project
```bash
mvn clean package
```

### Run Application
```bash
java -jar target/banking-app-1.0.jar
```

### Docker Build
```bash
docker build -t banking-app .
```

### Docker Run
```bash
docker run -p 8080:8080 banking-app
```

---

## 🌐 Access Application

```bash
http://localhost:8080
```

---

## 👩‍💻 Author

Sravani
