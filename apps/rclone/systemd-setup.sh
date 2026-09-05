mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/rclone-gdrive.service <<'EOF'
# path : ~/.config/systemd/user/rclone-gdrive.service
#
# To reload:
# $systemctl --user daemon-reload
# $systemctl --user restart rclone-gdrive
#
# status:
# $systemctl --user status rclone-gdrive
#
# to watch logs
# $systemctl --user enable --now rclone-gdrive.service
#
[Unit]
Description=Rclone mount for Google Drive (cricri-gdrive)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStartPre=/usr/bin/mkdir -p %h/cricri-gdrive
ExecStart=/usr/bin/rclone mount cricri-gdrive: %h/cricri-gdrive \
  --vfs-cache-mode=full \
  --vfs-write-back=10s \
  --vfs-cache-max-age=24h \
  --dir-cache-time=10s \
  --poll-interval=15s \
  --attr-timeout=1s \
  --umask=077 \
  --retries=10 \
  --low-level-retries=20 \
  --contimeout=15s \
  --timeout=1m \
  --log-level=INFO
ExecStop=/bin/fusermount3 -u %h/cricri-gdrive
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOF

# then run
sudo systemctl daemon-reload

# 1) Ensure mountpoint exists
mkdir -p ~/cricri-gdrive

# 2) Reload USER daemon (not system daemon)
systemctl --user daemon-reload

# 3) Start now
systemctl --user start rclone-gdrive.service

# 4) Enable at login (auto-start)
systemctl --user enable rclone-gdrive.service

# (optional) enable+start in one step
systemctl --user enable --now rclone-gdrive.service

