FROM nginx:latest
LABEL "Project"="Vprofile"
LABEL "Author"="Adesina"
# remove default
RUN rm -rf /etc/nginx/conf.d/default.conf
# copy our own configuration into the image
COPY nginvproapp.conf /etc/nginx/conf.d/vproapp.conf