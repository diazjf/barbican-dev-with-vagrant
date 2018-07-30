# Setup VM for Openstack Barbican Development.

Steps:

1. Clone this repo

2. cd into it

3. Edit install.sh to your credentials
    * `git config --global user.name "<your_name>"`
    * `git config --global user.email "<your_email>"`
    * `git config --global --add gitreview.username "<your_username>"`

4. `vagrant up`[1]

5. `vagrant ssh`

6. `sudo systemctl status "devstack@*"` to check if services are running.

7. Patch the required service https://docs.openstack.org/devstack/latest/development.html#patching-a-service

[1] You will need to install vagrant.
See https://www.vagrantup.com/docs/installation/
