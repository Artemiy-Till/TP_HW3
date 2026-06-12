HW3: Docker и Bash
Проект генерирует CSV-файл с данными и строит HTML-отчет по этим данным. Генератор и аналитик запускаются в разных Docker-контейнерах, а файлы сохраняются в локальной папке data/ на хосте.
Файлы проекта
generate.py - Python-скрипт, который создает data.csv.
Dockerfile - образ для генератора данных.
report.js - JavaScript-скрипт, который читает CSV и создает report.html.
package.json - зависимости для аналитика.
Dockerfile.reporter - образ для аналитика данных.
run.sh - главный скрипт для сборки, запуска и проверки проекта.
Генерация данных
Собрать Docker-образ генератора:
./run.sh build_generator
Запустить генератор:
./run.sh run_generator
После запуска в папке data/ появится файл data.csv.
Для локальной отладки без Docker можно создать CSV в папке local_data/:
./run.sh create_local_data
Создание отчета
Собрать Docker-образ аналитика:
./run.sh build_reporter
Запустить аналитика:
./run.sh run_reporter
После запуска в папке data/ появится файл report.html.
Полный порядок запуска
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
Веб-сервер с отчетом
Команда запускает контейнер nginx:alpine, монтирует локальную папку data/ внутрь контейнера и открывает порт 8000:
./run.sh report_server
Если проект запущен локально на компьютере, отчет можно открыть в браузере:
http://localhost:8000/report.html
Чтобы остановить сервер, нужно нажать Ctrl+C в терминале, где запущена команда.
Как открыть отчет в GitHub Codespaces
Откройте репозиторий в GitHub Codespaces.
В терминале выполните команды:
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
./run.sh report_server
После запуска сервера откройте вкладку PORTS в нижней панели Codespaces.
Найдите порт 8000.
Нажмите на ссылку, которую Codespaces покажет для этого порта.
В открывшемся браузере перейдите к файлу:
/report.html
Итоговый адрес будет похож на:
https://...githubpreview.dev/report.html
Дополнительные команды
Показать структуру проекта:
./run.sh structure
Очистить сгенерированные файлы из папки data/:
./run.sh clear_data
Проверить, что контейнер генератора видит файлы из папки data/:
./run.sh inside_generator
Проверить, что контейнер аналитика видит файлы из папки data/:
./run.sh inside_reporter
Источник
При выполнении задания потребовались знания не из лекции, они брались из этой статьи:
https://habr.com/ru/companies/timeweb/articles/595687/
