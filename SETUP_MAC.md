# Terraform Setup Guide for Mac

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation and Setup](#installation-and-setup)
  - [Step 0: Install VS Code (Amazon SelfService)](#step-0-install-vs-code-amazon-selfservice)
  - [Step 1: Install Homebrew](#step-1-install-homebrew-if-not-already-installed)
  - [Step 2: Install AWS CLI](#step-2-install-aws-cli-skip-if-already-configured)
  - [Step 3: Install Terraform](#step-3-install-terraform)
  - [Step 4: Install tfenv (Terraform Version Manager)](#step-4-install-tfenv-terraform-version-manager)
  - [Step 5: Install the HashiCorp Terraform extension for VS Code](#step-5-install-the-hashicorp-terraform-extension-for-vs-code)
  - [Step 6: Set Up Zsh Aliases](#step-6-set-up-zsh-aliases)
- [Working with Terraform Projects](#working-with-terraform-projects)
  - [Step 6A: Use Existing Terraform Project](#step-6a-use-existing-terraform-project)
  - [Step 6B: Create New Terraform Project](#step-6b-create-new-terraform-project)
  - [Step 7: Configure AWS Credentials](#step-7-configure-aws-credentials)
  - [Step 8: Initialize and Deploy Resources](#step-8-initialize-and-deploy-resources)
  - [Step 9: Destroy Resources (Optional)](#step-9-destroy-resources-optional)
- [Done!](#done)

---

## Prerequisites

Ensure you have the following installed on your Mac:

- VS Code (Amazon SelfService)
- [Homebrew](https://brew.sh/)
- AWS CLI
- Terraform

> **Note:** If you already have AWS CLI and Brew installed, you can skip steps 1 and 2.

---

## Step 1: Install Homebrew (if not already installed)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## ATENTION
# At the end of installing brew, you will see commands to ADD Homebrew TO PATH: RUN THEM!
brew --version
```

## Step 2: Install AWS CLI (Skip if already configured)

```sh
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

Verify installation path and version:

```sh
which aws
aws --version
```

More information to use the AWS CLI: [https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-environment](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-environment)

## Step 3: Install Terraform

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Verify the installation:

```sh
terraform -version
```

## Step 4: Install tfenv (Terraform Version Manager)
This Tools helps you manage multiple versions of Terraform locally. 
```sh
brew unlink terraform 
brew install tfenv
```

Verify installation:

```sh
tfenv --version
```

### Using tfenv to Manage Terraform Versions

List available Terraform versions:

```sh
tfenv list-remote
```

Install a specific Terraform version:

```sh
tfenv install 1.10.5  # Replace with desired version
```

Use a specific Terraform version:

```sh
tfenv use 1.10.5  # Replace with installed version
```

Verify the current Terraform version:

```sh
tfenv list
terraform -version
```

🚀 **Tip:** Use `tfenv` to switch between different Terraform versions easily.


## Step 5: Install the HashiCorp Terraform extension for VS Code

To enhance Terraform development in VS Code, install the [HashiCorp Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform):

1. Open **VS Code**.
2. Go to **Extensions** (Ctrl+Shift+X or Cmd+Shift+X on Mac).
3. Search for "HashiCorp Terraform".
4. Click **Install**.
5. Restart VS Code if necessary.

## Step 6: Set Up Zsh Aliases

To improve efficiency, add aliases for common Terraform commands in Zsh.

### Add aliases to `~/.zshrc`

```sh
echo 'alias tf="terraform"' >> ~/.zshrc
```

### Apply the changes

```sh
source ~/.zshrc
```
### Verify the alias
```sh
tf --version # should show you the terraform version
```

Now, you can run Terraform commands faster, e.g., `tf plan` instead of `terraform plan`.

# Working with Terraform Projects
## Step 6A: Use existing Terraform project

### Open a terminal in VS Code Project Directory `Demo-Terraform-hands-on`

Verify all the existing folders and files with command `ls`
```sh
~ Demo-Terraform-hands-on % ls
SETUP.md        tf-01-basics    tf-02-modules   tf-03-advanced
```

### Move to the first project

```sh
cd tf-01-basics
```

Follow the `README.md` for this project to learn how to run this example.


## Step 6B: Create New Terraform Project

### Create a Project Directory

```sh
mkdir terraform-project
cd terraform-project
```

### Create a Terraform Configuration File

Create a file named `providers.tf`:

Edit `providers.tf` and add:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Management = "Terraform"
    }
  }
}
```

Create a file named `main.tf`, this is where you will add all your terraform code.

```sh
touch main.tf
```

## Step 7: Configure AWS credentials:

Open a terminal window (CMD + Space and type 'Terminal') or open a new terminal in your favourite IDE (eg. Visual Studio Code).

In VS Code -> Open folder `terraform-project -> New Terminal`

Go to your Isengard account and copy the bash/zsh temporary credentials from your account:

Provide:

```sh
export ISENGARD_PRODUCTION_ACCOUNT=false
export AWS_ACCESS_KEY_ID=<your-aws-access-key>
export AWS_SECRET_ACCESS_KEY=<your-aws-secret-key>
export AWS_SESSION_TOKEN=<your-session-token>
```

Now you have an active session to AWS account for 1h, anytime it expires, make sure to copy the credentials into the terminal again.

## Step 8: Initialize and Deploy Resources

Initialize Terraform:

```sh
terraform init
```

Format Terraform files:

```sh
terraform fmt
```

Validate the configuration:

```sh
terraform validate
```

Plan the deployment:

```sh
terraform plan
```

Apply the configuration:

```sh
terraform apply
```

Type `yes` when prompted.

For Auto-Approval:

```sh
terraform apply --auto-approve
```

---

## Step 9: Destroy Resources (Optional)

To delete the created resources:

```sh
terraform destroy
```

Type `yes` when prompted.

For Auto-Approval:

```sh
terraform destroy --auto-approve
```

⚠️ **Warning:** Deleting resources with `terraform destroy` is irreversible.


## Done!

You have successfully set up Terraform on your Mac, connected to AWS, and deployed an S3 bucket!
