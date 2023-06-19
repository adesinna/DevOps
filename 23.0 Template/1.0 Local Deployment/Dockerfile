FROM nginx:latest

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/nginx/html

RUN rm -rf ./* && \
    wget -O hightech.zip https://www.free-css.com/assets/files/free-css-templates/download/page291/hightech.zip && \
    unzip hightech.zip -d hightech && \
    mv hightech/* . && \
    rm -rf hightech.zip hightech/

RUN mv hightech-html/* .
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

