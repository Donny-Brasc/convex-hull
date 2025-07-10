using Random
using Plots
n=10000 #     tedade gaam
D=1 #          standard deviation
tedad=50000000
cor=[]
println("Start!")
for j in 1:tedad
    x1=0
    y1=0
    for i in 1:n
        x1=x1+D*randn()
        y1=y1+D*randn()
    end
    append!(cor,x1,y1)
    #println(j)
    if j%500000==0
    println(j/500000,"%")
    end
end
pathx=[]
pathy=[]
for i in 1:2:size(cor)[1]
    append!(pathx,cor[i])
end
for i in 2:2:size(cor)[1]
    append!(pathy,cor[i])
end
println("Steps=",n)
println("Deviation=",D)
println("Particles number=",tedad)
#Plots.default(size=(20000,20000))
#scatter(pathx,pathy,label=false)
#display(scatter!((0,0), label="Start"))
heatmap_data=histogram2d(pathx,pathy,nbins=300)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 300bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=350)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 350 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=400)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 400 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=450)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 450 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=500)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 500 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=600)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 600 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=800)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 800 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=1000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 1000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=2000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 2000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=3000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 3000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=5000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 5000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=10000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 10,000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=30000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 30,000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=50000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 50,000 bin.png")
heatmap_data=histogram2d(pathx,pathy,nbins=100000)
heatmap(heatmap_data)
savefig("5e7 perfume heatmap 100,000 bin.png")
println("Finito!")