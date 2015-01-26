# script to build julia from scratch with Cxx

# Add the Julia PPA
RUN apt-get install -y -o DPkg::Options::=--force-confold apt-utils python-software-properties software-properties-common \
    && apt-add-repository -y ppa:staticfloat/julianightlies \
    && add-apt-repository -y ppa:staticfloat/julia-deps \
    && apt-get update \
    && apt-get install -y julia \
    && apt-get clean


docker run -it txcore:7/jbox

sudo apt-get install  -y -o DPkg::Options::=--force-confold apt-utils python-software-properties software-properties-common
sudo add-apt-repository -y ppa:staticfloat/julia-deps

sudo apt-get update
sudo apt-get upgrade
git clone https://github.com/JuliaLang/julia.git

touch Make.user
echo "override LLDB_VER=master" >> Make.user
echo "override LLVM_VER=svn" >> Make.user
echo "override LLVM_ASSERTIONS=1" >> Make.user
echo "override BUILD_LLVM_CLANG=1" >> Make.user
echo "override BUILD_LLDB=1" >> Make.user
echo "override USE_LLVM_SHLIB=1" >> Make.user
echo "override LLDB_DISABLE_PYTHON=1" >> Make.user

sudo apt-get -y install gfortran
sudo apt-get -y install libedit-dev
sudo apt-get -y install m4
sudo apt-get -y install cmake

cd julia

# 
make

# run julia tests
make testall

# start julia
/julia/usr/bin/julia
