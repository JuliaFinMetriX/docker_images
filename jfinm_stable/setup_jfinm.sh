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
julia --eval 'Pkg.clone("https://github.com/plotly/Plotly.jl")'


julia --eval 'Pkg.add("EconDatasets")'
julia --eval 'Pkg.add("TimeData")'

julia --eval 'Pkg.clone("https://github.com/JuliaFinMetriX/WorldBankDataTd.jl.git")'
julia --eval 'Pkg.clone("https://github.com/JuliaFinMetriX/Econometrics.jl.git")'
julia --eval 'Pkg.clone("https://github.com/JuliaFinMetriX/Copulas.jl.git")'
julia --eval 'Pkg.clone("https://github.com/JuliaFinMetriX/JFinM_Charts.git")'

cd $HOME/.julia/v0.3/Copulas

## install cpp library
make

cd $HOME

## get notebooks
git clone https://github.com/cgroll/ijuliaNb.git ijuliaNb

## create mount directory
mkdir ~/mount

