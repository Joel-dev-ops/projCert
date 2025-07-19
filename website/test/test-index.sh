#!/bin/bash
set -e

echo "Running syntax tests..."
php -l /var/www/html/index.php
php -l /var/www/html/config.php
php -l /var/www/html/functions.php

echo "All syntax checks passed!"
