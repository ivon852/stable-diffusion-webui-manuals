#!/bin/bash
rm -r public resources .hugo_build.lock
cp -r ../stable-diffusion-webui-manuals ../stable-diffusion-webui-manuals-static
cd ../stable-diffusion-webui-manuals-static
tomatch="../../images/"
toreplace="/images/"
find "content.zh-tw" -type f -exec sed -i "s|$tomatch|$toreplace|" {} \;
tomatch="../../../images/"
toreplace="/images/"
find "content.zh-cn" -type f -exec sed -i "s|$tomatch|$toreplace|" {} \;
hugo --gc --minify --config config.toml
cp -r public ../stable-diffusion-webui-manuals
cd ../stable-diffusion-webui-manuals
rm -rf ../stable-diffusion-webui-manuals-static
