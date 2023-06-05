sudo apt install -y python3-pip

sudo -H pip3 install -U jetson-stats

# After this need to reboot
sudo systemctl restart jetson_stats.service

echo "Installation is finished, please reboot the system."

# Usage
# jtop

echo -e "-Usage:\n\njtop"