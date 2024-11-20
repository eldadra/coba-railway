#!/bin/bash

# Install dependencies
composer install --optimize-autoloader --no-dev

# Generate key if not already generated
php artisan key:generate --force

# Cache configuration
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Run migrations
php artisan migrate --force

# Start server
php artisan serve --host=0.0.0.0 --port=$PORT