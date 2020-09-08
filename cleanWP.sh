#!/bin/bash

# rm -rf wp-admin && \
# rm -rf wp-includes && \
# rm -rf .tmb && \
# rm -rf .quarantine && \
# wp core download --force --skip-content  && \
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
find . ! -path "./wp-content/*" ! -name "wp-content" ! -name .htaccess ! -name wp-config.php -delete
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
