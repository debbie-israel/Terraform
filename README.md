# Terraform
Use Terraform to provision infrastructure on AWS
<!--<img src="src/assets/img/terraform-registry.gif" width="44%"/> -->
<img src="src/assets/img/terraform.svg" width="20%"/> <br>
1. [What is Terraform?](#What-is-Terraform?)
2. [Installation](#Installation)
3. [Terraform HCL](#Terraform-HCL)
4. [HCL w AWS](#HCL-w-AWS)
5. [Add a running instance in AWS](#Add-a-running-instance-in-AWS)

## What is Terraform?
- Terraform allows you to write infrastructure as code:
  - In other words you can either go into the web console and you can just start launching some new instances manually
  - or you can do that in code, using Terraform.
- It's the automation of your infrastructure:
  - Terraform keeps your infrastructure in certain states,
  - It keeps compliant, makes your infrastructure auditable.
  - Think about a AWS, DigitalOcean, the Azure everything that has an API.
 
 ## Installation  
  Step 1. Go to: https://www.terraform.io/ <br>
  Step 2. Download zip file for your operating system <br>
  Step 3. Install, for linux: <br>
```$ mkdir Terraform```<br>
```$ cd Terraform```<br>
```$ git clone https://github.com/wardviaene/devops-box.git``` (this will have things to install like Ansible & Terraform)<br>
```$ cd devops-box/```<br>
```$ cd scripts```<br>
```$ chmod u+x install.sh``` (add required permissions)<br>
```$ sudo ./install.sh```<br>
 Step 4. Check wether it's installed correctly:
```$ terraform version``` <br>

## Terraform HCL
HashiCorp Confiuration Language - Understanding the terraform syntax<br>
We'll create & run our first ```.tf``` easily w the following not-so-many commands:<br>
```$ mkdir terraform-test```<br>
```$ cd terraform-test```<br>
```$ vim main.tf ```<br>
```
variable "myvar"{
  type=string
  default="hello terraform"
}

variable "mymap"{
  type = map(string)
  default = {
    mykey = "my value"
  }
}

variable "mylist"{
  type = list
  default = [1,2,3]
}
```


```$ terraform console```<br>
```> var.myvar```             (output: ```"hello terraform"```)<br> 
```> var.mymap```             (output: ```tomap({"mykey" = "my value"})```)<br> 
```> var.mymap["mykey"]```    (output: ```"my value"```)<br> 
```> var.mylist```            (output: ```tolist([1,2,3,])```)<br> 
```> var.mylist[0]```         (output: ```1```)<br> 
```> element(var.mylist,0)``` (output: ```1```)<br> 
Ctrl+D

## HCL w AWS
Here we'll see how a ```.tf``` looks like with AWS as the provider & with resources as well as with variables:<br>
```$ vim resource.tf```<br> 
```
provider "aws"{

}

variable "AWS_REGION"{
  type  = string
}

variable "AMIS"{
  type = map(string)
  default = {
    eu-west-1 = "my ami" 
  }
}

resource "aws_instance" "example"{
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
```


```$ vim terraform.tfvars```<br> 
```
AWS_REGION="eu-west-1"
```


Initialize backend & provider plugins * ```$ terraform init```<br> 
```$ terraform console```<br> 
```> var.AWS_REGION```<br> 
```> var.AMIS[var.AWS_REGION]```<br>

(\*) This should be done everytime you create a new directory

## Add a running instance in AWS
* Prerequisites:
  * Sign-on AWS: https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start/email
  * Log-in AWS: https://aws.amazon.com/ 
  * Create user with admin role: IAM > Users > Add users: with Programmatic access, Add user to group > save .csv with access key + secret key
  * Check the region you're located in
Steps:
Go to: https://cloud-images.ubuntu.com/locator/ec2/ & search eu-west-1 xenial, copy the AMI-ID of the first hvm:ebs-ssd instance type you see, for example: ami-0f29c8402f8cce65c<br>
```$ mkdir new-instance```<br> 
```$ vim instance.tf```<br>
```
provider "aws" {
  access_key = "YOUR ACCESS KEY HERE"
  secret_key = "YOUR SECRET KEY HERE"
  region     = "REGION YOU'RE LOCATED IN"
}

resource "aws_instance" "example" {
  ami           = "ami-0f29c8402f8cce65c"
  instance_type = "t3.micro"
}
```

```$ terraform init```<br> 
```$ terraform apply```<br> 
Goto AWS Console > EC2 > Instances. You'll see a new instance is running!
Now destroy it so that you don't have to pay for it: ```$ terraform destroy```<br> 







          

