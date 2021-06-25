git clone https://github.com/bcpierce00/unison.git
 
git clone https://github.com/ocaml/ocaml.git
cd ocaml 
git checkout 4.11.1 
./configure --prefix ~/.local 
make world.opt -j 
make install 

cd ../unison
git checkout v2.51.3 
make -j 
cp src/unison ~/.local/bin/
cp src/unison-fsmonitor ~/.local/bin/ 
