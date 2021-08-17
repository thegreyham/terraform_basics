# Basic Terraform Setup (IaC)

This repo shows you how to provision a basic ec2 instance running a webserver that you navigate too all using Terraform (IaC)

Before you get started you will need to have the following installed
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/) 

We are going to assume that you have an AWS Account already. Everything we do here will be within the free tier

## Step 1.
Run ```aws configure```
Enter your access keys and secret access keys for your IAM user. Details [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

## Step 2.
Clone the repo

## Step 3.
Edit the terraform.tfvars file with your variables.
Required changes are
- keypair. (Set this to a keypair that you already have access too, or just create a new one, we can actually get terraform to provision one but thats for a later date)
- creds_path (Set this to where your aws credentials file is located after you completed step 1.)
- my_IP (Set this to your current IP Address of your computer, we set up the security group to only allow our IP to access the resources) Otherwise it defaults to all the internet
- set AMI to one in your region if you're not using the us-east-1
Other changes
- Set the region and availability zone to suit where you want to provision the resources

## Step 4. 
Run ```terraform init```
This will initialize the terraform provider and install the necessary packages for it to interact with aws.

## Step 5.
Run ```terraform plan```
This will do a dry run and print out everything that terraform will provision

## Step 6. 
Run ``` terraform apply```
This will check to ensure it can perform all the actions and then prompt you for approval. Type ```yes```
Once complete (It may take up to 1 minute) it will output an IP Address

## Step 7.
Give it a minute and navigate to the IP Address. You should see that we can see it.
Feel free to navigate through the AWS Console to see all the resources that terraform created. Each item that is created is tagged with the "Provisioned": "Terraform" Tag. We do this to ensure we can track everything that is automatically generated. 

## Step 8.
Delete all the resource with ```terraform destroy```
This will remove all the resource terraform created.

That's the basics.