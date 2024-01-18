{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs  # Node.js
    pkgs.electron     # Electron
    pkgs.nodePackages.yarn2nix # Yarn2Nix
    pkgs.yarn         # Yarn
    pkgs.python312    # Python 3.12
    pkgs.git          # Git
  ];

  shellHook = ''
    echo "Creating and activating Python virtual environment..."
    python -m venv bespoke_env
    source bespoke_env/bin/activate

    echo "Installing Python packages..."
    pip install towhee pymilvus==2.2.11 pandas numpy transformers torch

    echo "Cloning repository..."
    git clone https://github.com/C0deMunk33/bespoke_automata || true

    echo "Installation completed successfully."
  '';
}
