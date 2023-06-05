sudo apt update
sudo apt install -y vino

# Enable the VNC server to start each time you log in
# If you have a Jetson Nano 2GB Developer Kit (running LXDE)
mkdir -p ~/.config/autostart
cp /usr/share/applications/vino-server.desktop ~/.config/autostart

## For all other Jetson developer kits (running GNOME)
# cd /usr/lib/systemd/user/graphical-session.target.wants
# sudo ln -s ../vino-server.service ./.

# Configure the VNC server
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false

echo -e "Enter your username:"
read USERNAME
echo -e "Enter your password:"
read -s PASSWORD

# Set a password to access the VNC server
# - Replace thepassword with your desired password
gsettings set org.gnome.Vino authentication-methods "['${USERNAME}']"
gsettings set org.gnome.Vino vnc-password $(echo -n "${PASSWORD}"|base64)

echo -e "Setup is finished, please reboot your system."