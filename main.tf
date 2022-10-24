provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    
    filter {
        name = "owner-alias"
        values = ["amazon"]
    }

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }

    owners = ["amazon"]
}

resource "aws_instance" "server" {
    ami             = data.aws_ami.amazon_linux.id
    instance_type   = "t2.micro"
    key_name        = var.ssh_key_pair_name
}
