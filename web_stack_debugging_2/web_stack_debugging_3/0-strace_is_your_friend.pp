# Fixes the typo in wp-settings.php that makes Apache return a 500 error

exec { 'fix-wordpress':
  command => "sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
  path    => ['/bin', '/usr/bin', '/usr/local/bin'],
}
