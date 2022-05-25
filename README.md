# inception

![One conntainner is not enough we need to go deeper](/links/meme.png)

## 1. Sujet

Mettre en place :
* Un **container** contenant `NGINX` avec `TLSv1.2` ou `TLSv1.3` uniquement.
* Un **container** contenant `WordPress` + `php-fpm` (installé et configuré) uniquement sans nginx.
* Un **container** contenant `MariaDB` uniquement sans nginx.
* Un **volume** contenant votre base de données WordPress.
* Un **volume** contenant les fichiers de votre site WordPress.
* Un **docker-network** qui fera le lien entre vos containers.

De plus:
* Vos containers devront redémarrer en cas de crash.
* Deux utilisateurs dans la base de données WordPress, l’un d’eux étant le compte Admin. 
* L’username de l’Admin ≠ "admin"
* Configurer votre nom de domaine *login.42.fr* afin qu’il pointe vers votre adresse IP locale.

![Super shéma de la mort](/links/supershema2.png)

| ✅  to do | ❌  ban |
| :-------- | :------ |
| travailler dans une machine Virtuelle | ne pas utiliser des *"hacky patch"* à base de ’tail -f’ lors de son exécution |
| obligatoirement utiliser `docker-compose` | ne  pas utiliser de network `host` ou `--link` ou encore `links` |
| image Docker du même nom que le service concerné | ne pas démarrer les containers avec une commande faisant tourner une boucle infinie |
| un `service` = un container dédié = un `Dockerfile` | les commandes comme `entrypoint` |
| les containers build sous : `Alpine Linux` avec l’avant-dernière version stable, ou `Debian Buster` | `taif -f`, `bash`, `sleep infinity`, `while true`, etc. |
| Les Dockerfiles appelés dans `docker-compose.yml` par votre `Makefile` (a la racine) | Le tag latest |
| les fichiers config dans `/srcs/` | pas de **mot de passe** apparent dans les Dokerfiles |
| un fichier `.env` pour les variables d’environnement | ne pas utiliser de services tels que `DockerHub` |
| le container `NGINX` doit être le seul point d’entrée par le port 443 | ne pas prendre des images toutes faites (Alpine et Debian étant exclus de cette règle) |
| utiliser le protocole `TLSv1.2` ou `TLSv1.3` | |