#!/bin/bash

echo '🔄 Syncing repo'
git pull

echo '🧹 Removing old files'
rm -rf docs

echo '🔽 Downloading website...'
wget --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --domains localhost \
     --no-parent localhost

echo '📁 Renaming folder'
mv localhost docs

echo '🚀 Committing and pushing'
git add . && git commit -m 'feat(site): Automatic update' && git push
