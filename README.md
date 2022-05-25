# inception

![One conntainner is not enough we need to go deeper](/links/meme.png)

Ce projet consiste à mettre en place une mini-infrastructure de différents services en suivant des règles spécifiques en utilisant *docker-compose*.

## 1. Sujet

Mettre en place :
* Un **container** contenant `NGINX` avec `TLSv1.2` ou `TLSv1.3` uniquement.
* Un **container** contenant `WordPress` + `php-fpm` (installé et configuré) uniquement sans nginx.
* Un **container** contenant `MariaDB` uniquement sans nginx.
* Un **volume** contenant votre base de données WordPress.
* Un **volume** contenant les fichiers de votre site WordPress.
* Un **docker-network** qui fera le lien entre les containers.

De plus:
* Les containers devront redémarrer en cas de crash.
* Deux utilisateurs dans la base de données WordPress, l’un d’eux étant le compte Admin. 
* L’username de l’Admin ≠ "admin"
* Configurer le nom de domaine *login.42.fr* afin qu’il pointe vers l'adresse IP locale.

![Super shéma de la mort](/links/supershema2.png)

| ✅  to do | ❌  ban |
| :-------- | :------ |
| Travailler dans une machine Virtuelle | Ne pas utiliser des *"hacky patch"* à base de `tail -f` lors de son exécution |
| Obligatoirement utiliser `docker-compose` | Ne pas utiliser de network `host` ou `--link` ou encore `links` |
| Image Docker du même nom que le service concerné | Ne pas démarrer les containers avec une commande faisant tourner une boucle infinie |
| Un `service` = un container dédié = un `Dockerfile` | Ne pas utiliser les commandes comme `entrypoint` |
| Les containers build sous : `Alpine Linux` avec l’avant-dernière version stable, ou `Debian Buster` | `taif -f`, `bash`, `sleep infinity`, `while true`, etc. |
| Les Dockerfiles appelés dans `docker-compose.yml` par votre `Makefile` (a la racine) | Ne pas utiliser le tag latest |
| Les fichiers config dans `/srcs/` | Pas de **mot de passe** apparent dans les Dokerfiles |
| Un fichier `.env` pour les variables d’environnement | Ne pas utiliser de services tels que `DockerHub` |
| Le container `NGINX` doit être le seul point d’entrée par le port 443 | Ne pas prendre des images toutes faites (Alpine et Debian étant exclus de cette règle) |
| Utiliser le protocole `TLSv1.2` ou `TLSv1.3` | |