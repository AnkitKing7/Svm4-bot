#!/bin/bash

# ==============================================================================
#  PROJECT     : SVM V4 BOT (ADVANCED AUTOMATION)
#  DESCRIPTION : COMPLETE LXD & PYTHON DEPENDENCY INSTALLER
#  DEVELOPER   : ANKIT
#  VERSION     : 4.0
# ==============================================================================

clear

# Color Definitions
BLUE='\033[1;34m'
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# --- LONG SIZE ASCII TITLE ---
echo -e "${CYAN}"
echo "  SSSSSSSSSSSSSSS vvvvvvv           vvvvvvv mmmmmmm    mmmmmmm   "
echo " SS:::::::::::::::S v:::::v         v:::::v  m:::::m  m:::::m    "
echo "S:::::SSSSSS::::::S  v:::::v       v:::::v   m::::::mm::::::m    "
echo "S:::::S     SSSSSSS   v:::::v     v:::::v    m::::::::::::::m    "
echo "S:::::S                v:::::v   v:::::v     m:::::mm:::::mm:::::m "
echo " S::::SSSS              v:::::v v:::::v      m::::m  m::::m  m::::m "
echo "  SS::::::SSSSS          v:::::v:::::v       m::::m  m::::m  m::::m "
echo "    SSS::::::::SS         v:::::::::v        m::::m  m::::m  m::::m "
echo "       SSSSSS::::S         v:::::::v         m::::m  m::::m  m::::m "
echo "            S:::::S         v:::::v          m::::m  m::::m  m::::m "
echo "            S:::::S          v:::v           m::::m  m::::m  m::::m "
echo "SSSSSSS     S:::::S           v:v            m::::m  m::::m  m::::m "
echo "S::::::SSSSSS:::::S            v             m::::m  m::::m  m::::m "
echo "S:::::::::::::::SS                                                   "
echo " SSSSSSSSSSSSSSS       V V V V V V V V V V      V V V V V V V V V V  "
echo -e "${NC}"

echo -e "${BLUE}======================================================================${NC}"
echo -e "${YELLOW}                 PRODUCT: SVM V4 BOT SYSTEM                          ${NC}"
echo -e "${GREEN}                 DEVELOPED BY: ANKIT                                 ${NC}"
echo -e "${BLUE}======================================================================${NC}"
echo ""

# --- COMMANDS EXECUTION ---

echo -e "${CYAN}[*] Step 1: Updating System & Installing Tools...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install lxc lxc-utils bridge-utils uidmap snapd -y
sudo systemctl enable --now snapd.socket

echo -e "${CYAN}[*] Step 2: Setting up LXD Container Engine...${NC}"
sudo snap install lxd
sudo usermod -aG lxd $USER
# Non-interactive init
sudo lxd init --auto

echo -e "${CYAN}[*] Step 3: Installing Python & Library Dependencies...${NC}"
sudo apt install python3-pip -y
pip install -U discord.py aiohttp playwright
playwright install chromium
sudo playwright install-deps

echo -e "${CYAN}[*] Step 4: Finalizing Setup...${NC}"
sudo apt update

echo -e "${GREEN}"
echo "----------------------------------------------------------------------"
echo " SETUP COMPLETED! SVM V4 BOT IS READY TO DEPLOY."
echo " DEVELOPER: ANKIT | ENJOY YOUR AUTOMATION."
echo "----------------------------------------------------------------------"
echo -e "${NC}"

# --- EXECUTION ---
if [ -f "v4.py" ]; then
    echo -e "${YELLOW}>>> Launching v4.py...${NC}"
    python3 v4.py
else
    echo -e "${RED}[!] Error: v4.py not found in this directory!${NC}"
fi
