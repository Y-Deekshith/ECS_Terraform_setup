# resource "null_resource" "cluster" {
#   provisioner "file" {
#     source      = "Dockerfile"
#     destination = "/tmp/Dockerfile"
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("NVirginiaPC.pem")
#       host        = aws_instance.ec2.public_ip
#     }
#   }
#   provisioner "file" {
#     source      = "script.sh"
#     destination = "/tmp/script.sh"
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("NVirginiaPC.pem")
#       host        = aws_instance.ec2.public_ip
#     }
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod 777 /tmp/script.sh",
#       "/tmp/script.sh"
#     ]
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("NVirginiaPC.pem")
#       host        = aws_instance.ec2.public_ip
#     }
#   }
# }