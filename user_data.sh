#!/bin/bash

dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

TOKEN=$(curl -X PUT \
  "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

HOSTNAME=$(hostname)

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Terraform AWS ALB Project</title>
</head>
<body>
    <h1>Terraform AWS VPC + ALB Project</h1>
    <h2>Application is running successfully</h2>
    <p>Hostname: $HOSTNAME</p>
    <p>Instance ID: $INSTANCE_ID</p>
</body>
</html>
EOF
