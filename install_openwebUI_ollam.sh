 ________  ________  _______   ________   ___       __   _______   ________          ________  ________  ___       __   _______   ________  _______   ________     
|\   __  \|\   __  \|\  ___ \ |\   ___  \|\  \     |\  \|\  ___ \ |\   __  \        |\   __  \|\   __  \|\  \     |\  \|\  ___ \ |\   __  \|\  ___ \ |\   ___ \    
\ \  \|\  \ \  \|\  \ \   __/|\ \  \\ \  \ \  \    \ \  \ \   __/|\ \  \|\ /_       \ \  \|\  \ \  \|\  \ \  \    \ \  \ \   __/|\ \  \|\  \ \   __/|\ \  \_|\ \   
 \ \  \\\  \ \   ____\ \  \_|/_\ \  \\ \  \ \  \  __\ \  \ \  \_|/_\ \   __  \       \ \   ____\ \  \\\  \ \  \  __\ \  \ \  \_|/_\ \   _  _\ \  \_|/_\ \  \ \\ \  
  \ \  \\\  \ \  \___|\ \  \_|\ \ \  \\ \  \ \  \|\__\_\  \ \  \_|\ \ \  \|\  \       \ \  \___|\ \  \\\  \ \  \|\__\_\  \ \  \_|\ \ \  \\  \\ \  \_|\ \ \  \_\\ \ 
   \ \_______\ \__\    \ \_______\ \__\\ \__\ \____________\ \_______\ \_______\       \ \__\    \ \_______\ \____________\ \_______\ \__\\ _\\ \_______\ \_______\
    \|_______|\|__|     \|_______|\|__| \|__|\|____________|\|_______|\|_______|        \|__|     \|_______|\|____________|\|_______|\|__|\|__|\|_______|\|_______|
                                                                                                                                                                   
                                                                                                                                                                   
                                                                                                                                                                   
 ________      ___    ___                                                                                                                                          
|\   __  \    |\  \  /  /|                                                                                                                                         
\ \  \|\ /_   \ \  \/  / /                                                                                                                                         
 \ \   __  \   \ \    / /                                                                                                                                          
  \ \  \|\  \   \/  /  /                                                                                                                                           
   \ \_______\__/  / /                                                                                                                                             
    \|_______|\___/ /                                                                                                                                              
             \|___|/                                                                                                                                               
                                                                                                                                                                   
                                                                                                                                                                   
 ________  ___       ___       ________  _____ ______   ________                                                                                                   
|\   __  \|\  \     |\  \     |\   __  \|\   _ \  _   \|\   __  \                                                                                                  
\ \  \|\  \ \  \    \ \  \    \ \  \|\  \ \  \\\__\ \  \ \  \|\  \                                                                                                 
 \ \  \\\  \ \  \    \ \  \    \ \   __  \ \  \\|__| \  \ \   __  \                                                                                                
  \ \  \\\  \ \  \____\ \  \____\ \  \ \  \ \  \    \ \  \ \  \ \  \                                                                                               
   \ \_______\ \_______\ \_______\ \__\ \__\ \__\    \ \__\ \__\ \__\                                                                                              
    \|_______|\|_______|\|_______|\|__|\|__|\|__|     \|__|\|__|\|__|                                                                                              
                                                                                                                                                                   
 
#!/bin/bash
#@STCGoal Install and configure openwebui
#@STCIssue None

# Note change directory for your logfile
LOG_FILE="/home/mike/Workspace/open-webui_install.log"

# Change the directory where your open-webui is
cd /home/mike/Workspace/open-webui || { echo "Error: Unable to change into Workspace directory"; exit 1; }

# Copy .env.example to .env only if .env does not exist
if [ ! -f ".env" ]; then
  cp -RPp .env.example .env | tee -a $LOG_FILE
else
  echo "Skipping .env file copy, as it already exists." | tee -a $LOG_FILE
fi

# Install dependencies using npm
npm i --silent | tee -a $LOG_FILE
if [ $? -eq 0 ]; then
  echo "NPM installation successful!" | tee -a $LOG_FILE
else
  echo "NPM installation failed!" | tee -a $LOG_FILE
fi

sleep 8

# Build frontend using Node
npm run build --silent | tee -a $LOG_FILE
if [ $? -eq 0 ]; then
  echo "Build successful!" | tee -a $LOG_FILE
else
  echo "Build failed!" | tee -a $LOG_FILE
fi
sleep 8

# Install required packages using pip
pip install uvicorn --quiet | tee -a $LOG_FILE
if [ $? -eq 0 ]; then
  echo "Uvicorn installation successful!" | tee -a $LOG_FILE
else
  echo "Uvicorn installation failed!" | tee -a $LOG_FILE
fi

sleep 8

# Install BeautifulSoup
pip install beautifulsoup4 --quiet | tee -a $LOG_FILE
if [ $? -eq 0 ]; then
  echo "BeautifulSoup installation successful!" | tee -a $LOG_FILE
else
  echo "BeautifulSoup installation failed!" | tee -a $LOG_FILE
fi

sleep 8

# Install required packages using pip (again)
pip install -r requirements.txt -U --quiet | tee -a $LOG_FILE
if [ $? -eq 0 ]; then
  echo "Requirements installation successful!" | tee -a $LOG_FILE
else
  echo "Requirements installation failed!" | tee -a $LOG_FILE
fi

sleep 8

# Check if curl is installed, install it if not
if ! command -v curl &> /dev/null; then
  echo "Curl is not installed, installing now..." | tee -a $LOG_FILE
  apt-get update && apt-get install -y curl || { echo "Error: Unable to install curl"; exit 1; }
else
  echo "Curl is already installed!" | tee -a $LOG_FILE
fi

# Check if http://127.0.0.1:11434 is running, install Ollama if not
if ! curl --silent --head http://127.0.0.1:11434 | grep -q "200 OK"; then
  echo "Ollama installation skipped as it's already running." | tee -a $LOG_FILE
else
  # Install Ollama
  curl -fsSL https://ollama.com/install.sh | sh --quiet | tee -a $LOG_FILE
  if [ $? -eq 0 ]; then
    echo "Ollama installation successful!" | tee -a $LOG_FILE
  else
    echo "Ollama installation failed!" | tee -a $LOG_FILE
  fi
fi
