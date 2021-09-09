# MosaicPlutoPlugin

A [Pluto.jl](https://plutojl.org/) plugin for [Mosaic](https://github.com/NyanCAD/Mosaic), for interactive exploration of schematics.

Mosaic is a web based schematic editor, and Pluto is a interactive Julia notebook server.
By binding the schematic editor to a Pluto variable, any modifications to the schematic will immeditely run any dependant cells.

https://user-images.githubusercontent.com/168609/132703936-feab4752-20ee-4676-993d-2727b078eda0.mp4

# Usage

Inside a Pluto notebook:
```
using MosaicPlutoPlugin

@bind data MosaicWidget("myschem")
```

See `notebook.jl` for an example.
