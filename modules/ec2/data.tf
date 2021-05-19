data "aws_ami" "amazon_available_ami" {
  most_recent = true
  //  This owner refer to the amazon owner id. We can extract it from this query:
  //  aws ec2 describe-images \
  // --owners amazon \
  // --filters "Name=name,Values=amzn2-ami-hvm-2.0.????????.?-x86_64-gp2" "Name=state,Values=available" \
  // --query "reverse(sort_by(Images, &Name))[:1].OwnerId" \
  // --output text \
  // --profile my-profile
  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????.?-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}