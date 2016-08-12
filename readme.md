docker build -t hello-world .
docker save hello | gzip > hello-world-image.tar.gz

tar -zcvf hello-world-deploy.tar.gz hello-world-image.tar.gz scripts appspec.yml


tar -zxf hello-world-deploy.tar.gz -C /tmp

push revision

zip hello-world-deploy.zip scripts/* appspec.yml *image.tar.gz

ssh -i /projects/notes/dedicatted/aws/common.pem ec2-user@52.207.137.186

sudo yum update

aws configure

aws ecr describe-repositories

# install codedeploy


http://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-run-agent-install.html?shortFooter=true

sudo yum install ruby
sudo yum install wget
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status

# install docker

sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
# login/logout
docker info

