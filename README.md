Init

First of all, you should clone this repo to your local machine. I have provided modules  to create an ec2 instance with all the network settings. After, go to the example and run the following commands:

$ terraform init
This command will init everything to provision module(s).

Plan
When you set terraform init you will be able to see which services are going to create with the next command:

$ terraform plan


Validate
The terraform validate command validates the configuration files in a directory

$terraform validate


Apply
To apply your stack, you can use:

$ terraform apply


Destroy
To terminate the stack, use:

$ terraform destroy

