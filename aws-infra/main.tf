provider "aws" {
  region = var.AWS_REGION
}

data "aws_eip" "existing_eip" {
  id = var.EIP_ALLOCATION_ID
}

resource "aws_instance" "app_server" {
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y

                sudo apt install docker.io -y
                docker --version
                sudo apt install docker-compose -y
                docker-compose --version
                sudo service docker start

                cd /home/ubuntu
                git clone ${var.GITHUB_REPO_URI}
                
                cd /home/ubuntu/${var.APP_FOLDER_NAME}
                echo "MONGO_URI=${var.MONGO_URI}" > .env
                echo "NODE_LOCAL_PORT=${var.NODE_LOCAL_PORT}" >> .env
                echo "NODE_DOCKER_PORT=${var.NODE_DOCKER_PORT}" >> .env
                echo "CLIENT_ORIGIN=${var.CLIENT_ORIGIN}" >> .env
                echo "VITE_API_BASE_URL=${var.VITE_API_BASE_URL}" >> .env
                echo "VITE_FIREBASE_API_KEY=${var.VITE_FIREBASE_API_KEY}" >> .env
                echo "JWT_SECRET=${var.JWT_SECRET}" >> .env
                echo "REACT_LOCAL_PORT=${var.REACT_LOCAL_PORT}" >> .env
                echo "REACT_DOCKER_PORT=${var.REACT_DOCKER_PORT}" >> .env
                sudo docker-compose build
                sudo docker-compose up

                EOF
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.app_server.id
  allocation_id = data.aws_eip.existing_eip.id
}

resource "aws_security_group" "app_sg" {
  name = "app_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8181
    to_port     = 8181
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6868
    to_port     = 6868
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}