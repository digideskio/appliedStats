year <-c(1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009)

# US spending on science, space, and technology
spending <- c(18079,18594,19753,20734,20831,23029,23597,23584,25525,27731,29449)

# Suicides by hanging, strangulation and suffocation
suicides <- c(5427,5688,6198,6462,6635,7336,7248,7491,8161,8578,9000)

y=c(seq(from=18000, to=30000, by=3000))
ylab=c(seq(from=5000, to=9000, by=1000))
par(mar=c(5, 4, 4, 5) + 0.1)

plot(year,spending,type="o",col="red",
     xlim=c(1999,2009),ylim=c(18000,30000), yaxt="n",xaxt="n", ylab="")
points(year,suicides/0.3,col="blue")
lines(year,suicides/0.3,col="blue")

axis(4,at=y,labels=ylab)
mtext("Suicides by Hanging", side=4, line=3, cex.lab=1,las=0, col="blue")

axis(2,at=y,labels=y)
mtext("U.S. Science Spending (Millions)", side=2, line=3, cex.lab=1,las=0, col="red")

axis(1, at=year, labels=year)

cor.test(spending,suicides)
