FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css
COPY andrew-bubis.jpg /usr/share/nginx/html/andrew-bubis.jpg
COPY robots.txt /usr/share/nginx/html/robots.txt
COPY sitemap.xml /usr/share/nginx/html/sitemap.xml
COPY favicon.svg /usr/share/nginx/html/favicon.svg
COPY og-image.png /usr/share/nginx/html/og-image.png
EXPOSE 80
