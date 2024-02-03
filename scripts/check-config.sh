
NETWORK=$1
docker compose --env-file .env.${NETWORK} -p koios-${NETWORK} -f docker-compose.yml config
