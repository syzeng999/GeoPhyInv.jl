using GeoPhyInv
using SparseArrays
using StatsBase
using LinearAlgebra
using Random
using ProgressMeter
using LinearAlgebra
using Test
using ForwardDiff
using Calculus

nx=21
nz=21
nt=4
nznx=nz*nx
mgrid=[range(-div(nz,2), step=1.0, length=nz), range(-div(nx,2), step=1.0, length=nx)]
tgrid=range(0.0,step=0.5, length=nt)
@info "Grids are all set."

Qv=abs.(randn(nz,nx))
η=abs.(randn(nz,nx))
k=abs.(randn(nz,nx))
σ=abs.(randn(nz,nx))
p=randn(nz,nx,nt)
@info "Medium parameters allocated."

ageom=AGeom(mgrid, SSrcs(1), Srcs(1), Recs(30))
update!(ageom, SSrcs(), [0,0], 5, [0,2π])
update!(ageom, Recs(), [0,0], 5, [0,2π])
ACQ=GeoPhyInv.ACQmat(ageom,mgrid);
@info "ACQ will be used to project ψ onto receivers."

paE=PoissonExpt(p, tgrid, mgrid, Qv, k, η, σ, ACQ)
GeoPhyInv.mod!(paE)

data=paE[:data]
@info string("The dimensions of data are (nt,nr)=",size(data))

