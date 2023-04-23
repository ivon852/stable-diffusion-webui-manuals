#!/bin/bash
rm -r ../netlify-ivon-blog/static/posts/stable-diffusion-webui-manuals/*
hugo --gc --minify --config config_ivonblog.toml
cp -r public/* ../netlify-ivon-blog/static/posts/stable-diffusion-webui-manuals
rm -r public resources .hugo_build.lock
git add -A
git commit -m "網站更新"
git push
