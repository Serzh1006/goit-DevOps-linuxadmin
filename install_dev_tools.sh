VENV_DIR=".venv"

if command -v brew > /dev/null 2>&1; then
    echo "Homebrew already installed!"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if brew list --formula | grep -q '^python$'; then
    echo "Python already installed"
else
    echo "Installing Python..."
    brew install python
fi

if brew list --cask docker > /dev/null 2>&1; then
    echo "Docker already installed"
else
    echo "Installing Docker..."
    brew install --cask docker
fi


#Создаём venv, если его нет
if [ ! -d "$VENV_DIR" ]; then
  echo "Creating virtual environment..."
  python3 -m venv "$VENV_DIR"
else
  echo "Virtual environment already exists"
fi

source "$VENV_DIR/bin/activate"

if pip3 show django > /dev/null 2>&1; then
   echo "Django already installed"
else
   echo "Installing Django..."
   pip3 install django
fi

echo "Install completed."
brew --version
python3 --version
docker --version
pip3 show django
