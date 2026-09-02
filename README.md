# my-workstation-config
Configuration for my workstation

# Target structure example
my-workstation-config/
├── README.md
├── bootstrap/
│   ├── install.sh
│   └── link.sh
├── systemd/
│   ├── user/
│   │   ├── rclone-gdrive.service
│   │   └── timers/                  # optional future timers
│   └── system/                      # only if you add root services later
├── rclone/
│   ├── README.md
│   ├── mounts/
│   │   └── gdrive.md                # mount flags, rationale, troubleshooting
│   └── bisync/                      # optional future if you use bisync
├── shell/
│   ├── bashrc
│   ├── zshrc
│   └── aliases.sh
├── git/
│   └── gitconfig
├── apps/
│   ├── tmux/
│   │   └── tmux.conf
│   ├── nvim/
│   │   └── init.lua
│   └── ssh/
│       └── config.example
├── hosts/
│   ├── omarchy-laptop/
│   │   ├── env.sh
│   │   └── systemd-overrides/
│   │       └── rclone-gdrive.service.d/
│   │           └── override.conf
│   └── README.md
└── docs/
    ├── decisions/
    │   └── 0001-rclone-via-systemd.md
    └── runbooks/
        └── restore-new-laptop.md
