# ft_server

## INTRODUCTION 🤓

Le but du sujet est de créer un server web complet avec la technologie **Docker**, qui sera capable de faire tourner plusieurs services, tel qu’un **Wordpress**, **Phpmyadmin**, ainsi qu’une **base de donnée**.

Sujet -> [EN](https://github.com/tinaserra/ft_server/blob/master/links/ft_server_en.pdf) | [FR](https://github.com/tinaserra/ft_server/blob/master/links/ft_server_fr.pdf)

## DOCKER 😎

### Comprendre et installer Docker

* [The comprehensive Introduction to Docker](http://blog.brew.com.hk/introduction-to-docker/)
* [A propos des images et des commandes](https://www.wanadev.fr/24-tuto-docker-demarrer-docker-partie-2/)
* [Comprendre et mettre en place Docker](https://guillaumebriday.fr/comprendre-et-mettre-en-place-docker)
* [Installation et foncionnement Docker](https://www.ionos.fr/digitalguide/serveur/configuration/tutoriel-docker-installation-et-premiers-pas/)

### Le Dockerfile

* [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/#entrypoint)

### Différences entre VM et conteneurs

|VM|Conteneurs|
| :--- | :--- |
|Repose sur un ```Hyperviseur``` qui va permettre d’emuler des machines au sens large, y compris les éléments physiques de la machine.|Ne repose pas forcément sur un hyperviseur mais sur un ```serveur``` plus classiquement.|
|Chaque machine dispose d’un ```OS``` sur le quel on dispose d’une ou plusieurs applications, bases de données, apache…|On dispose d’un ```moteur de conteneur``` (Docker). On dispose d’applications installées dans chacun des conteneurs. ```Un seul système d’exploitation``` : celui de la ```machine host``` qui fait bénéficier de ses ressources, son noyau, a chacun de ses conteneurs.|
|Volumetrie de ```plusieurs Go```|Beaucoup ```plus léger``` (on dépasse rarement 1 Go voir même 500 Mo)|
||On rentre dans le ```micro service``` : une application va être ```découpée``` en plusieurs petits services (bases de données, apache, services applicatifs…) ne veut pas dire que les applications peuvent supporter moins de charges ou de fréquentations ou de ressources, on est simplement plus segmenté.|


## COMMANDES 🦁

En exécutant la commande ```docker``` dans un terminal, on obtient une liste de commandes exécutables.

```s
# Créer une image
docker build -t [nom_image] .

# Vérifie si l'image est crée
docker images

# Supprimer une ou toutes les images
docker rmi [nom_image]
docker rmi $(docker images -a -q)

# Lancer le conteneur (ici on ouvre le port 80)
docker run -d -p 80:80 [nom_image]
docker run -d -p 80:80 --name=[nom_conteneur] [nom_image]

# Afficher les conteneurs qui tournent, -a pour all affiche tous les conteneurs
docker ps
docker ps -a

# Arrêter un conteneur
docker stop [nom_image]

# entrer dans un conteneur
docker exec -ti [nom_conteneur_ou_id] bash
```

[En savoir plus](https://www.wanadev.fr/27-tuto-docker-les-commandes-et-docker-partie-3/) sur les commandes.


## USEFUL LINKS 🤙🏼

### Doc

* SSL - [Self-Signed SSL Certificate](https://linuxize.com/post/creating-a-self-signed-ssl-certificate/) & [certificat SSL sous NGinx](https://admin-serv.net/blog/670/creer-et-installer-un-certificat-ssl-sous-nginx/)
* Install [MariaDB](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10)
* Install [phpMyAdmin](https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10)
* Install [Wordpress](https://www.osradar.com/install-wordpress-debian-10/)

### Vidéos

* Pour commencer - [Docker - Premiers pas](https://www.youtube.com/watch?v=fdlZqRZXWOc)
* Plus complet - [Presentation de Docker](https://www.youtube.com/watch?v=XgKOC6X8W28)
* Autre - [Environement de developpement](https://www.youtube.com/watch?v=F9R1EOaA7EA)
* Les bases du [Dockerfile](https://www.youtube.com/watch?v=8q0wcmeJ2Gk) 
* Installer [Nginx](https://www.youtube.com/watch?v=YD_exb9aPZU)
