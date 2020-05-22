# ft_server

## INTRODUCTION 🤓

Ce sujet à pour but de vous faire découvir découvrir l’administration système en vous sensibilisant a l’importance de l’utilisation de scripts pour automatiser vos taches. Pour ce faire, nous allons vous faire découvrir la technologie "Docker" afin de vous faire installer un server web complet, qui sera capable de faire tourner plusieurs services, tel qu’un Wordpress, Phpmyadmin, ainsi qu’une base de donnée.

Sujet -> [EN](https://github.com/tinaserra/ft_server/blob/master/links/ft_server_en.pdf) | [FR](https://github.com/tinaserra/ft_server/blob/master/links/ft_server_fr.pdf)

## DOCKER 😎

### Qu’est-ce que ```docker``` ?

Docker est un logiciel libre permettant de lancer des applications dans des conteneurs logiciels.

Il permet la mise en œuvre de conteneurs s'exécutant en isolation, via une API de haut-niveau. 

Construit sur des capacités du noyau Linux, un conteneur Docker, à l'opposé de machines virtuelles traditionnelles, ne requiert aucun système d'exploitation séparé et n'en fournit aucun. Il s'appuie plutôt sur les fonctionnalités du noyau et utilise l'isolation de ressources (comme le processeur, la mémoire, les entrées et sorties et les connexions réseau) ainsi que des espaces de noms séparés pour isoler le système d'exploitation tel que vu par l'application. 

Docker accède aux capacités de virtualisation du noyau Linux, soit directement à travers la bibliothèque runc (disponible depuis Docker 0.9), soit indirectement via libcrt, LXC (Linux Containers) ou systemd-nspawn.

Utiliser Docker pour créer et gérer des conteneurs peut simplifier la mise en œuvre de systèmes distribués en permettant à de multiples applications, tâches de fond et autres processus de s'exécuter de façon autonome sur une seule machine physique ou à travers un éventail de machines isolées. 

### Qu’est-ce qu’un ```container``` ?

L'objectif d'un conteneur est le même que pour un serveur dédié virtuel : héberger des services sur un même serveur physique tout en les isolant les uns des autres. 
Un conteneur est cependant moins figé qu'une machine virtuelle en matière de taille de disque et de ressources allouées.

Un conteneur permet d'isoler chaque service : le serveur web, la base de données, des applications pouvant être exécutées de façon indépendante dans leur conteneur dédié, contenant uniquement les dépendances nécessaires. 
Chaque conteneur peut être relié aux autres par des réseaux virtuels. Il est possible de monter des volumes de disque de la machine hôte dans un conteneur.

### Quest-ce qu'une ```image``` ?

Une image est un container statique. On pourrait comparer une image à une capture d'un container à un moment donné, d'une sorte de snapshot d'un de vos containers. Lorsqu'on souhaite travailler avec un container, on déclare forcément un container à partir d'une image.

De plus, les images Docker fonctionnent grâce à de l'héritage d'autres images. Votre image de Tomcat hérite elle-même de l'image de Java. Cette même image de Java qui a peut-être été construite à partir d'une Debian. Les héritages peuvent ainsi aller très loin ! Le container créé à partir d'une image contient le delta entre l'image de base à partir de laquelle le container a été instancié et l'état actuel. Grâce à ce système, la duplication de donnée est faible.

### Différences entre VM et conteneurs

|VM|Conteneurs|
| :--- | :--- |
|Repose sur un ```Hyperviseur``` qui va permettre d’emuler des machines au sens large, y compris les éléments physiques de la machine.|Ne repose pas forcément sur un hyperviseur mais sur un ```serveur``` plus classiquement.|
|Chaque machine dispose d’un ```OS``` sur le quel on dispose d’une ou plusieurs applications, bases de données, apache…|On dispose d’un ```moteur de conteneur``` (Docker). On dispose d’applications installées dans chacun des conteneurs. ```Un seul système d’exploitation``` : celui de la ```machine host``` qui fait bénéficier de ses ressources, son noyau, a chacun de ses conteneurs.|
|Volumetrie de ```plusieurs Go```|Beaucoup ```plus léger``` (on dépasse rarement 1 Go voir même 500 Mo)|
||On rentre dans le ```micro service``` : une application va être ```découpée``` en plusieurs petits services (bases de données, apache, services applicatifs…) ne veut pas dire que les applications peuvent supporter moins de charges ou de fréquentations ou de ressources, on est simplement plus segmenté.|


## COMMANDES 🦁

En exécutant la commande docker dans un terminal, on obtient une liste de commandes exécutables.



```
build     Build an image from a Dockerfile

cp        Copy files/folders from a container's filesystem to the host path

exec      Run a command in an existing container

pause     Pause all processes within a container
ps        List containers
pull      Pull an image or a repository from a Docker registry server
push      Push an image or a repository to a Docker registry server
restart   Restart a running container
rm        Remove one or more containers

run       Run a command in a new container
$ docker run -ti 'nom de l'image' 
l'option -ti sert a rester dans le container apres l'avoir run

save      Save an image to a tar archive

start     Start a stopped container
stop      Stop a running container
```

En savoir plus sur les [commandes](https://www.wanadev.fr/27-tuto-docker-les-commandes-et-docker-partie-3/)


## USEFUL LINKS 🤙🏼

### Incontournables

* [The comprehensive Introduction to Docker](http://blog.brew.com.hk/introduction-to-docker/)
* [A propos des images et des commandes](https://www.wanadev.fr/24-tuto-docker-demarrer-docker-partie-2/)
* [Comprendre et mettre en place Docker](https://guillaumebriday.fr/comprendre-et-mettre-en-place-docker)
* [Installation et foncionnement Docker](https://www.ionos.fr/digitalguide/serveur/configuration/tutoriel-docker-installation-et-premiers-pas/)

### Vidéos

* Pour commencer - [Docker - Premiers pas](https://www.youtube.com/watch?v=fdlZqRZXWOc)
* Plus complet - [Presentation de Docker](https://www.youtube.com/watch?v=XgKOC6X8W28)
* Bonus - [Environement de developpement](https://www.youtube.com/watch?v=F9R1EOaA7EA)

