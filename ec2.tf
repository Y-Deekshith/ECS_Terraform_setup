# resource "aws_instance" "ec2" {
#   ami                         = var.imagename
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.public_subnets[1].id
#   vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name = "${var.name}-ec2"
#     Env  = var.env
#   }
# }