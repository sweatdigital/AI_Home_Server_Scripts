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

LOG_FILE="/home/mike/Workspace/open-webui_install.log"

# Change directory to backend folder
cd /home/mike/Workspace/open-webui/backend || { echo "Error: Unable to change into backend directory"; exit 1; }

# Install dependencies using pip
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

