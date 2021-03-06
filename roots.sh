#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo ${GREEN}Enter name of project folder to be created:${NC}
read -p "${PWD}/" foo
mkdir "$foo" && cd "$foo"
git clone --depth=1 git@github.com:roots/trellis.git && rm -rf trellis/.git
composer create-project roots/bedrock site
echo ${GREEN}Trellis and Bedrock installation complete.${NC}
read -p $'\e[0;32mContinue and install Sage?\e[0m [\e[1;33mY,n\e[0m]? \e[0m' -r
echo    # (optional) move to a new line
if [[ ${REPLY} =~ ^[Yy]$ ]] || [[ -z ${REPLY} ]]
then
  cd site/web/app/themes
  echo ${GREEN}Enter name of theme folder to be created:${NC}
  read -p "site/web/app/themes/" bar
  composer create-project roots/sage ${bar}
  cd ${bar}
  yarn && yarn build
fi

