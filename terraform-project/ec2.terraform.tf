

# Create Linux EC2 Instance
resource "aws_instance" "movie_app_instance" {
  ami           = "ami-0d0f28110d16ee7d6"  # Linux AMI
  instance_type = "t2.micro"
  key_name      = "mariaDB_server_key"      # KeyPair
  subnet_id     = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.lamar_test_sg.id]

  user_data = templatefile("${path.module}/movie_app_bootstrap.sh", {})

  tags = {
    Name = "LamarMovieApp"
  }

}

