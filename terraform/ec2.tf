data "aws_ami" "amzn2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  count                       = 2
  ami                         = data.aws_ami.amzn2.id
  instance_type               = var.web_instance_type
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.web.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  # Minimal bootstrap so ALB health checks pass. Ansible will take over later.
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd php
  systemctl enable httpd
  systemctl start httpd
  cat > /var/www/html/index.html <<'EOT'
  <!doctype html>
  <html><head><title>StreamLine Bootstrap</title></head>
  <body style="font-family:Arial;text-align:center;margin-top:50px">
    <h1>StreamLine - Terraform Bootstrap</h1>
    <p>If you see this, ALB and EC2 are working. Ansible will deploy the app next.</p>
  </body></html>
  EOT
  EOF

  tags = {
    Name = "${var.project_name}-web-${count.index + 1}"
  }
}
