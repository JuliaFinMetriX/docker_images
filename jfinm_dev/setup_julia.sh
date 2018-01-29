## juliafinmetrix, development version
# - own julia packages are not downloaded in order to be able to edit them
# - own julia packages are automatically mounted

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

## set up links to packages that are automatically mounted
mkdir ~/scalable/
mkdir ~/scalable/julia

# create symbolic links to packages that will be automatically mounted
ln -s ~/scalable/julia/EconDatasets/ /juliapro/bin/JuliaPro-0.6.2.1/JuliaPro/pkgs-0.6.2.1/v0.6/
ln -s ~/scalable/julia/DynAssMgmt/ /juliapro/bin/JuliaPro-0.6.2.1/JuliaPro/pkgs-0.6.2.1/v0.6/

## create mount directory
mkdir ~/mount
