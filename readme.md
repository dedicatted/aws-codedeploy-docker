# configuration

* create .env file from .env.template
* run ./build.sh

# configure CodeDeploy instance

## codedeploy agent
 

http://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-run-agent-install.html?shortFooter=true

sudo yum install ruby
sudo yum install wget
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status

## install docker

sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
docker info

