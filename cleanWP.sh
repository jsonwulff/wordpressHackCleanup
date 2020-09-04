#!/bin/bash

# Web 1
# ssh -i ~/.ssh/id_rsa minut-rens@35.198.126.236
# Web 2
# ssh -i ~/.ssh/id_rsa perssons-fugefirma@35.198.66.42
# cd apps/$appName/public
# ssh -i ~/.ssh/id_rsa perssonsgulvteknik@35.198.126.236

#git clone https://github.com/jsonwulff/wordpressHackCleanup.git

# wp config get DB_NAME && \
# wp config get DB_USER && \
# wp config get table_prefix

# rm -rf wp-admin && \
# rm -rf wp-includes && \
# rm -rf .tmb && \
# rm -rf .quarantine && \
# wp core download --force --skip-content  && \
# wp config create --force --dbname=perssons-fugefirma-wp-Eyo1WCSi --dbuser=D760P1Cuxy6r --dbpass='!9H&f4^7pNC8cLD$ff6sCO6NBIxNI6Z2' --dbprefix=wp_74275dd1a3_ && \
# wp plugin uninstall hello akismet --deactivate --quiet && \
# wp plugin update --all 

echo "Be sure to add your ssh key to the user"
echo "Enter app name:"
read appName
echo "Enter username"
read userName

cd ../apps/$appName/public
DB_NAME=$(wp config get DB_NAME)
DB_USER=$(wp config get DB_USER)
DB_PASS=$(wp config get DB_PASSWORD)
table_prefix=$(wp config get table_prefix)

echo "$DB_NAME $DB_USER $table_prefix"
# rm -rf wp-admin
# rm -rf wp-includes 
# rm -rf .tmb 
# rm -rf .quarantine 
find . ! -path "./wp-content/*" ! -name .htaccess ! -name wp-config.php -delete
wp core download --force --skip-content
wp config create --force --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbprefix=$table_prefix
wp theme delete twentytwenty twentynineteen twentyseventeen
wp plugin update --all

# cd wp-content/uploads/
# find . ! -path "./avia_fonts/*" -name *.php
# find . -not -path "./avia_fonts/*" -name *.php
# find . -name "*.php" -type f -delete
# find . -name "*.ico" -type f -delete

# pluginList=$(wp plugin list --format=csv --fields=name)
# pluginList=${pluginList:5}


# string='My long string'
# if [[ $string == *"My long"* ]]; then
#   echo "It's there!"
# fi

# find /directory/ -type f -not -name 'PATTERN'
# find . -type f -not \(-name '*gz' -or -name '*odt' -or -name '*.jpg' \)
# find . -type f -not \(-name '*.php' \)