DIR=felicity17-website

bash setup/proxy.sh
source ~/.bashrc

cd /var/www
ln -s $DIR/build/ public

cd /var/www/$DIR
npm install
composer install
# sudo -E npm install -g gulp

cd /var/www/
cp setup/config.php $DIR/src/app/config.php
cp $DIR/src/HTACCESS $DIR/src/.htaccess
mysql -u root <setup/createdb.sql
mysql -u root jugaad <setup/jugaad.sql

echo "cd /var/www/$DIR" >>~/.bashrc
echo "alias build=\"cd /var/www/$DIR; gulp build\"" >>~/.bashrc
source ~/.bashrc
