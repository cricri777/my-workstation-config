# Setup systemd with rclone
# Adapt by replacing cricri-gdrive: and 
#
mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/rclone-gdrive.service <<'EOF'
[Unit]
Description=Rclone mount for Google Drive (cricri-gdrive)
Documentation=https://rclone.org/commands/rclone_mount/
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/rclone mount cricri-gdrive: %h/cricri-gdrive \
  --vfs-cache-mode=writes \
  --dir-cache-time=72h \
  --poll-interval=30s
ExecStop=/bin/fusermount3 -u %h/cricri-gdrive
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF
