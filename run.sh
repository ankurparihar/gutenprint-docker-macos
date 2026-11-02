docker pull ghcr.io/openprinting/gutenprint-printer-app:latest
docker volume create gutenprint-printer-app
docker run -d \
      --name gutenprint-printer-app \
      --network host \
      -e PORT=631 \
      -v gutenprint-printer-app:/var/lib/gutenprint-printer-app \
      --device-cgroup-rule='c 189:* rmw' \
      ghcr.io/openprinting/gutenprint-printer-app:latest
cupsctl WebInterface=yes
# open http://localhost:631/admin
# add printer - enter your system username and password when prompted
# network printer will show up automatically if available
