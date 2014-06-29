year <-c(1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009)

# US spending on science, space, and technology
spending <- c(18079,18594,19753,20734,20831,23029,23597,23584,25525,27731,29449)

# Suicides by hanging, strangulation and suffocation
suicides <- c(5427,5688,6198,6462,6635,7336,7248,7491,8161,8578,9000)

# Set up y-axis tics and positions for suicides
y=c(seq(from=18000, to=30000, by=3000))
ylab=c(seq(from=5000, to=9000, by=1000))

# Adjust margins for additional axis tics and title
par(mar=c(5, 4, 2, 5) + 0.1)

# Main plot
plot(year, spending, type="p", col="firebrick3", pch = 16,
     xlim=c(1999,2009), ylim=c(18000,30000), yaxt="n",xaxt="n",
     ylab="", xlab = "Year")

# Add points for suicides
points(year, suicides/0.3, col="dodgerblue4", pch = 16)

# Add suicide and spending lines
lines(year, suicides/0.3,col = "dodgerblue4")
lines(year, spending, col = "firebrick3")

# Add suicide axis tics and axis title
axis(4,at=y,labels=ylab, cex.axis = 0.9)
mtext("Suicides by Hanging", side=4,
      line=3, cex.lab=1,las=0, col="dodgerblue4")

# Add spending axis tics and axis title
axis(2,at=y,labels=y, cex.axis = 0.9)
mtext("U.S. Science Spending (Millions)",
      side=2, line=3, cex.lab=1,las=0, col="firebrick3")

# Add year axis tics
axis(1, at=year, labels=year)

cor.test(spending,suicides)
