#!/bin/bash

# 因為隱私因素，故不能提供Giscus真身
cp ../netlify-ivon-blog/layouts/partials/comments/giscus_sdwebui_manuals.html layouts/partials/comments/giscus.html
rm -r ../netlify-ivon-blog/static/posts/stable-diffusion-webui-manuals/*
rm -r public resources .hugo_build.lock
hugo --gc --minify --config config_ivonblog.toml
cp -r public/* ../netlify-ivon-blog/static/posts/stable-diffusion-webui-manuals
rm -r public resources .hugo_build.lock
echo "" > layouts/partials/comments/giscus.html

git add -A
git commit -m "網站更新"
git push
