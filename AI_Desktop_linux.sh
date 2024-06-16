 ________  ___          ___  ___  ________  _____ ______   _______           ________  _______   ________  ___      ___ _______   ________     
|\   __  \|\  \        |\  \|\  \|\   __  \|\   _ \  _   \|\  ___ \         |\   ____\|\  ___ \ |\   __  \|\  \    /  /|\  ___ \ |\   __  \    
\ \  \|\  \ \  \       \ \  \\\  \ \  \|\  \ \  \\\__\ \  \ \   __/|        \ \  \___|\ \   __/|\ \  \|\  \ \  \  /  / | \   __/|\ \  \|\  \   
 \ \   __  \ \  \       \ \   __  \ \  \\\  \ \  \\|__| \  \ \  \_|/__       \ \_____  \ \  \_|/_\ \   _  _\ \  \/  / / \ \  \_|/_\ \   _  _\  
  \ \  \ \  \ \  \       \ \  \ \  \ \  \\\  \ \  \    \ \  \ \  \_|\ \       \|____|\  \ \  \_|\ \ \  \\  \\ \    / /   \ \  \_|\ \ \  \\  \| 
   \ \__\ \__\ \__\       \ \__\ \__\ \_______\ \__\    \ \__\ \_______\        ____\_\  \ \_______\ \__\\ _\\ \__/ /     \ \_______\ \__\\ _\ 
    \|__|\|__|\|__|        \|__|\|__|\|_______|\|__|     \|__|\|_______|       |\_________\|_______|\|__|\|__|\|__|/       \|_______|\|__|\|__|
                                                                               \|_________|                                                    
                                                                                                                                                                                                                                   
#### This is a very basic Bash scrip and tested on Ubuntu 22.04, 24.04 and Pop!OS22.04 LTS
#### This is great for new build desktops
#### PopOS have an image which is already geared up for Nvidia setup
#### You can copy and modify the file for your own use

#!/bin/bash

# Define log file. Change the logfile location to suite your own needs
LOG_FILE="/home/{user}/setup_script.log"

# Redirect stdout and stderr to log file
exec > >(tee -i $LOG_FILE)
exec 2>&1

# Update and upgrade packages
apt-get update -y
apt-get upgrade -y

# Check and install Python
if which python3 &> /dev/null; then
  echo "Python3 is already installed"
else
  apt-get install -y python3
  echo "Python3 successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install pip
if which pip &> /dev/null; then
  echo "pip is already installed"
else
  apt-get install -y pip
  echo "pip successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install gcc
if which gcc &> /dev/null; then
  echo "gcc is already installed"
else
  apt-get install -y gcc
  echo "gcc successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install ubuntu-drivers-common
if which ubuntu-drivers-common &> /dev/null; then
  echo "ubuntu-drivers-common is already installed"
else
  apt-get install -y ubuntu-drivers-common
  echo "ubuntu-drivers-common successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install tensorman
if which tensorman &> /dev/null; then
  echo "tensorman is already installed"
else
  apt-get install -y tensorman
  echo "tensorman successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install CUDA Toolkit
if which cuda-version &> /dev/null; then
  echo "CUDA Toolkit is already installed"
else
  apt-get install -y cuda-toolkit
  echo "CUDA Toolkit successfully installed"
fi

# Check and install nvidia-container-toolkit
if which nvidia-container-toolkit &> /dev/null; then
  echo "nvidia-container-toolkit is already installed"
else
  apt-get install -y nvidia-container-toolkit
  echo "nvidia-container-toolkit successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Set default environment variables for Python3
export PYTHONPATH="/usr/local/lib/python3.8/site-packages"
export PATH="/usr/local/bin:$PATH"

# Set default environment variables for CUDA
export CUDA_HOME="/usr/local/cuda"
export PATH="$CUDA_HOME/bin:$PATH"

# Sleep for 5 seconds between each installation
sleep 5

# Check and install Visual Studio Code
if which code &> /dev/null; then
  echo "Visual Studio Code is already installed"
else
  apt-get install -y code
  echo "Visual Studio Code successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install nodejs
if which node &> /dev/null; then
  echo "nodejs is already installed"
else
  apt-get install -y nodejs
  echo "nodejs successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install npm
if which npm &> /dev/null; then
  echo "npm is already installed"
else
  apt-get install -y npm
  echo "npm successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install ufw
if which ufw &> /dev/null; then
  echo "ufw is already installed"
else
  apt-get install -y ufw
  echo "ufw successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Check and install chkrootkit
if which chkrootkit &> /dev/null; then
  echo "chkrootkit is already installed"
else
  apt-get install -y chkrootkit
  echo "chkrootkit successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

# Install pip and uvicorn
pip install uvicorn

# Sleep for 5 seconds between each installation
sleep 5

# Check and install htop
if which htop &> /dev/null; then
  echo "htop is already installed"
else
  apt-get install -y htop
  echo "htop successfully installed"
fi

# Sleep for 5 seconds between each installation
sleep 5

#Script Completed
echo "All tools successfully installed"

# Script complete
echo "Setup complete. See $LOG_FILE for details."
