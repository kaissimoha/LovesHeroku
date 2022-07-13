#!/bin/bash

# Cloning repos
echo -e "\e[32m[INFO]: Cloning Frontend Respository.\e[0m"
git clone https://github.com/DesterLib/Frontend /workspaces/Frontend >> /dev/null 2>&1
echo -e "\e[32m[INFO]: Cloning Backend Respository.\e[0m"
git clone https://github.com/DesterLib/Backend /workspaces/Backend >> /dev/null 2>&1

# Frontend setup
cd /workspaces/Frontend
echo -e "\e[32m[INFO]: Installing dependencies.\e[0m"
npm install >> /dev/null 2>&1
echo -e "\e[32m[INFO]: Building static files.\e[0m"
npm run build >> /dev/null 2>&1
echo -e "\e[32m[INFO]: Successfully genereated the build files.\e[0m"
cd /workspaces
mv /workspaces/Frontend/build /workspaces/Backend/build
rm -rf /workspaces/Frontend

# Backend setup
cd /workspaces/Backend
python3 -m venv /workspaces/Backend/.venv
source /workspaces/Backend/.venv/bin/activate
pip3 install -r /workspaces/Backend/requirements.txt
