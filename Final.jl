using Random
using Plots
n=1000 #     tedade gaam
D=1 #          standard deviation
r=0.01 #         resetting rate
path=zeros(2)
rcounter=0
for i in 1:2:2*n-2
    global rcounter
    if rand() >= r
        append!(path,path[i]+D*randn())
        append!(path,path[i+1]+D*randn())
    else
        append!(path,zeros(2))
        rcounter=rcounter+1
    end
end
pathx=[]
pathy=[]
for i in 1:2:size(path)[1]
    append!(pathx,path[i])
end
for i in 2:2:size(path)[1]
    append!(pathy,path[i])
end
#convex hall:
coor=path
function collide(x1,y,x2,x3,y3,x4,y4)
    a2=(y3-y4)/(x3-x4)
    b2=y3-a2*x3
    if a2==0
        return 0
    end
    if x3!=x4
        xcol=(y-b2)/a2
    else
        xcol=x3
    end
    if y3>y4
        y3,y4=y4,y3
    end
    if x1<=xcol<=x2 && y3<=y<=y4
        return 1
    end
    return 0
end
xmin=-1000000000000000000000000
xmax=10000000000000000000000000000
function tooshe(arrtooshe,x1,y1)
    append!(arrtooshe,arrtooshe[1:2])
    flagchap=0
    flagrast=0
    for i in 1:2:size(arrtooshe)[1]-2
        if collide(xmin,y1,x1,arrtooshe[i],arrtooshe[i+1],arrtooshe[i+2],arrtooshe[i+3])==1
            flagchap=1
            break
        end
    end
    if flagchap==0
        deleteat!(arrtooshe,[size(arrtooshe)[1]-1,size(arrtooshe)[1]])
        return 0
    end
    for i in 1:2:size(arrtooshe)[1]-2
        if collide(x1,y1,xmax,arrtooshe[i],arrtooshe[i+1],arrtooshe[i+2],arrtooshe[i+3])==1
            flagrast=1
            break
        end
    end
    if flagrast==0
        deleteat!(arrtooshe,[size(arrtooshe)[1]-1,size(arrtooshe)[1]])
        return 0
    else
        deleteat!(arrtooshe,[size(arrtooshe)[1]-1,size(arrtooshe)[1]]) # wft???
        return 1
    end
end
function mysort(arrsort)
    sortedcor=[]
    xavg=0
    yavg=0
    for i in 1:2:size(arrsort)[1]
        xavg=xavg+arrsort[i]
    end
    for i in 2:2:size(arrsort)[1]
        yavg=yavg+arrsort[i]
    end
    yavg=yavg/size(arrsort)[1]*2
    xavg=xavg/size(arrsort)[1]*2
    theta=[]
    for i in 2:2:size(arrsort)[1]
        append!(theta,atan(arrsort[i]-yavg,arrsort[i-1]-xavg),Int(i/2))
    end
    locate=0
    for i in Int(size(theta)[1]/2):-1:2
        biggest=theta[1],theta[2]
        locate=1
        for j in 3:2:2*i
            if theta[j]>biggest[1]
                biggest=theta[j],theta[j+1]
                locate=j
            elseif theta[j]==biggest[1]
                if arrsort[theta[j+1]*2-1]^2+arrsort[theta[j+1]*2]^2>arrsort[biggest[2]*2]^2+arrsort[biggest[2]*2-1]^2  #noghte ham zavie
                    biggest=theta[j],theta[j+1]
                    locate=j
                end
            end
        end
        append!(sortedcor,[arrsort[biggest[2]*2-1],arrsort[biggest[2]*2]]) 
        deleteat!(theta,[locate,locate+1])
    end
    append!(sortedcor,[arrsort[theta[2]*2-1],arrsort[theta[2]*2]])
    return sortedcor
end
cor=[]
append!(cor,coor[1:6])
cor=mysort(cor)
for i in 7:2:size(coor)[1]
    global cor
    if tooshe(cor,coor[i],coor[i+1])==0
        append!(cor,coor[i:i+1])
        cor=mysort(cor)
        j=1
        while j<size(cor)[1]
            tempcor=copy(cor)
            deleteat!(tempcor,[j,j+1])
            if tooshe(tempcor,cor[j],cor[j+1])==0
                j=j+2
            else
                deleteat!(cor,[j,j+1])
            end
        end  
    end
end
function mohit(arrmo)
    perimeter=0
    for i in 1:2:size(arrmo)[1]-2
        perimeter=perimeter+ (abs(arrmo[i]-arrmo[i+2])^2 + abs(arrmo[i+1]-arrmo[i+3])^2)^0.5
    end
    return perimeter
end
function cross(arrcross)
    return abs(arrcross[1]*arrcross[4]-arrcross[2]*arrcross[3])
end
function masahat(arrmas)
    vectors=[]
    for i in 3:2:size(arrmas)[1]
        append!(vectors,arrmas[i]-arrmas[1],arrmas[i+1]-arrmas[2])
    end
    area=0
    for i in 1:2:size(arrmas)[1]-5
        area=cross(vectors[i:i+3])/2+area
    end
    return area
end
println("final coordinates=",cor)
append!(cor,cor[1],cor[2]) #################
corx=[]
cory=[]
for i in 1:2:size(cor)[1]
    append!(corx,cor[i])
end
for i in 2:2:size(cor)[1]
    append!(cory,cor[i])
end
mas=masahat(cor)
moh=mohit(cor)
println("\nPerimeter=",moh)
println("Area=", mas)
println("Steps=",n)
println("Deviation=",D)
println("Resetting rate=", r)
println("Reset times=", rcounter)
Plots.default(size=(1000,1000))
plot(corx,cory,label=false , title=( " n =", n ,"\nArea = ", mas,"\n Perimeter = " , moh))
scatter!(corx,cory,label=false)
plot!(pathx,pathy,label=false)
scatter!((path[2*n-1],path[2*n]), label="End")
display(scatter!((0,0), label="Start"))
#heatmap_data=histogram2d(pathx,pathy,nbins=300)
#heatmap(heatmap_data)
#savefig("e7 with reset ultra hi res.png")