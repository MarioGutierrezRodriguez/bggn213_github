Open an SSH client.
Locate your private key file. The key used to launch this instance is mariokey.pem
Run this command, if necessary, to ensure your key is not publicly viewable.
chmod 400 "mariokey.pem"
Connect to your instance using its Public DNS:
  ec2-52-13-104-215.us-west-2.compute.amazonaws.com

ssh -i "Downloads/mariokey.pem" ubuntu@ec2-52-13-104-215.us-west-2.compute.amazonaws.com

scp -r -i "~/Downloads/mariokey.pem" ubuntu@ec2-52-13-104-215.us-west-2.compute.amazonaws.com:~/*_quant .