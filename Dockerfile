# Image de base
FROM debian:buster

# Personne qui maintien le Dockerfile
MAINTAINER vserra <vserra@sutdent.42.fr>

# Commandes que l'on taperait directement dans la console
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install nginx

# Décompression de l’archive dans « /var/www/html »
# Nous allons installer unzip pour la décompression ensuite deplacer le dossier vers html.
RUN cd /tmp/ \
&& wget http://wordpress.org/latest.zip \
&& apt-get install -y unzip \
&& unzip latest.zip -d /var/www/html \
#&& mv wordpress /var/www/wordpress \ 
&& cd /var/www/html \
#&& rm index.html \ 
&& cp -R wordpress/* ./ \ 
&& rm -Rf wordpress \

# On donne les droits à l’utilisateur et au groupe d’Apache (www-data) sur les répertoires concernés (Etape importante) :
&& cd /var/www/ \
&& chown -R www-data:www-data  * \
&& find . -type d -exec chmod 0755 {} \; \
&& find . -type f -exec chmod 0644 {} \; 

# ADD ou COPY -> /host /dest (avec ADD on peut mettre un https:// au lieu du /host)
ADD script.sh /usr/bin/script.sh

RUN chmod +x /usr/bin/script.sh

# On ouvre cote container le port 80
EXPOSE 80:80

# La commande pour lancer ce qu'on veut (le start.sh)
CMD ["script.sh"]

