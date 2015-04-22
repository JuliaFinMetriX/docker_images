## install Julia packages
julia --eval 'Pkg.update()'
julia --eval 'Pkg.add("Dates")'
julia --eval 'Pkg.add("DataArrays")'
julia --eval 'Pkg.add("DataFrames")'
julia --eval 'Pkg.add("TimeSeries")'
julia --eval 'Pkg.add("MAT")'
julia --eval 'Pkg.add("Quandl")'
julia --eval 'Pkg.add("Taro")'
julia --eval 'Pkg.add("GLM")'
julia --eval 'Pkg.add("Distributions")'
julia --eval 'Pkg.add("Debug")'
julia --eval 'Pkg.add("NLopt")'
julia --eval 'Pkg.add("JuMP")'
julia --eval 'Pkg.add("Gadfly")'
julia --eval 'Pkg.add("Winston")'
julia --eval 'Pkg.add("Docile")'
julia --eval 'Pkg.add("Lexicon")'
julia --eval 'Pkg.clone("https://github.com/plotly/Plotly.jl")'
julia --eval 'Pkg.clone("https://github.com/one-more-minute/Requires.jl.git")'

## set up links to packages that need to be edited
mkdir ~/research/
mkdir ~/research/julia

ln -s ~/research/julia/Copulas/ ~/.julia/v0.3/
ln -s ~/research/julia/EconDatasets/ ~/.julia/v0.3/
ln -s ~/research/julia/Econometrics/ ~/.julia/v0.3/
ln -s ~/research/julia/TimeData/ ~/.julia/v0.3/
ln -s ~/research/julia/WorldBankDataTd/ ~/.julia/v0.3/
ln -s ~/research/julia/AssetMgmt/ ~/.julia/v0.3/
ln -s ~/research/julia/JFinM_Charts/ ~/.julia/v0.3/

## create mount directory
mkdir ~/mount