#!/bin/bash -e

echo "Configure AWS"

HOME_DIR=~

# check if the key has been configured (through relationship)
if ! grep -q agent_private_key_path "$HOME_DIR/cfy_config_aws.yml"; then
  echo "Use manager key for aws"
  echo "agent_keypair_name: '$KEYPAIR_NAME'" >> "$HOME_DIR/cfy_config_aws.yml"
  echo "agent_private_key_path: '$HOME_DIR/cfy_keys/$SSH_KEY_FILENAME'" >> "$HOME_DIR/cfy_config_aws.yml"
fi

sudo python ${python_script} -c "$HOME_DIR/cfy_config_aws.yml" -u $ADMIN_USERNAME -p $ADMIN_PASSWORD --ssl

echo "AWS configured"
