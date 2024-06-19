#!/bin/bash

# Install prerequisites
sudo apt update
sudo apt upgrade

# Install dependencies
sudo apt install -y python3-dev python3-venv python3-babel git build-essential libxslt-dev zlib1g-dev libffi-dev libssl-dev nginx uwsgi uwsgi-plugin-python3

# Set up SearXNG
sudo useradd --shell /bin/bash --system --home-dir "/usr/local/searxng" --comment 'Privacy-respecting metasearch engine' searxng
sudo mkdir "/usr/local/searxng"
sudo chown -R "searxng:searxng" "/usr/local/searxng"

# Clone SearXNG repository as the searxng user
sudo -H -u searxng -i
git clone "https://github.com/searxng/searxng" "/usr/local/searxng/searxng-src"

# Create a Python virtual environment and install SearXNG
python3 -m venv "/usr/local/searxng/searx-pyenv"
echo ". /usr/local/searxng/searx-pyenv/bin/activate" >> "/usr/local/searxng/.profile"
source "/usr/local/searxng/.profile"
cd "/usr/local/searxng/searxng-src"
source /usr/local/searxng/searx-pyenv/bin/activate
pip install pyyaml
pip install -e .
pip install -e .

# Configure and run SearXNG
sudo cp "/usr/local/searxng/searxng-src/searx/settings.yml" "/etc/searxng/settings.yml"
cd /searxng-sr
sudo -u searxng /usr/local/searxng/searx-pyenv/bin/python searx/webapp.py



