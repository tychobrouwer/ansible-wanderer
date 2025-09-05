#!/bin/bash
trap "kill 0" EXIT

# Required configuration
export ORIGIN={{ wanderer_origin }}
export MEILI_URL=http://127.0.0.1:7700
export MEILI_MASTER_KEY={{ wanderer_meili_master_key }}
export PUBLIC_POCKETBASE_URL=http://127.0.0.1:8090
export PUBLIC_VALHALLA_URL=https://valhalla1.openstreetmap.de
export POCKETBASE_ENCRYPTION_KEY={{ wanderer_pocketbase_encryption_key }}

# Optional configuration
export MEILI_NO_ANALYTICS=true
# export BODY_SIZE_LIMIT=Infinity
export PUBLIC_DISABLE_SIGNUP={{ wanderer_disable_signup }}
export PUBLIC_PRIVATE_INSTANCE={{ wanderer_private_instance }}
# export UPLOAD_FOLDER=/app/uploads
# export UPLOAD_USER=
# export UPLOAD_PASSWORD=

cd {{ wanderer_install_dir }}/search && meilisearch --master-key $MEILI_MASTER_KEY &
cd {{ wanderer_install_dir }}/db && ./pocketbase serve &
cd {{ wanderer_install_dir }}/web && node build &

wait
