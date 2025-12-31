
### **2. install.sh** (One-command installer)
```bash
#!/bin/bash

# ALBIN VPS Creator - One Command Installer

echo "🚀 Installing ALBIN VPS Creator for Firebase Cloud Shell..."

# Download the script
curl -L "https://raw.githubusercontent.com/albinvps/firebase-vps/main/vps-creator.sh" -o ~/vps-creator.sh

# Make executable
chmod +x ~/vps-creator.sh

# Create directory structure
mkdir -p ~/.albin-vps/{instances,backups,config}

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║        INSTALLATION COMPLETE!            ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "Run: ./vps-creator.sh"
echo ""
echo "Features:"
echo "✅ Real root@hostname prompt"
echo "✅ Boot sequence simulation"
echo "✅ 24/7 background operation"
echo "✅ Multiple VPS instances"
echo ""
echo "Your VPS will survive browser close and run 24/7!"
