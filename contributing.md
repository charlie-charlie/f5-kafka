# General guidelines

- Create a new branch from _master_
- Make sure to properly format the code by running ```terraform fmt``` before committing, if using VSCode you can configure the [terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform) to do this when saving a file.
- Create/update the corresponding files on the _examples_ folder, make sure that ```terraform plan``` and ```terraform apply``` works.
- On the merge request describe what changed and why