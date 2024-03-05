#!/bin/bash

# 繁轉簡
rm -r content.zh-cn
cp -r content.zh-tw content.zh-cn
lst=`find "content.zh-cn" -type f -name "*.md"`
lst_num=`find "content.zh-cn" -type f -name "*.md"|wc -l`
for file in $lst
do
	opencc -i $file -o $file -c tw2sp.json
done

# 修正圖片連結
tomatch="../../images/"
toreplace="../../../images/"
find "content.zh-cn" -type f -exec sed -i "s|$tomatch|$toreplace|" {} \;

# 因為隱私因素，故不能提供Giscus真身
#cp ../gohugo-ivonblog/layouts/partials/comments/giscus_sdwebui_manuals.html layouts/partials/comments/giscus.html
rm -r ../gohugo-ivonblog/static/posts/stable-diffusion-webui-manuals/*
rm -r public resources .hugo_build.lock
hugo --gc --minify --config config_ivonblog.toml
cp -r public/* ../gohugo-ivonblog/static/posts/stable-diffusion-webui-manuals
rm -r public resources .hugo_build.lock
#echo "" > layouts/partials/comments/giscus.html

git add -A
git commit -m "網站更新"
git push
