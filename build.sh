function log() {
    message=$1
    echo "_______________________________\n"
    echo ''${message}''
    echo "_______________________________\n\n"

}

# build admin

log "delete admin/admin folder..."
rm -rf ../admin/admin
log "build admin FE app"
yarn --cwd ../admin build
cp -rv ../admin/build ../admin/admin
log "copying FE app to BE public folder .."
cp -rv ../admin/admin ./src/public/
cp ./src/public/admin/index.html ./src/views/admin.hbs

# build web-app
log "delete admin/admin folder..."
rm -rf ../web-app/app
log "build web-app FE app"
yarn --cwd ../web-app build
cp -rv ../web-app/build ../web-app/app
log "copying FE app to BE public folder .."
cp -rv ../web-app/app ./src/public/
cp ./src/public/app/index.html ./src/views/index.hbs

# build BE app - optional
log "Building BE app ..."
yarn build

# commit build
log "commit the publish updates"
git add .
git commit -m "feat(publish): publishing"
