#!/bin/sh
rm -rf vendor composer.lock
composer install --no-dev --optimize-autoloader
