## juliafinmetrix, stable version
# - automatically download julia packages
# - automatically download jupyter apps
# - any changes to packages and apps will be lost when session is over

julia --eval 'Pkg.update()'

# data packages
julia --eval 'Pkg.add("DataFrames")'
julia --eval 'Pkg.add("TimeSeries")'
julia --eval 'Pkg.add("DistributedArrays")'
julia --eval 'Pkg.add("IterableTables")'
julia --eval 'Pkg.add("RDatasets")'
julia --eval 'Pkg.add("NamedArrays")'

# plotting packages
julia --eval 'Pkg.add("Plots")'
julia --eval 'Pkg.add("StatPlots")'
julia --eval 'Pkg.add("GR")'
julia --eval 'Pkg.add("PlotlyJS")'

# convex optimization packages
julia --eval 'Pkg.add("Convex")'
julia --eval 'Pkg.add("SCS")'

julia --eval 'Pkg.clone("https://github.com/JuliaFinMetriX/DynAssMgmt.jl.git")'
julia --eval 'Pkg.clone("https://github.com/JuliaFinMetriX/EconDatasets.jl.git")'

cd $HOME

## get notebooks
git clone https://github.com/JuliaFinMetriX/JupyterApps.git

## create mount directory
mkdir ~/mount

