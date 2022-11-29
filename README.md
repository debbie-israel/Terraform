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
```$ touch main.tf ```<br>
```$ nano main.tf ```<br>
```
variable "myvar"{
  type=string
  default="hello terraform"
}

variable "mymap"{
  type=map[string]
  default={
    mykey = "my value"
  }
}
```
<br><br>
```$ terraform console```<br>
```> var.myvar``` (it'll print "hello terraform")<br> 
```> var.mymap``` (it'll print tomap({"mykey" = "my value"}))<br> 



          

