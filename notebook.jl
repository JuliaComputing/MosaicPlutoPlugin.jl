### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ a508bcb0-1172-11ec-102a-7f0663edc931
begin
    import Pkg
    Pkg.activate("/home/pepijn/code/juliacomp/MosaicPlutoPlugin")
    Pkg.add([
        Pkg.PackageSpec(name="Plots", version="1"),
        Pkg.PackageSpec(name="NgSpice", version="0.1"),
    ])
    using Plots, NgSpice, MosaicPlutoPlugin
end

# ╔═╡ a872cbb9-7831-4549-b84b-bf3d8c3f7dd9
@bind data MosaicWidget("myschem")

# ╔═╡ dac36764-b09c-4c99-9d88-80979e17114e
data

# ╔═╡ c4fe7c3a-2ebe-40cb-b74e-23bf4b9e8690
NgSpice.init()

# ╔═╡ 5e7a8c2d-12e7-448e-aa79-ec18e5642b12
nl = split(data, "\n")

# ╔═╡ d6c9a88e-be9d-4a8b-9d99-9196bd2fb9b6
res = begin
		NgSpice.load_netlist(nl)
		NgSpice.cmd("ac dec 10 1 10meg")
		vecs = NgSpice.listcurvecs()
		Dict(map(x->x=>NgSpice.getvec(x)[3], vecs))
end

# ╔═╡ 0ddbd7ef-21be-41c1-8452-c1c2f2d819ea
plot(real(res["frequency"]), abs.(res["out"]); xaxis=:log, yaxis=:log)

# ╔═╡ Cell order:
# ╠═0ddbd7ef-21be-41c1-8452-c1c2f2d819ea
# ╠═a872cbb9-7831-4549-b84b-bf3d8c3f7dd9
# ╠═dac36764-b09c-4c99-9d88-80979e17114e
# ╠═c4fe7c3a-2ebe-40cb-b74e-23bf4b9e8690
# ╠═5e7a8c2d-12e7-448e-aa79-ec18e5642b12
# ╠═d6c9a88e-be9d-4a8b-9d99-9196bd2fb9b6
# ╠═a508bcb0-1172-11ec-102a-7f0663edc931
