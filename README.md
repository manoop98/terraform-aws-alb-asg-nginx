Internet
   |
   v
Application Load Balancer (Public Subnets)
   |
   v
Target Group (Port 8000)
   |
   v
Auto Scaling Group
   |
   v
EC2 Instances (Private Subnets)
   |
   v
Dockerized Nginx Web App
   |
   v
NAT Gateway (Outbound Only)
   |
   v
Internet (Docker Hub / Updates)


<img width="1536" height="1024" alt="ChatGPT Image Jan 5, 2026, 11_54_06 AM" src="https://github.com/user-attachments/assets/3ddb5254-f4f9-4705-a937-6c66687cfe82" />
