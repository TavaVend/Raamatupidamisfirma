version: '3.8'

# Manager.io raamatupidamistarkvara infrastruktuur
# Tarkvara: https://www.manager.io/
# 17 kasutajat, raamatupidamisfirma

services:

  nginx:
    image: nginx:1.25
    restart: unless-stopped
    ports:
      - "80:80"
    volumes:
      - ./config/nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - manager
    networks:
      - app_network

  manager:
    image: cronet/manager.io:latest   # ametlik Manager.io Docker image
    restart: unless-stopped
    volumes:
      - manager_data:/data            # andmed säilivad ka pärast taaskäivitust
    networks:
      - app_network

  backup:
    image: alpine:latest
    restart: unless-stopped
    depends_on:
      - manager
    volumes:
      - manager_data:/data:ro         # loeb Manager.io andmeid
      - backup_data:/backup           # salvestab varukoopiad siia
      - ./config/backup.sh:/backup.sh
    command: sh -c "chmod +x /backup.sh && crond -f"
    networks:
      - app_network

volumes:
  manager_data:   # Manager.io andmed
  backup_data:    # varukoopiad

networks:
  app_network:
