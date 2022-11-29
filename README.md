# Terraform
Use Terraform to provision infrastructure on AWS
<!--<img src="src/assets/img/terraform-registry.gif" width="44%"/> -->
<img src="src/assets/img/terraform.svg" width="20%"/> <br>

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
  Step 2. Download zip file for your operating system & install<br>
For linux:<br>
```$ mkdir Terraform```<br>
```$ cd Terraform```<br>
```$ git clone https://github.com/wardviaene/devops-box.git``` (this will have things to install Ansible & Terraform)<br>
```$ cd devops-box/```<br>
```$ cd scripts```<br>
```$ chmod u+x install.sh``` (to add permissions)<br>
```$ sudo ./install.sh```<br>
```$ terraform version``` (to check wether it is installed correctly)<br>

## Terraform HCL
HashiCorp Confiuration Language - Understanding the terraform syntax<br>
```$ mkdir terraform-test```<br>
```$ cd terraform-test```<br>
```$ touch main.tf ```<br>
```$ nano main.tf ```<br>
```
variable "myvar"{
  type=string
  default="hello terraform"
}
```
<br><br>
```$ terraform console```<br>
```> var.myvar``` (it'll print "hello terraform")<br> 


          

