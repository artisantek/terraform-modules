# TERRAFORM MODULES

A Terraform module is a collection of standard configuration files in a dedicated directory. Terraform modules encapsulate groups of resources dedicated to one task, reducing the amount of code you have to develop for similar infrastructure components.

### Root Module:
Every terraform configuration has at least one module, known as root module. It consists of the resources defined in the .tf files in the main working directory

### Child Module:
A terraform module can call other modules to include their resources into the configuration. A module that has been called by another module is often referred to as a child module.

## How To Use Terraform Modules
To use a Terraform module, create a module block and provide the appropriate variable values

##### Example:
&nbsp; 
``` 
module "<module-name>" {
 source  = "<module-path>"
 version = "<module-version>"
 
 argument_1                     = var.variable_1
 argument_2                     = var.variable_2
 argument_3                     = var.variable_3
}
```

#### Sources
Terraforms modules can be stored either locally or remotely. The `source` argument will change depending on their location.

#### Versions
Versioning enables you to control what module changes should be introduced into your infrastructure.
