#rm -rf /var/www/*;

DIR_VENDOR="/var/www/vendor";
DIR_NODE_MODULES="/var/www/node_modules";

if [ ! -d "$DIR_VENDOR" ] || [ ! -d "$DIR_NODE_MODULES" ]; then
    rm -rf /var/www/*
    composer create-project laravel/laravel .
    composer install
    npm install         
fi

php-fpm