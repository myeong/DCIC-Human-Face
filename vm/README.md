Human Face of Big Data - Development Environment
==========
Myeong Lee (myeong@umd.edu)
---------

This folder has a Vagrantfile and Ansible scripts that automatically install PHP, PostgreSQL, Git, Apache, and other needed packages on Ubuntu Trusty for developing a Human Face of Big Data platform. If you see any problems, contact Myeong Lee. 

# Requirements
	- Virtualbox 5.1.6
	- Vagrant 1.8.6
	- Ansible 2.1.x (only for Mac or Linux. On Windows, you cannot run Ansible.)
	- Python (2.x)

# Quickstart

1. Launch and configure the virtual machine by running the following command
For Windows user,
	```
	cd vm/windows 	# Go to the folder where Vagrantfile and other configuration files are located.
	vagrant up		# Run the Vagrantfile.
	```
For Mac user,
	```
	cd vm/mac 	# Go to the folder where Vagrantfile and other configuration files are located.
	vagrant up		# Run the Vagrantfile.
	```
2. Open browser and go to location `http://192.168.33.12`

If the URL does not work check `vm/basic/Vagrantfile` and check file Vagrant configuration.
