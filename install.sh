#!/bin/bash

# FIREBASE REAL VPS INSTALLER
# Installs the complete 24/7 VPS system

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
cat << "EOF"
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║  ███████╗██╗██████╗ ███████╗██████╗  █████╗ ███████╗    ║
║  ██╔════╝██║██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝    ║
║  █████╗  ██║██████╔╝█████╗  ██████╔╝███████║███████╗    ║
║  ██╔══╝  ██║██╔══██╗██╔══╝  ██╔══██╗██╔══██║╚════██║    ║
║  ██║     ██║██║  ██║███████╗██║  ██║██║  ██║███████║    ║
║  ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ║
║                                                          ║
║  🔥 REAL 24/7 VPS CREATOR - INSTALLATION                ║
╚══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${GREEN}📦 Installing Firebase Real VPS Creator...${NC}"
echo -e "${BLUE}==========================================${NC}"

# Create installation directory
INSTALL_DIR="$HOME/firebase-real-vps"
echo -e "${YELLOW}Installation directory: $INSTALL_DIR${NC}"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed!${NC}"
    echo -e "${YELLOW}Installing Node.js...${NC}"
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

echo -e "${GREEN}✅ Node.js version: $(node --version)${NC}"

# Create directory structure
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Create package.json
echo -e "${YELLOW}Creating package.json...${NC}"
cat > package.json << 'EOF'
{
  "name": "firebase-real-vps",
  "version": "2.0.0",
  "description": "Real 24/7 VPS Creator for Firebase Cloud Shell",
  "main": "vps-manager.js",
  "scripts": {
    "start": "node vps-manager.js",
    "vps": "node vps-manager.js",
    "create": "node vps-manager.js create",
    "list": "node vps-manager.js list",
    "dashboard": "node vps-manager.js dashboard"
  },
  "dependencies": {
    "uuid": "^9.0.0"
  },
  "keywords": ["vps", "firebase", "cloud-shell", "24/7", "ubuntu", "debian", "centos"],
  "author": "Firebase VPS Creator",
  "license": "MIT"
}
EOF

# Install dependencies
echo -e "${YELLOW}Installing dependencies...${NC}"
npm install uuid

# Download the main VPS manager
echo -e "${YELLOW}Downloading VPS manager...${NC}"
curl -s -o vps-manager.js https://raw.githubusercontent.com/example/firebase-real-vps/main/vps-manager.js

# Make it executable
chmod +x vps-manager.js

# Create alias for easy access
echo -e "${YELLOW}Creating system aliases...${NC}"
cat >> ~/.bashrc << 'EOF'

# Firebase Real VPS Aliases
alias vps-create='cd ~/firebase-real-vps && node vps-manager.js create'
alias vps-list='cd ~/firebase-real-vps && node vps-manager.js list'
alias vps-start='cd ~/firebase-real-vps && node vps-manager.js start'
alias vps-ssh='cd ~/firebase-real-vps && node vps-manager.js ssh'
alias vps-status='cd ~/firebase-real-vps && node vps-manager.js status'
alias vps-dashboard='cd ~/firebase-real-vps && node vps-manager.js dashboard'
alias vps='cd ~/firebase-real-vps && node vps-manager.js'
EOF

# Create quick start script
cat > quick-start.sh << 'EOF'
#!/bin/bash
cd ~/firebase-real-vps
node vps-manager.js "$@"
EOF
chmod +x quick-start.sh

# Create desktop notification script
cat > notify-vps.sh << 'EOF'
#!/bin/bash
echo "=========================================="
echo "🔥 FIREBASE REAL VPS SYSTEM"
echo "=========================================="
echo "Your VPS instances are running 24/7!"
echo ""
echo "Quick commands:"
echo "  vps-create    - Create new VPS"
echo "  vps-list      - List all VPS"
echo "  vps-ssh <name>- SSH into VPS"
echo "  vps-status    - Check system status"
echo "  vps           - Open VPS manager"
echo ""
echo "Storage: ~/firebase-real-vps"
echo "=========================================="
EOF
chmod +x notify-vps.sh

echo -e "${GREEN}✅ Installation completed successfully!${NC}"
echo -e "${BLUE}==========================================${NC}"
echo -e "${CYAN}🚀 QUICK START:${NC}"
echo -e "${YELLOW}1. Reload your shell:${NC} source ~/.bashrc"
echo -e "${YELLOW}2. Start VPS manager:${NC} vps"
echo -e "${YELLOW}3. Create your first VPS:${NC} vps-create"
echo -e "${BLUE}==========================================${NC}"
echo -e "${GREEN}🎉 Enjoy your 24/7 REAL VPS on Firebase Cloud Shell!${NC}"

# Reload bashrc
source ~/.bashrc 2>/dev/null || true
