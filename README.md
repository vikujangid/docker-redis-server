# Redis Server Installation Using Docker on Ubuntu

This task involves setting up a basic Redis Server using Docker on a public IP, demonstrated on a new EC2 instance. Here's the process:

- Launch a new EC2 instance on the AWS Console using the Ubuntu 22 Server Image.
- Update Ubuntu using `sudo apt-get update`.
- Install Docker from the official website:
  ```
  sudo apt install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  apt-cache policy docker-ce
  sudo apt install docker-ce
  ```
- Create and navigate to a new folder:
  ```
  mkdir rserver && cd rserver
  ```
- Place both files from the repository, `Dockerfile` and `redis.conf`, in this folder.
- Build a Docker container image using the following command:
  ```
  docker build -t my-redis-server .
  ```
- Start the Docker container using the following command:
  ```
  docker run -d --network host -p 6379:6379 --name redis-server -it my-redis-server
  ```

Now, anyone can access this Redis server using your EC2 IP address and port `6379` if they have `redis-cli` installed on their system. For example:
```
redis-cli -h <your-ec2-ip-address> -p 6379
```
Also, please ensure that port 6379 is whitelisted in your inbound security group rules (AWS EC2 firewall).
