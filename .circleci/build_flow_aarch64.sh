#!/bin/bash
apt-get update
apt-get install -y opam git wget curl build-essential m4 zip
echo | sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
opam init --disable-sandboxing --reinit -ni -y
eval $(opam env)
cd /flow
if [ ! -d _opam ]; then
  opam switch create . 4.07.1 --deps-only -y
fi
eval $(opam env)
make bin/flow dist/flow.zip
mkdir -p bin/linux-aarch64 && cp bin/flow bin/linux-aarch64/flow
