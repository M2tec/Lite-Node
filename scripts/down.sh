NETWORK=$1

script_dir=$(dirname "$(realpath "${BASH_SOURCE[@]}")")
# Remove the last folder from the path and rename it to KLITE_HOME
KLITE_HOME=$(dirname "$script_dir")
path_line="export PATH=\"$script_dir:\$PATH\""

docker compose --env-file .env.${NETWORK} -p koios-${NETWORK} -f "${KLITE_HOME}"/docker-compose.yml down