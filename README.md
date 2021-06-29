##leon4eg13ru Infra repository

###Задание №3 Знакомство с облачной инфраструктурой фраструктурой Yandex.Cloud

bastion_IP = 178.154.254.222
someinternalhost_IP = 10.128.0.22

для подключения из консоли при помощи команды вида "ssh someinternalhost" из
локальной консоли рабочего устройства необходимо внести в файл "~/.ssh/config"
следующие строчки:
     
	Host someinternalhost
        HostName 10.128.0.22
        User appuser
        IdentityFile /home/leon4eg/.ssh/appuser
        ProxyJump bastion
	Host bastion
        HostName 178.154.254.222
        User appuser
        IdentityFile /home/leon4eg/.ssh/appuser

###Задание №4 Деплой тестового приложения

Адрес тестового приложения

    testapp_IP = 178.154.253.251
    testapp_port = 9292

Запуск автоматического деплоя приложения с помощью команды:

`$ ./deploy_redditapp.sh`

###Задание №5 Сборка образов VM при помощи Packer

- Параметризированы опции шаблона
```json
"service_account_key_file": "{{user `key_file`}}",
"folder_id": "{{user `folder_id`}}",
"source_image_family": "{{user `source_image`}}",
"image_family": "{{user `image_family`}}",
"ssh_username": "{{user `ssh_username`}}"
```
- Добавлены опции билдера
```json
"instance_cores": 2,
"instance_mem_gb": 2,
"disk_size_gb": 10,`
```
- Создан шаблон immutable.json для построения bake-образа
 + Для запуска сборки образа: 
`packer build -varfile=packer/variables.json packer/immutable.json`
- Выполнена автоматизация создания ВМ с рабочим приложением в сценарии create-reddit-vm.sh
 + Для запуска виртуальной машины:
 `./config-scripts/create-reddit-vm.sh`
