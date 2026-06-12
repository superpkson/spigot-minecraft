```yaml
services:
  minecraft:
    image: ghcr.io/superpkson/spigot-minecraft:nightly
    ports:
      - "25565:25565"
    volumes:
      - minecraft:/mnt/minecraft
    restart: unless-stopped

volumes:
  minecraft:
```

```bash
docker run -d -p 25565:25565 -v minecraft:/mnt/minecraft --restart unless-stopped ghcr.io/superpkson/spigot-minecraft:nightly
```
