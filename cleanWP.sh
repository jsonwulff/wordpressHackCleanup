#!/bin/bash

# Web 1
# ssh -i ~/.ssh/id_rsa perssonsgulvteknik@35.198.126.236
# Web 2
# ssh -i ~/.ssh/id_rsa perssons-fugefirma@35.198.66.42
# cd apps/$appName/public
# ssh -i ~/.ssh/id_rsa perssonsgulvteknik@35.198.126.236

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
rm -rf wp-admin
rm -rf wp-includes 
rm -rf .tmb 
rm -rf .quarantine 
wp core download --force --skip-content
wp config create --force --dbname='${DB_NAME}' --dbuser='${DB_USER}' --dbpass='${DB_PASS}' --dbprefix='${table_prefix}'
wp plugin update --all