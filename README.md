# Palworld Server Container

Please support the upstream fork at https://github.com/jammsen/docker-palworld-dedicated-server



## Environment-Variables
| Variable               | Description                                                                                                                           | Default Value                                          | Allowed Value   |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | --------------- |
| ALWAYS_UPDATE_ON_START | Updates the server on startup                                                                                                         | true                                                   | false/true      |
| MAX_PLAYERS            | Maximum amout of players                                                                                                              | 32                                                     | 1-32            |
| MULTITHREAD_ENABLED    | Sets options for "Improved multi-threaded CPU performance"                                                                            | true                                                   | false/true      |
| COMMUNITY_SERVER       | Sets the server to a "Community-Server". If true, the server will appear in the Community-Serverlist. Needs PUBLIC_IP and PUBLIC_PORT | true                                                   | false/true      |
| RCON_ENABLED           | RCON function - use ADMIN_PASSWORD to login after enabling it - Will be listening on port 25575 inside the container                  | true                                                   | false/true      |
| PUBLIC_IP              | Public ip, auto-detect if not specified, see COMMUNITY_SERVER                                                                         | 10.0.0.1                                               | ip address      |
| PUBLIC_PORT            | Public port, auto-detect if not specified, see COMMUNITY_SERVER                                                                       | 8211                                                   | 1024-65535      |
| SERVER_NAME            | Name of the server                                                                                                                    | jammsen-docker-generated-###RANDOM###                  | string          |
| SERVER_DESCRIPTION     | Description of the server                                                                                                             | Palworld-Dedicated-Server running in Docker by jammsen | string          |
| SERVER_PASSWORD        | Password of the server                                                                                                                | serverPasswordHere                                     | string          |
| ADMIN_PASSWORD         | Admin password of the server                                                                                                          | adminPasswordHere                                      | string          |
| BACKUP_ENABLED         | Backup function, creates backups in your `game` directory                                                                             | true                                                   | false/true      |
| BACKUP_CRON_EXPRESSION | Needs a Cron-Expression - See https://github.com/aptible/supercronic#crontab-format or https://crontab-generator.org/                 | 0 * * * * (meaning every hour)                         | Cron-Expression |

