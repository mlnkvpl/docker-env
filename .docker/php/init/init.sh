#rm -rf /var/www/*;

DIR_VENDOR="/var/www/vendor";
DIR_NODE_MODULES="/var/www/node_modules";

if [ -z "$(ls -A /var/www)" ] 
then
    if [ -z "${APP_REPOSITORY}" ]
    then
        composer create-project laravel/laravel .
    else 
        git clone "${APP_REPOSITORY}" .
    fi
fi

if [ ! -d "$DIR_VENDOR" ] 
then    
    composer install       
fi

if [ ! -d "$DIR_NODE_MODULES" ]
then
    npm install  
fi

php-fpm