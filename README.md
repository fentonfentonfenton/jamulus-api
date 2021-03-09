###

`git clone` this repo

`docker-compose up`

visit `0.0.0.0:4567/1` 

or

 `0.0.0.0:4567/2`

 in browser.


 PROFIT 

 this is a test

 second test
 
 #### Preparing an `aws-linux` EC2 Instance:
 
 ```
sudo yum update -y
sudo amazon-linux-extras install docker
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker
sudo curl -L https://github.com/docker/compose/releases/download/1.28.5/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
```
