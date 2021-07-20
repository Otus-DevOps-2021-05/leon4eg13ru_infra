# leon4eg13ru_infra
leon4eg13ru Infra repository

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

testapp_IP = 178.154.253.251
testapp_port = 9292

Запуск автоматического деплоя приложения с помощью команды:

./deploy_redditapp.sh

## HW_8

- Создан ansible playbook
- Cоздан и заполнен файл inventory
- Создан файл локальной конфигурации ansible.cfg
- Создан bash-скрипт, создающий inventory.json из файла состояния terraform.tfstate

Для выполнения скрипта необходимо установить настроить S3cmd (консольный клиент для сервисов,
поддерживающими HTTP API Amazon S3) и JQ, обработчик JSON-файлов
