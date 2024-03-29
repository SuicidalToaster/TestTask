# Содержание
<!-- TOC -->
* [Требования](#требования)
* [Описание](#описание)
* [Структура](#структура)
* [Проблемы и решения](#проблемы-и-решения)
* [Возможные улучшения](#возможные-улучшения)
<!-- TOC -->
# Требования

1) Машина с установленным Centos 8
2) Ansible 2.16.x
3) Host-файл

# Описание

Тестовое задание на должность Junior SRE 

# Структура
```
.
├── All-in-one-playbook.yml
├── configs
│   ├── dashboards
│   │   ├── Node Exporter Full.json
│   │   └── testdb.yaml
│   ├── datasources
│   │   └── testds.yaml
│   ├── node_exporter.service
│   ├── prometheus.service
│   ├── prometheus.yml
│   └── web.yml
├── grafana-enterprise-10.3.3-1.x86_64.rpm
├── scripts
│   ├── add_annotation.sh
│   ├── install_node_exporter.sh
│   └── install_prometheus.sh
└── README.md
```
`All-in-one-playbook.yml` — главный экспонат репозитория. Плейбук, в котором описываются действия связанные с установкой Grafana, Prometheus и node_exporter.

В директории `configs` находятся конфигурационные и .service файлы, дэшборда 1860 и провижн для графаны.

`web.yml` описывается basicAuth для Prometheus (admin:password) 

`prometheus.yml` описывает экспортеры к которым подключен Prometheus и вообще весь конфиг

В `scripts` находятся скрипты для установки и скрип для добавления аннотации на борду на панельку CPU Basic.

# Проблемы и решения

| Проблема                                                                                                                                                       | Решение                                                                                                                                                                                                                                                                                      |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Grafana из репозитория Centos 8 являлась устаревшей 9.0.x версией, из-за этого возникали проблемы с соединением к Prometheus версии 2.50                       | 1) Скачать альтернативными способами на машину с которой будет выполняться плейбук акутальную версию Grafana.(Мой способ. По совместиельству не самый быстрый)<br/> 2) Скачать в скриптах поддерживаемую версию Prometheus <= 2.40 на целевую машину (Не мой способ, но cамый логичный |
| У меня никоим образом не хотела резолвиться коллекция prometheus.prometheus. Я виню в этом мою ос, но к какому-то железному выводу о причинах я прийти не смог | Прямого решения не нашёл. В качестве обходного пути решил писать bash-скрипты                                                                                                                                                                                                                |

# Возможные улучшения

1) Привести папку configs в порядок, чтобы скопировать все файлы за 1 таску
2) Ввести переменные
3) Начать обращать внимание на линтер ансибла
   1) Жалобы на пермишен игнорирую
   2) Latest в yum'е тоже
4) Использовать Ansible Best Practices