if [[ -z "$1" ]]; then
        echo "missing network. first argument must be [mainnet|preprod|traefik]"
        exit -1
fi &&

NETWORK=$1

script_dir=$(dirname "$(realpath "${BASH_SOURCE[@]}")")
# Remove the last folder from the path and rename it to KLITE_HOME
KLITE_HOME=$(dirname "$script_dir")
path_line="export PATH=\"$script_dir:\$PATH\""

if [[ $NETWORK == "traefik" ]]; then
    docker compose -f docker-compose-traefik.yml  down
else
    docker compose --env-file .env.${NETWORK} -p koios-${NETWORK} -f "${KLITE_HOME}"/docker-compose.yml down
fi