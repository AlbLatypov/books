# Скрипты. Полезное

### Автодополнение Bash

Ставим пакет bash-completion:

`# apt-get install bash-completion`

Настраиваем свой ~/.bashrc, добавив в него следующие строчки:
```bash
if [ -f /etc/bash_completion ]
then
  . /etc/bash_completion
fi
complete -cf sudo
```
<br>

### Вывод без комментариев и пустых строк
`cat ssh_config | awk '!/^#/' | grep -v '^\s*$'`

<br>

### STDIN в py
``` python
#!/usr/bin/python3

import sys

for line in sys.stdin:
    processed_line = line.strip().upper()
    print(processed_line)
```
<br>

### Задача. Найти сумму чисел вывода ls -l | grep -v '^d'

##### python

``` python
import sys
lst=[]
count=0
for line in sys.stdin:
    lst = line.upper().split()
    if len(lst)>2:
        a,b,c,d,e,*other = lst
        count+=int(e)
print(count)
```

##### Решение awk

`ls -la | awk '{sum+=$5} END {print sum}'`

<br>

### Однострочник. Цикл. Выполнить команду.

`for i in {1..5}; do touch "task$i.py"; done`

<br>

### Скачать скрипт из Google Drive

Если просто скачать файл по идентификатору, он прилетает модифицированным. Нашел решение:

```bash
#!/bin/bash
echo "python 3 installing...---------------------------------------"
sudo yum -y install python3

echo "Create env...------------------------------------------------"
python3 -m venv venv

echo "Activate env...-----------------------------------------------"
source venv/bin/activate

echo "Installing gdown...-------------------------------------------"
pip install gdown

echo "Get script:...------------------------------------------------"
gdown --id 1MQgkNUZqu-ts7SYgbbv2A7AN4f_MfQHu -O install_docker.sh

echo "Chmod 755-----------------------------------------------------"
chmod 755 install_docker.sh

echo "Start installing docker....."
sh install_docker.sh

echo "Check version....---------------------------------------------"
docker -v

echo "Check systemctl status docker. Start if nesse..."

```
<br>

### Docker installing

```bash
#!/bin/bash
echo "Attempt to install Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
```
### Docker postinstalling
```bash
#! /bin/bash
sudo usermod -aG docker $(whoami)
sudo systemctl start docker && sudo systemctl enable docke
```

### Docker uninstall

```bash
#!/bin/bash
#sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo yum remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

### Disable root login SSH via bash script

[show script](dis_root_login_ssh.sh)

### Поиск файлов find c условиями скриптом
```bash
#!/bin/bash

# Поиск файлов, принадлежащих пользователю javed в каталоге /user/data
# maxdepth - глубина, значит только в этом каталоге
files=$(find /user/data -maxdepth 1 -type f -user javed)

# Копирование найденных файлов в каталог /blog, сохраняя атрибуты владельца
for file in $files; do
  cp -p --preserve=ownership "$file" /blog/
done
```

### Анализ системы. 
[show script](beholder.sh)

>TODO: структурировать
