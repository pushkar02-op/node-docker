web: trap '' SIGTERM;  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &  chmod +x /usr/local/bin/docker-compose & docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d & wait -n; kill -SIGTERM -$$; wait
