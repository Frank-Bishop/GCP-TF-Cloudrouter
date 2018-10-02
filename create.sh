#/usr/local/bin/bash
conf_file=variables.tf
template_file=variables.template
allowed_subnets="1-5"
# File operations for warm up

    rm -rf $conf_file
    cp variables.template $conf_file
    echo "" >> $conf_file
# VPCN name question
read -p "What will be the VPC name (Name - only lowercase or fail..)?  ": vpcanswer; echo "Your choice was: $vpcanswer"
    echo ""
    echo "variable \"vpc_name\" { default = \"$vpcanswer\" }" >> $conf_file

read -p "How many subnet do you need? $allowed_subnets ": subnetcount; echo "Your choice was: $subnetcount"

subnetcount="$(echo ${subnetcount} | tr -dc '0-9')"

if [ "$subnetcount" == 1 ] || [ "$subnetcount" == 2 ] || [ "$subnetcount" == 3 ] || [ "$subnetcount" == 4 ] || [ "$subnetcount" == 5 ] ; then
#    echo "I am gladd you said $subnetcount"
    echo "I will create you $subnetcount number of subnets within the GCP!"    
    echo ""
    echo "variable \"subnet_count\" { default = \"$subnetcount\" }" >> $conf_file
    echo "Do you want to Terraform (PLAN) it to you (y/n))"

# Make sure what you are doing
    read -r -p "Are you sure? [Y/n]" response
	 response=${response,,} # tolower
	if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then

#run terraform plan to stdout
	    terraform plan
		echo "generating dependency graph.png"

#generate frash graph.png for you	
	    terraform graph | dot -Tpng > graph.png
	    echo "done."
	fi


    echo ""
    echo "Do you want to Terraform it to you (APPLY) ? (y/n))"

    read -r -p "Are you sure? [Y/n]" response
	 response=${response,,} # tolower
	if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then

#run terraform apply -auto-approve to stdout
		terraform apply -auto-approve
	fi

else
    echo "Wrong option, try some number $allowed_subnet"
fi