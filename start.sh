cat << 'EOF' > start.sh
#!/bin/bash

php-fpm &

nginx -g "daemon off;"
EOF
