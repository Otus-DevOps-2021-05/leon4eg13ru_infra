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

## HW_8

- Создан ansible playbook
- Cоздан и заполнен файл inventory
- Создан файл локальной конфигурации ansible.cfg
- Создан bash-скрипт, создающий inventory.json из файла состояния terraform.tfstate

Для выполнения скрипта необходимо установить настроить S3cmd (консольный клиент для сервисов,
поддерживающими HTTP API Amazon S3) и JQ, обработчик JSON-файлов

## HW_9

- Созданы отдельные плейбуки для настройки окружения и деплоя приложения
- Создан файл диномической инвенторизации inventory.sh и интегрирован в конфигурацию ansible
- созданы плейбуки для packer для настройки образов приложения

## HW_10

- создана роль для базы данных и деплоя приложения
- настроены prod и stage окружения ansible
- Добавлена и настроена коммьюнити-роль jdauphant.nginx
- Добавлено в конфигурацию Terraform открытие 80 порта для инстанса приложения
- Создан файл vault.key и зашифрованы credentials пользователей для prod и stage окружений
- Созданы динамические инвентори для prod и stage окружений

## HW_11

- создана Vagrantfile файл и описана инфраструктура в нем
- доработаны роли db и app
- добавлен playbook с установкой python
- выполнена параметризация ролей
- установлен и настроен инструмент molecule для тестирование роли db
