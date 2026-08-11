FROM nginx:alpine

# Copy the whole site. .dockerignore excludes git/build/script files,
# so any new asset (images, css, etc.) is picked up automatically —
# no need to edit this file when adding files to the site.
COPY . /usr/share/nginx/html/

EXPOSE 80
