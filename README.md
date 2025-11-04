# devops-training-crossplane
Using Crossplane, Docker and K8s to host a recipe website
DevOps Learning Project: Website Deployment with Kubernetes, Docker, and Crossplane
Project Overview
You'll build a complete infrastructure-as-code solution that deploys a containerized website using modern DevOps practices. This hands-on project will give you practical experience with container orchestration and cloud infrastructure management.
Prerequisites Setup
Required Software

Install on your local machine:

Docker Desktop (includes Kubernetes)
Visual Studio Code
kubectl (Kubernetes CLI)
Helm (Kubernetes package manager)
A cloud provider CLI (AWS CLI, Azure CLI, or gcloud - choose one)


VS Code Extensions to Install:

Docker
Kubernetes
YAML
Remote - Containers



Knowledge Check
Before starting, ensure you understand:

Basic containerization concepts
YAML syntax
Command-line operations
Basic HTML/web development

Phase 1: Create Your Website Application
Task 1.1: Build a Simple Website

[Completed] Create a project folder in VS Code
[Completed]Build a basic HTML/CSS website (can be a simple portfolio or landing page)
Think about: What files does a basic website need?

Task 1.2: Containerize with Docker

[Completed] Write a Dockerfile to containerize your website
Consider: What base image makes sense for serving static HTML? (Hint: nginx or httpd)
[Completed] Build your Docker image locally
[Completed]Test it by running the container and accessing it in your browser

Deliverable Questions:

What port is your application running on? - 80:80
How do you map ports between container and host?

Phase 2: Local Kubernetes Deployment
Task 2.1: Enable Kubernetes Locally

[Completed] enable Kubernetes in Docker Desktop
[Completed] Verify your cluster is running using kubectl commands
Explore: How do you check cluster status and available nodes? - Can use kubectl get pods

Task 2.2: Create Kubernetes Manifests
You'll need to create YAML files for:

[Completed] Deployment: Defines your application pods

How many replicas do you want? - 2
What container image will you use? - recipe-website
What resource limits should you set? - cpu 250, memory 265Mi


[Completed] Service: Exposes your application

What type of service? (ClusterIP, NodePort, or LoadBalancer?) - Loadbalancer
What ports need to be exposed? - 80:80
 

Optional: ConfigMap: For configuration data
Optional: Ingress: For HTTP routing

Task 2.3: Deploy to Local Kubernetes

[Completed] Apply your manifests to the clusters
Verify pods are running
Access your website through the service
Debug any issues using kubectl logs and describe commands

Challenge Questions:

How do you update your application with a new version?
What happens if a pod crashes?

Phase 3: Integrate Crossplane
Task 3.1: Understand Crossplane's Role
Research and answer:

What is Crossplane and why use it?
How does it differ from Terraform or other IaC tools?
What is a "Provider" in Crossplane?

Task 3.2: Install Crossplane

Install Crossplane in your Kubernetes cluster using Helm
Choose a cloud provider and install the appropriate Crossplane provider
Configure credentials for your cloud provider

Task 3.3: Create Cloud Resources with Crossplane
Using Crossplane Custom Resources, provision:

A managed Kubernetes cluster in your cloud provider (EKS, AKS, or GKE)
Required networking resources (VPC, subnets, etc.)
Any additional resources needed (storage, load balancer)

Design Decisions:

What region will you deploy to?
What instance types/sizes are appropriate?
How will you handle costs? (Look into free tiers)

Phase 4: Deploy to Cloud
Task 4.1: Push Docker Image to Registry

Create a container registry (Docker Hub, ECR, GCR, or ACR)
Tag your image appropriately
Push your image to the registry
Update your Kubernetes manifests to use the registry image

Task 4.2: Deploy to Cloud Cluster

Configure kubectl to connect to your cloud cluster
Apply your Kubernetes manifests to the cloud cluster
Verify everything is running in the cloud environment

Task 4.3: Access Your Website

Determine the external IP or DNS name
Access your website from the internet
Set up proper DNS (optional but recommended)

Phase 5: Best Practices & Polish
Task 5.1: Implement CI/CD Concepts
Think about:

How would you automate builds when code changes?
Where would you store your manifests? (Git repository structure)
What would a deployment pipeline look like?

Task 5.2: Security Hardening

Don't commit credentials to Git
Use Kubernetes secrets appropriately
Implement resource limits and requests
Review security best practices for your container

Task 5.3: Documentation
Create documentation including:

Architecture diagram
Setup instructions for teammates
Troubleshooting guide
Cost considerations

Learning Checkpoints
After completing each phase, answer:

What problems did you encounter and how did you solve them?
What commands/tools were most useful?
How would you explain this component to someone else?
What would you do differently next time?

Additional Challenges
Once you complete the basic setup:

Implement horizontal pod autoscaling
Add monitoring (Prometheus/Grafana)
Set up logging aggregation
Create multiple environments (dev/staging/prod)
Implement blue-green or canary deployments

Resources to Explore

Official Kubernetes documentation
Docker documentation
Crossplane documentation
Cloud provider documentation for Kubernetes services
CNCF landscape for understanding the ecosystem

Success Criteria
You'll know you've succeeded when:

✅ Your website runs in a container locally
✅ You can deploy to local Kubernetes
✅ Crossplane provisions cloud infrastructure
✅ Your website is accessible from the internet
✅ You can explain each component's purpose
✅ You can tear down and rebuild the entire stack

Good luck! Remember: Google is your friend, error messages contain clues, and every DevOps engineer started exactly where you are now.

Phase 1 Enhanced - Now starts with Git repository setup, proper project structure, and version control basics
New Phase 4 - Completely dedicated to GitHub Actions CI/CD including:

Building and testing Docker images automatically
Pushing to container registries
Automated Kubernetes deployments
GitOps principles


New Phase 6 - Git workflow and collaboration covering:

Branching strategies
Pull request workflows
Branch protection rules
Git best practices


Additional Challenges - Updated to include Git-related tasks like PR automation and release management

This now gives you a complete DevOps workflow: code → commit → automated build → automated test → automated deploy → monitor!

Whenever you need to make changes to the website run these docker commands:

- Make your changes
- Rebuild the image: 
docker build -t jasmyn13/recipe-website:latest .
Push to Docker Hub: 
- docker push jasmyn13/recipe-website:latest
- Delete the pods to force Kubernetes to pull the new image
kubectl delete pods -l app=recipe-website

To push initially to Docker Hub:
- Login to Docker
docker login
- Tag the image based on your github username. Example:
docker tag recipe-website:latest jasmyn13/recipe-website:latest 
- Push the image to DockerHub. Example:
docker push jasmyn13/recipe-website:latest

Note: If you want to use the DockerHub image you pushed add that image to your deployment.yaml file as shown below:

 spec:
      containers:
      - name: recipe-website
        image: jasmyn13/recipe-website:latest