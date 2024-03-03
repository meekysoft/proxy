# Basic HTTP Proxy

This repo contains a set of Terraform Modules that results in an HTTP Proxy which can be used to relay services hosted on your home network to the public, without disclosing your home IP address.

The Proxy server itself runs on EC2 using Nginx, and several dedicataed (free-of-charge) network resources are created to support this (to avoid interference/conflicts with existing network configurations you may have) - specifically...

- A VPC
- A Public Subnet (with Internet Gateway)
- A Security Group

## Setup

A one-time setup is required to equip your local machine with Terraform and credentials for managing resources in your AWS account - once this is done you can create/delete the Proxy whenever you need it, which takes a few seconds to complete.

- Install Terraform by following the simple instructions [here](https://developer.hashicorp.com/terraform/install).
- Log into your AWS account and create an "IAM User" (search for the "IAM" service using the search box at the top of the page)
  - Name the user whatever you like - "terraform" is probably a good choice.
  - Don't bother ticking the box that grants the user access to the console.
  - When asked to "Set Permissions" choose "Attach Policies Directly".
  - Use the search box to locate the `AdministratorAccess` policy, tick it, and click the "Next" button.
  - Click "Create User" on the review page.
- Create and download credentials for the user you just created following these steps...
  - Click on the user you just created.
  - Click on the "Security Credentials" tab.
  - Locate the panel that reads "Access keys", and click "Create access key".
  - In the "Use case" list, tick "Command Line Interface (CLI)" and tick the "Confirmation" tick-box at the bottom before clicking "Next".
  - Set an optional tag if you want, and click "Create access key".
  - Click "Download .csv file", before clicking "Done".
- Optionally re-locate the `terraform_accessKeys.csv` file that should now be sat in your "Downloads" folder to keep it safe. NOTE: never share this file with anyone - if you do by accident, delete the access key in via IAM in the AWS console (you can always create a new one).

## Configuration

- Create a folder somewhere convenient, and copy the [main.tf](./main.tf) file into it
- Make a few edits to your copy of the `main.tf` file as described in its comments, and marked with a `<- CHANGE THIS`

## Usage

Open a windows terminal (`cmd`) and `cd` into the folder where you placed `main.tf`

Initialise Terraform - you only need to do this the first time you run terraform...

```
terrform init
```

To deploy your Proxy run...

```
terraform apply -auto-approve
```

To delete your Proxy run...

```
terraform destroy -auto-approve
```
