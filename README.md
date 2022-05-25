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

![Super shéma de la mort](/links/supershema.png)