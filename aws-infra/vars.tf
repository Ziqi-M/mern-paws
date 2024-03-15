variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "us-west-1"
}

variable "AMI" {
  type        = string
  description = "buntu Server 22.04 LTS (HVM), SSD Volume Type (64-bit (x86))"
  default     = "ami-0a0409af1cb831414"
}

variable "INSTANCE_TYPE" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "MONGO_URI" {
  type        = string
  description = "MongoDB URI"
}

variable "GITHUB_REPO_URI" {
  type        = string
  description = "GitHub repository URI"
  default     = "https://github.com/Ziqi-M/mern-paws.git"
}

variable "APP_FOLDER_NAME" {
  type        = string
  description = "Name of the folder where the app is located"
  default     = "mern-paws"
}

variable "NODE_LOCAL_PORT" {
  type        = number
  description = "Local port where the app is running"
  default     = 6868
}

variable "NODE_DOCKER_PORT" {
  type        = number
  description = "Docker port where the app is running"
  default     = 8181
}

variable "CLIENT_ORIGIN" {
  type        = string
  description = "Client origin"
  default     = "http://54.193.206.20:8181"
}

variable "VITE_API_BASE_URL" {
  type        = string
  description = "VITE API base URL"
  default     = "http://54.193.206.20:6868/api"
}

variable "REACT_LOCAL_PORT" {
  type        = number
  description = "Local port where the React app is running"
  default     = 8181
}

variable "REACT_DOCKER_PORT" {
  type        = number
  description = "Docker port where the React app is running"
  default     = 80
}

variable "EIP_ALLOCATION_ID" {
  type        = string
  description = "Elastic IP allocation ID"
  default     = "eipalloc-012ea7be2a490ca25"
}

variable "VITE_FIREBASE_API_KEY" {
  type        = string
  description = "VITE_FIREBASE_API_KEY"
}

variable "JWT_SECRET" {
  type        = string
  description = "JWT secret"
}