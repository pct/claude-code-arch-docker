#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Create ~/bin/tifa with script directory
mkdir -p ~/bin
cat > ~/bin/tifa << EOF
#!/bin/bash
DOCKER_COMPOSE_YAML="$SCRIPT_DIR/docker-compose.yml"

docker-compose -f \$DOCKER_COMPOSE_YAML exec tifa-code-cli fish "\$@"
EOF
chmod +x ~/bin/tifa
echo "Installed tifa to ~/bin/tifa"
