resource "aws_instance" "my_server" {
    ami           = "ami-0521cb2d60cfbb1a6"
    instance_type = "t3.micro"
    subnet_id     = aws_subnet.public_1.id
    security_groups = [aws_security_group.linkin_sg.id]
    user_data = <<-EOF
                #!/bin/bash
                # Update system
                sudo apt-get update -y
                sudo apt-get upgrade -y

                # Install prerequisites
                sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

                # Add Docker GPG key
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

                # Add Docker repository
                echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

                # Install Docker Engine
                sudo apt-get update -y
                sudo apt-get install -y docker-ce docker-ce-cli containerd.io

                # Add ubuntu user to docker group to run without sudo
                sudo usermod -aG docker ubuntu
                sudo usermod -aG docker ssm-user

                # Enable and start Docker
                sudo systemctl enable docker.service
                sudo systemctl start docker.service  
                sudo apt install -y nginx
                
                sudo touch /etc/nginx/sites-available/linkin

                sudo ln -sf /etc/nginx/sites-available/linkin /etc/nginx/sites-enabled/
                sudo rm -f /etc/nginx/sites-enabled/default
                
                sudo nginx -t && sudo systemctl reload nginx

                EOF
}
resource "aws_eip" "serverIP" {
    instance = aws_instance.my_server.id
}
resource "aws_eip_association" "eip_assoc" {
    instance_id   = aws_instance.my_server.id
    allocation_id = aws_eip.serverIP.id
}