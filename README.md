# DevSecOps 3-Tier Application on AWS EKS with GitOps
Production-ready DevOps infrastructure implementing modern cloud-native practices with automated CI/CD pipelines on AWS EKS. The platform integrates Terraform for Infrastructure as Code, Jenkins for continuous integration, ArgoCD for GitOps delivery, and comprehensive monitoring with Prometheus/Grafana. Features enterprise-grade security scanning, automated quality gates, and zero-downtime deployment strategies for scalable application delivery. Demonstrates advanced DevOps engineering capabilities with full automation from code commit to production deployment.
> Complete DevOps infrastructure with AWS EKS, Jenkins CI/CD, ArgoCD GitOps, and monitoring stack for automated application delivery.

<p align="center">
  <img src="05-icons-k8s/aws-logo.png" alt="AWS" width="130" style="margin: 20px;"/>
  <img src="05-icons-k8s/Kubernetes.png" alt="Kubernetes" width="95" style="margin: 20px;"/>
</p>



<h3 align="center">AWS Services Used</h3>

<p align="center">
  <img src="05-icons-k8s/ec2.png" alt="EC2" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/virtual-private-cloud.png" alt="VPC" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Elastic Container Registry.png" alt="ECR" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/EKS Cloud.png" alt="EKS" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Route 53.png" alt="Route 53" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Elastic Load Balancing.png" alt="LB" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Identity and Access Management.png" alt="IAM" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Simple Storage Service.png" alt="S3" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/DynamoDB.png" alt="DynamoDB" width="60" style="margin:10px"/>
</p>


<h3 align="center">Tools & Technologies Used </h3>

<!-- Row 2 -->
<p align="center">
  <img src="05-icons-k8s/docker.png" alt="Docker" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/terraform.jpg" alt="Terraform" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/jenkins.png" alt="Jenkins" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/sonarqube.png" alt="SonarQube" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/trivy.png" alt="Trivy" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/owasp.png" alt="OWASP" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Kubernetes.png" alt="Kubernetes" width="60" style="margin:10px"/>
</p>

<!-- Row 3 -->
<p align="center">
  <img src="05-icons-k8s/Helm.png" alt="Helm" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Argo CD.png" alt="Argo CD" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Grafana.png" alt="Grafana" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Prometheus.png" alt="Prometheus" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/PostgresSQL.png" alt="Postgres" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/Django.png" alt="Django" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/react.png" alt="React" width="60" style="margin:10px"/>
  <img src="05-icons-k8s/github.png" alt="GitHub" width="60" style="margin:10px"/>
</p>

## Infrastructure
| Component   | Technology             | Configuration                                    | Access                                   |
|-------------|------------------------|--------------------------------------------------|------------------------------------------|
| Kubernetes  | Amazon EKS              | 2x t2.medium nodes, ap-south-1                    | kubectl configured                       |
| CI/CD       | Jenkins on EC2          | Docker, kubectl, AWS CLI, SonarCube              | :8080                                    |
| GitOps      | ArgoCD                  | 5 applications, auto-sync enabled                | LoadBalancer                             |
| Monitoring  | Prometheus + Grafana    | Helm deployed, Dashboard                 | :9090, :3000                             |
| Registry    | AWS ECR                 | frontend/backend repositories                    | IAM authenticated                        |
| Storage     | S3 + DynamoDB           | Terraform state + locking                        | Backend configured                       |
| DNS         | Route 53                | Custom domain routing                            | online.com, api.online.com       |
| Security    | SonarCube + OWASP       | Code quality + dependency scanning               | :9000                                    |

## Application Stack & Deployment
| Layer      | Component     | Technology                    | Deployment                | Status      |
|------------|--------------|--------------------------------|---------------------------|-------------|
| Frontend   | Web App       | React (Port 3000)              | ArgoCD → EKS               | Auto-sync   |
| Backend    | API Server    | Django REST (Port 8000)        | ArgoCD → EKS               | Auto-sync   |
| Database   | Data Layer    | PostgreSQL (Port 5432)         | ArgoCD → EKS               | Auto-sync   |
| Ingress    | Load Balancer | AWS ALB Controller             | Frontend + Backend routes  | Active      |
| Namespaces | Organization  | three-tier, argocd, monitoring | Kubernetes separation      | Configured  |
| Images     | Containers    | Docker → ECR repositories      | Jenkins builds             | Automated   |
| Secrets    | Credentials   | K8s secrets + Jenkins store    | 7 configured credentials   | Secured     |

## CI/CD Pipeline
| Stage   | Process         | Backend Pipeline                         | Frontend Pipeline                  |
|---------|----------------|------------------------------------------|-------------------------------------|
| Setup   | Infrastructure | `terraform init && apply`                | Configure AWS credentials          |
| Source  | Code Checkout  | Git → Jenkins trigger                     | Git → Jenkins trigger               |
| Quality | Code Analysis  | SonarCube scan + OWASP check              | SonarCube scan + OWASP check        |
| Build   | Containerization | Docker build → ECR push                  | Docker build → ECR push             |
| Deploy  | GitOps Sync    | ArgoCD detects → K8s deploy               | ArgoCD detects → K8s deploy         |
| Access  | Endpoints      | `api.online.com`                      | `online.com`                    |
| Monitor | Observability  | Prometheus metrics                        | Grafana dashboards                  |

## Architecture Diagram
<p align="center">
  <img src="07-architecture/k8s-architecture.png" alt="Architecture Diagram" width="800"/>
</p>

## Author

Noufa Sunkesula

Contact: +91 8106859686

Mail ID: noufasunkesula@gmail.com

