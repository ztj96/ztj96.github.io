#!/usr/bin/env bash
# sudo bash v2ray_run.sh
apt update
apt install curl
wget https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
bash install-release.sh --version v4.34.0
systemctl enable v2ray
mkdir -p /usr/local/etc/v2ray
cat > /usr/local/etc/v2ray/config.json <<'EOF'
{
  "inbounds": [{
    "port": 35366,
    "protocol": "vmess",
    "settings": {
      "clients": [{
        "id": "b3907b82-82ce-4c15-ac39-3a2a11e45f30",
        "level": 1,
        "alterId": 0
      }]
    },
    "streamSettings": {
      "network": "tcp",
      "kcpSettings": {
        "uplinkCapacity": 5,
        "downlinkCapacity": 100,
        "congestion": true,
        "header": {
          "type": "none"
        }
      }
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
EOF

systemctl restart v2ray
ufw disable
