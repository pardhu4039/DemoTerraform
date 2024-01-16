Init
First of all, you should clone this repo to your local machine. I provided modules with simple examples. After, go to needed example and run the next command:

$ terraform init
This command will init everything to provision module(s).

Plan
When you set terraform init you will be able to see which services are going to create with the next command:

$ terraform plan
If you're using tfvars, you can run the following command:

$ terraform plan -var-file terraform.tfvars
It's a good point to use tfvars for multiple environments, - as example.

Apply
To apply your stack, you can use:

$ terraform apply
Or:

$ terraform apply -var-file terraform.tfvars
Also, you can use -auto-approve command to automatically apply the stack.

Destroy
To terminate the stack, use:

$ terraform destroy
Or:

 $ terraform destroy -var-file terraform.tfvars
Also, you can use -auto-approve command to automatically terminate the stack.
