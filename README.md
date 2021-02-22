# Практикум. Модуль 21. Continuous Integration

## Задания по созданию окружения

### Задание 21.1
Разверните сервер с Jenkins CI и две дополнительные машины, которые будут эмулировать production и stating окружения.

### Задание 21.2
Используйте Ansible для создания деплоймента: все три машины должны разворачиваться на основе ansible playbook.

### Задание 21.3
На все машины установите Docker. На машине с Jenkins настройте Docker, чтобы контейнеры могли запускаться от имени пользователя Jenkins.

### Задание 21.4
Машина Jenkins CI должна уметь «ходить» по ssh от имени Jenkins на машины production и staging. Идеально, если добавление ключей к целевым машинам настроено уже в ansible playbook.

### Решение
Для выполнения данных задач создан anslible playbook, который:
- на локальной машине установит и настроит LXD;
- создаст три контейнера ci-jenkins, ci-staging, ci-production, эмулирующие инфраструктуру;
- установит docker во все контейнеры;
- сгенерирует ssh-ключ на ci-jenkins;
- установит jenkins в docker контейнер на ci-jenkins;
- создаст учетные записи jenkins и импортирует ssh-ключ на ci-staging, ci-production.

Внимание! данный playbook не добавляет на ci-jenkins ключи в known_hosts по причинам безопасности. 

Для использования выполните следующие действия:
1. скопировать данный репозиторий;
2. перейти в папку с репозиторием;
3. перейти в папку other;
4. выполнить команду ./run_deploy.sh
5. ввести пароль sudo.

## Задания по настройке Jenkins

### Задание 21.5, пункт 1
Настроить в Jenkins джоб (job): Запуск контейнера с WordPress на staging-машине.
Настройки и вывод приведены на скриншотах.
Для доступа к wordpress нужно перейти по адресу http://10.0.3.110/

![wordpress_staging_settings_1](.github/wordpress_staging_settings_1.png)
![wordpress_staging_settings_2](.github/wordpress_staging_settings_2.png)
![wordpress_staging_output](.github/wordpress_staging_output.png)

### Задание 21.5, пункт 2
Настроить в Jenkins джоб (job): Запуск контейнера с WordPress на production-машине
Настройки аналогичны предыдущему пункту, за исключением Host subset: нужно указать ci-production

![wordpress_production_output](.github/wordpress_production_output.png)

### Задание 21.5, пункт 3
Настроить в Jenkins джоб (job): Джоба с использованием планировщика, где раз в 5 минут скрипт проверяет, пингуются ли production и staging серверы.
Настройки и вывод приведены на скриншотах.

![ping_settings_1](.github/ping_settings_1.png)
![ping_settings_2](.github/ping_settings_2.png)
![ping_summary](.github/ping_summary.png)
![ping_output](.github/ping_output.png)

### Задание 21.5, пункт 4 
Настроить в Jenkins джоб (job): Джоба, которая выполняет получение данных uptime с production и staging.
Настройки аналогичны пункту 1, используется playbook_uptime.yml и не используется Host subset

![uptime_output](.github/uptime_output.png)

### Задание 21.5, пункт 5 
Настроить в Jenkins джоб (job): Джоба, которая выполняет перезагрузку production и staging с возможность выбора одной из них или всех сразу (build with params). 
Настройки и вывод приведены на скриншотах.

![reboot_settings_1](.github/reboot_settings_1.png)
![reboot_settings_2](.github/reboot_settings_2.png)
![reboot_parameter](.github/reboot_parameter.png)
![reboot_output](.github/reboot_output.png)
