# 🚀 Java CI/CD Pipeline using Jenkins, Docker & Kubernetes

## 📌 Project Overview

This project demonstrates an end-to-end CI/CD pipeline for deploying a Java application to Kubernetes using Jenkins, Docker, Docker Hub, and Minikube.

---

## 🏗️ Architecture

Developer
    ↓
GitHub
    ↓
Jenkins
    ↓
Maven Build
    ↓
Docker Build
    ↓
Docker Hub
    ↓
Kubernetes


------------------------------------------------

#End -To-End Architecture

Developer
   │
   │ git push
   ▼
GitHub Repository
   │
   │ Webhook
   ▼
Jenkins CI/CD Pipeline
   │
   ├── 1. Checkout Code
   ├── 2. Build Application (Maven)
   ├── 3. Run Unit Tests
   ├── 4. SonarQube Code Analysis
   ├── 5. Build Artifact (.jar/.war)
   ├── 6. Build Docker Image
   ├── 7. Tag Docker Image
   └── 8. Push Image to Docker Registry
                     │
                     ▼
               Docker Registry
                     │
                     │ Image Pull
                     ▼
               Kubernetes Cluster
                     │
             kubectl / Helm Deploy
                     │
                     ▼
                 Deployment
                     │
              ReplicaSet
                     │
             ┌───────┴───────┐
             ▼               ▼
           Pod 1             Pod 2
             │               │
             └───────┬───────┘
                     ▼
                  Service
                     │
              Ingress / LB
                     │
                     ▼
                    User



-------------------------------------------------------------

#Implementation Process

Developer
   │
   │ git push
   ▼
GitHub
   │
   │ Jenkins detects/triggers build
   ▼
Jenkins
   │
   ├── Checkout
   ├── Maven Build
   ├── Docker Build
   ├── Docker Login
   ├── Docker Push
   └── Kubernetes Deploy
            │
            ▼
        Minikube
            │
            ▼
       Deployment
            │
            ▼
          Pods
            │
            ▼
         Service
            │
            ▼
       Application

 
----------------------------------------------
