# Project 7: Matrix Builds with GitHub Actions (Python Versions)

This project demonstrates how to use **GitHub Actions matrix builds** to test, containerize, and deploy a Python application across multiple Python versions.  

We use:
- ✅ Matrix builds for Python 3.8 → 3.11  
- ✅ Automated Docker image build & push to DockerHub  
- ✅ Deployment to an AWS EC2 instance (Ubuntu) via SSH
  
## 🚀 Features
- Flask web app (`app.py`)
- Dockerized with a lightweight `Dockerfile`
- GitHub Actions workflow that:
  - Runs tests on multiple Python versions using **matrix strategy**
  - Builds and pushes Docker images tagged by Python version
  - Deploys the selected Python version to AWS EC2
- Credentials managed securely via GitHub Secrets
  
## 📂 Project Structure
matrix-builds/
│── app.py
│── requirements.txt
│── Dockerfile
│── tests/
│   └── test_app.py
│── README.md
└── .github/
    └── workflows/
        └── matrix-builds.yml

## ⚙️ GitHub Actions Workflow

### Matrix Testing
Runs unit tests across Python 3.8, 3.9, 3.10, and 3.11.

### Build & Push Docker Images
Builds Docker images for each Python version and pushes them to DockerHub with versioned tags.

Example tags:
- `username/matrix-app:py3.8`
- `username/matrix-app:py3.9`
- `username/matrix-app:py3.10`
- `username/matrix-app:py3.11`

### Deploy to EC2
Automatically deploys the chosen Python version to your EC2 instance.  
The version is controlled via the secret `DEPLOY_PYTHON_VERSION` (default: 3.11).

## 🔑 Required GitHub Secrets

- `DOCKER_USERNAME` → Your DockerHub username
- `DOCKER_PASSWORD` → Your DockerHub Access Token
- `EC2_HOST` → Public IP of your EC2 instance
- `EC2_USER` → SSH username (e.g., `ubuntu`)
- `EC2_SSH_KEY` → Private key content of your `.pem` file
- `DEPLOY_PYTHON_VERSION` → Python version to deploy (default: 3.11)
## 🖥️ Run Locally (Optional)

# Build image locally
docker build -t matrix-app .

# Run container
docker run -p 5000:5000 matrix-app

Visit: http://localhost:5000
## 🌍 Access on AWS

After a successful GitHub Actions run, visit:

http://<EC2_PUBLIC_IP>

You should see:

Hello from Project 7 - running with Python <version>


