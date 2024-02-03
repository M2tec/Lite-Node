
NETWORK=$1
docker compose -p koios-${NETWORK} -f docker-compose.yml logs -f 
