resource "aws_instance" "servers" {
  count = length(var.subnets)

  ami           = "${var.ubuntu-22-ami}"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnets[count.index].id
  associate_public_ip_address = true
  key_name = "${var.ssh_key}"
  vpc_security_group_ids = ["${aws_security_group.server_sg.id}"]

  tags = {
    Name = "server-${count.index + 1}"
  }
}

resource "local_file" "ip_address_to_ansible_inventory" {
  filename = "ansible/inventory"
  content = <<EOF
${join("\n", aws_instance.servers.*.public_ip)}
EOF
}
