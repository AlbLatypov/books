# Chapter_1_Getting_Started_with_Ansible

>If the admins at these companies wanted to set up a __new server exactly__ like one that is currently
running, they would need to spend a good deal of time going through all of the installed packages,
documenting configurations, versions, and settings; and __they would spend a lot of unnecessary time
manually reinstalling, updating, and tweaking__ everything to get the new server to run close to how
the old server did.

>__Idempotence__ is the ability to run an operation which produces the same result whether
run once or multiple times

>__Installing__
pip install ansible
>__Debian/Ubuntu:__
The easiest way to install Ansible on a Debian or Ubuntu system is to use the official apt package.
>
>apt-add-repository -y ppa:ansible/ansible
>apt-get update
>apt-get install -y ansible

> __Inventory_path__
/etc/ansible/hosts

>Ansible assumes you’re using passwordless (key-based) login for SSH (e.g. you login by
entering ssh username@example.com and don’t have to type a password). If you’re still
logging into your remote servers with a username and password, or if you need a primer
on Linux remote authentication and security best practices, please read Chapter 10 - Server
Security and Ansible. If you insist on using passwords, add the --ask-pass (-k) flag to
Ansible commands, but this entire book is written assuming passwordless authentication,
so you’ll need to keep this in mind every time you run a command or playbook.

>__first AD-HOCs__
ansible example -a "free -m" -u [username]
ansible example -m ping -u [username]
ansible multi -a "date"
