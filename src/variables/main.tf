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

# A list is always ordered, it'll always return 1,2,3 and not 3,2,1 
# despite the order of insertion
variable "mylist"{
  type = list
  default = [1,2,3]
}

# A set contains unique values, consecuently [5,1,1,2] becomes [1,2,5],
#  it doesn`t keep the order but terraform will sort it
variable "myset"{
  type = set
  default = [1,2,3]
}

variable "mynumber"{
  type = number
  default = 3874
}

variable "myboolean"{
  type = bool
  default = true
}
