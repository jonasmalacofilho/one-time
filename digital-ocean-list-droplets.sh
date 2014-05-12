#!/bin/bash -x

#client_id=
#api_key=

# list all active droplets
curl "https://api.digitalocean.com/droplets/?client_id=$client_id&api_key=$api_key" | json_pp

# list specific droplet $droplet_id
#droplet_id=
#curl "https://api.digitalocean.com/droplets/$droplet_id?client_id=$client_id&api_key=$api_key" | json_pp

# destroy droplet after 6h; scrub the data
#echo "30 minutes until droplet destruction" | spd-say -m all -e
#sleep 5m
#echo "5 minutes until droplet destruction" | spd-say -m all -e
#droplet_id=
#curl "https://api.digitalocean.com/droplets/$droplet_id/destroy/?scrub_data&client_id=$client_id&api_key=$api_key" | json_pp
#echo "Droplet destruction initalized" | spd-say -m all -e
