resource "aws_instance" "ansible-machine" {
  # Creates three identical aws ec2 instances
  count = 3     
  
# All three instances will have the same ami and instance_type

  ami = lookup(var.ec2_ami,var.region) 
  instance_type = var.instance_type # 
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "ansible-machine-0${count.index}"
  }
}