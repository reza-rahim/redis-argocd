Over the past few days, I have been reviewing the current Terraform implementation and have identified several areas for improvement—particularly in how it handles Redis cluster upgrades.

Currently, the scripts lack robust support for rolling upgrades, which are essential when scaling the cluster either vertically (increasing VM size) or horizontally (increasing the number of VMs). This limitation poses risks to availability and reliability during upgrade cycles.

We also need to streamline the transition from Terraform to Ansible, ensuring a smooth handoff between infrastructure provisioning and configuration management.

Additionally, we should assess how regular OS patching is being automated and explore the development or enhancement of an Ansible playbook for this purpose.

Finally, it's important to evaluate how our CI/CD tools—such as Jenkins and Bitbucket—can be better integrated with both Terraform and Ansible to enable a more automated and reliable deployment pipeline.
