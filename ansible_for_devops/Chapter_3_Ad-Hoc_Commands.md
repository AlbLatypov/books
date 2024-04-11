# Chapter_3_Ad-Hoc_Commands

>On any given day, a systems administrator has many tasks:
• Apply patches and updates via yum, apt, and other package managers.
• Check resource usage (disk space, memory, CPU, swap space, network).
• Check log files.
• Manage system users and groups.
• Manage DNS settings, hosts files, etc.
• Copy files to and from servers.
• Deploy applications or run application maintenance.
• Reboot servers.
• Manage cron jobs.

>__Inventory file for multiple servers__
There are many ways you can tell Ansible about the servers you manage, but the most standard,
and simplest, is to add them to your system’s main Ansible inventory file, which is located at
/etc/ansible/hosts. If you didn’t create the file in the previous chapter, go ahead and create the
file now; make sure your user account has read permissions for the file.

>Iam use YAML, examples not... page 16

>By default, Ansible will run your __commands in parallel, using multiple process forks__, so the
command will complete more quickly. If you’re managing a few servers, this may not be much
quicker than running the command serially, on one server after the other, but even managing 5-
10 servers, you’ll notice a dramatic speedup if you use Ansible’s parallelism (which is enabled by
default).

>Run the same command again, but this time, add the argument __-f 1__ to tell Ansible to use only one fork. Run the same command over and over again, and it will always return results in the __same order__
>ansible multi -a "hostname" __-f 1__

>__some examples__
ansible app -s -a "service ntpd restart" --limit "192.168.60.4"
ansible app -s -m group -a "name=admin state=present"
ansible app -s -m user -a "name=johndoe group=admin createhome=yes"
ansible app -s -m user -a "name=johndoe state=absent remove=yes"

>__Get file info__
ansible multi -m stat -a "path=/etc/environment"

>__Copy files__
ansible multi -m copy -a "src=/etc/hosts dest=/tmp/hosts"

>__Retrieve file__
ansible multi -s -m fetch -a "src=/etc/hosts dest=/tmp"

>__Create directories and files__
ansible multi -m file -a "dest=/tmp/test mode=644 state=directory"
state could be link, absent etc

>__Update servers asynchronously, monitoring progress__
ansible multi -s -B 3600 -a "yum -y update"
background launch...

>__Check log files__
Sometimes, when debugging application errors, or diagnosing outages or other problems, you need
to check server log files. Any common log file operation (like using tail, cat, grep, etc.) works
through the ansible command, with a few caveats:
>1. Operations that continuously monitor a file, like __tail -f, won’t work via Ansible__, because
Ansible only displays output after the operation is complete, and you won’t be able to send
the Control-C command to stop following the file. Someday, the async module might have
this feature, but for now, it’s not possible.
>2. It’s not a good idea to run a command that returns a huge amount of data via stdout via
Ansible. If you’re going to cat a file larger than a few KB, you should probably log into the
server(s) individually.
>3. If you redirect and filter output from a command run via Ansible, you need to use the shell
module instead of Ansible’s default command module (add -m shell to your commands).
As a simple example, let’s view the last few lines of the messages log file on each of our servers:
__ansible multi -s -a "tail /var/log/messages"__

>page 31 to continue
