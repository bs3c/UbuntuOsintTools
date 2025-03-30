#!/bin/bash

set -e

echo "[*] Updating system..."
sudo apt update && sudo apt upgrade -y

# --- Essentials ---
echo "[*] Installing essential tools..."
sudo apt install -y \
    curl wget git build-essential software-properties-common gnupg \
    lsb-release ca-certificates unzip zip jq xclip xsel file man tree lsof \
    net-tools bash-completion gnupg2 bc expect dialog python3-pip

# --- Monitoring ---
echo "[*] Installing system monitoring tools..."
sudo apt install -y \
    htop iftop iotop iptraf bmon sysstat dstat glances lshw neofetch screenfetch

# --- Productivity ---
echo "[*] Installing terminal productivity tools..."
sudo apt install -y \
    tmux zoxide fzf ripgrep bat ncdu micro vim nano ranger \
    exa fd-find tldr entr httpie

# --- Networking & Scanning ---
echo "[*] Installing networking & scanning tools..."
sudo apt install -y \
    nmap netcat-openbsd netdiscover arp-scan dnsenum dnsutils whois \
    traceroute mtr ipcalc wireshark-cli tcpdump socat iperf3 speedtest-cli \
    proxychains4 tor

# --- Cracking ---
echo "[*] Installing password cracking tools..."
sudo apt install -y \
    hashcat hydra john chntpw wordlists crunch

# --- Web Enumeration ---
echo "[*] Installing web hacking & enumeration tools..."
sudo apt install -y \
    sqlmap nikto gobuster dirb wfuzz ffuf whatweb wpscan \
    feroxbuster eyewitness

# --- Recon & OSINT ---
echo "[*] Installing recon & OSINT tools..."
sudo apt install -y \
    theharvester recon-ng sublist3r amass maltego \
    metagoofil holehe sherlock photon dmitry \
    spiderfoot discover intelx leaklookups binlookup \
    twint exiftool dnsrecon nslookup curlresolv \
    urlcrazy p0f piplchecker socialscan lampyre \
    crowbar cuckoo whoisxmlapi python3-opencv

# --- Forensics ---
echo "[*] Installing forensics and data extraction tools..."
sudo apt install -y \
    binwalk foremost testdisk scalpel sleuthkit gparted ddrescue \
    autopsy magicrescue exiftool pdfinfo steghide zsteg stegseek outguess

# --- Dev Tools ---
echo "[*] Installing development/debug tools..."
sudo apt install -y \
    gdb strace ltrace lsof ldd file lldb python3-pip python3-dev \
    golang default-jdk nodejs npm ruby ruby-dev make cmake

# --- Misc CLI ---
echo "[*] Installing misc CLI utilities..."
sudo apt install -y \
    lynx w3m irssi mutt cmatrix figlet toilet lolcat cowsay fortune \
    toilet btop unzip ranger htop sshpass
    
# --- Anonymity & Secure Browsing ---
echo "[*] Installing anonymous browsing tools..."

# Google Chrome
echo "[*] Installing Google Chrome..."
wget -q -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome.deb || sudo apt -f install -y
rm google-chrome.deb

# Tor Browser & Tools
echo "[*] Installing Tor Browser & tools..."
sudo apt install -y torbrowser-launcher torsocks nyx

# Docker
echo "[*] Installing Docker..."
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo usermod -aG docker $USER

# --- Go Tools ---
echo "[*] Installing Go-based tools..."
sudo apt install -y golang-go
export PATH=$PATH:~/go/bin

go install github.com/tomnomnom/assetfinder@latest

go install github.com/tomnomnom/httprobe@latest

go install github.com/projectdiscovery/httpx/cmd/httpx@latest

go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install github.com/OJ/gobuster/v3@latest

go install github.com/OWASP/Amass/v3/...@latest

go install github.com/khast3x/h8mail@latest

# --- Python Tools ---
echo "[*] Installing Python-based tools..."
pip3 install --upgrade pip
pip3 install youtube-dl yt-dlp shodan wafw00f webscreenshot \
    arjun xsrfprobe social-analyzer sherlock h8mail spiderfoot holehe \
    intelx leaklooker pypff

# --- GUI Tools ---
echo "[*] Installing GUI tools..."
sudo apt install -y \
    obsidian \
    wireshark zenmap burpsuite remmina filezilla gparted bleachbit \
    keepassxc meld geany terminator gnome-disk-utility \
    transmission-gtk gufw \
    vlc gimp inkscape audacity hexchat qbittorrent libreoffice \
    obs-studio simple-scan flameshot thunderbird \
    maltego

# --- Eye Candy ---
echo "[*] Setting up terminal eye-candy..."
echo "alias ls='exa -la --icons'" >> ~/.bashrc
echo "alias cat='batcat'" >> ~/.bashrc
echo "alias grep='rg'" >> ~/.bashrc
echo "alias ..='cd ..'" >> ~/.bashrc
echo "neofetch" >> ~/.bashrc

echo "[✓] Terminal and GUI tools (including OSINT) installed successfully. Restart your shell or run: source ~/.bashrc"
