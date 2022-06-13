### A Pluto.jl notebook ###
# v0.19.8

using Markdown
using InteractiveUtils

# ╔═╡ c0770319-978d-42c4-bf84-a50364db313e
begin
	# grid generation
	nxg = 11
	nyg = 11
	dxg = 0.1
	dyg = 0.1
	xg = zeros(nxg)
	yg = zeros(nyg)
	nxyg = nxg*nyg
	for ix in eachindex(xg)
		xg[ix] = 0 + (ix - 1)*dxg
	end
	for iy in eachindex(yg)
		yg[iy] = 0 + (iy - 1)*dyg
	end
	(xmin, xmax) = (xg[begin], xg[end])
	(ymin, ymax) = (yg[begin], yg[end])
		(xmin, xmax, ymin, ymax)
end

# ╔═╡ 53adbf14-bbfe-406d-ac43-91807747fac4
begin
	ρ = 1.0
	C = 1.0
	ρC = ρ*C
	k = 1.0
	α = k/ρC
end

# ╔═╡ d5acaec8-f748-46f7-9c86-68a822583d8f
begin
	# control volume
	# E → W → N → S
	idE = 1
	idW = 2
	idN = 3
	idS = 4
	nx = nxg - 1
	ny = nyg - 1
	nxy = nx*ny
	x = zeros(nx)
	y = zeros(ny)
	q = zeros((nx, ny))
	dV = zeros((nx, ny))
	dSx = zeros((nx, ny))
	dSy = zeros((nx, ny))
	dV = zeros((nx, ny))
	anbT = zeros((nx, ny, 4))
	acT = zeros((nx, ny))
	dnb = zeros((nx, ny, 4))
	for ix in eachindex(x)
		x[ix] = (xg[ix] + xg[ix + 1])/2
		dSy[ix,:] .= (xg[ix + 1] - xg[ix])

		xE = ((ix + 1 <= nx) ? x[ix + 1] : xg[end])
		xW = ((ix - 1 >= 1)  ? x[ix - 1] : xg[begin])
		dnb[ix,:,idE] .= xE - x[ix]
		dnb[ix,:,idW] .= x[ix] - xW
	end
	for iy in eachindex(y)
		y[iy] = (yg[iy] + yg[iy + 1])/2
		dSx[:,iy] .= (yg[iy + 1] - yg[iy])

		yN = ((iy + 1 <= ny) ? y[iy + 1] : yg[end])
		yS = ((iy - 1 >= 1)  ? y[iy - 1] : yg[begin])
		dnb[:,iy,idN] .= yN - y[iy]
		dnb[:,iy,idS] .= y[iy] - yS
	end
	for ix in eachindex(x)
		for iy in eachindex(y)
			dV[ix,iy] = dSx[ix, iy]*dSy[ix,iy]
		end
	end
end

# ╔═╡ d70e2902-08d0-45b8-8705-2f5b6c238c60
begin
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═c0770319-978d-42c4-bf84-a50364db313e
# ╠═53adbf14-bbfe-406d-ac43-91807747fac4
# ╠═d5acaec8-f748-46f7-9c86-68a822583d8f
# ╠═d70e2902-08d0-45b8-8705-2f5b6c238c60
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
