FROM nix

WORKDIR /workdir
COPY ./default.nix .
RUN nix-shell default.nix