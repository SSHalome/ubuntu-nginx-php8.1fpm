#!/bin/bash
echo "# ubuntu-nginx-php8.1fpm" >> README.md
git init
git add README.md
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://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@github.com/SSHalome/ubuntu-nginx-php8.1fpm.git
git push -u origin main
