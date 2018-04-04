plot2<-function(){
  library(lubridate)
  #read the data and change each column class
  data<-read.table("household_power_consumption.txt",skip=36320,nrows = 121800,sep=";")
  data[,1]<-as.character(data[,1])
  data[,2]<-as.character(data[,2])
  data[,3]<-as.numeric(as.character(data[,3]))
  data[,4]<-as.numeric(as.character(data[,4]))
  data[,5]<-as.numeric(as.character(data[,5]))
  data[,6]<-as.numeric(as.character(data[,6]))
  data[,7]<-as.numeric(as.character(data[,7]))
  data[,8]<-as.numeric(as.character(data[,8]))
  data[,9]<-as.numeric(as.character(data[,9]))
  data[,1]<-gsub("/","-",data[,1])
  #Keep the data which is in the indicated dates
  data<-data[data[,1]=="1-2-2007" | data[,1]=="2-2-2007",]
  #Create the new variable that contains the Date and time
  for (i in 1:nrow(data)){
    data[i,1]<-paste0(strsplit(data[i,1],"-")[[1]][3],"-",strsplit(data[i,1],"-")[[1]][2],"-",strsplit(data[i,1],"-")[[1]][1])
    
    data[i,1]<-paste(data[i,1],data[i,2])
    data[i,10]<-ymd_hms(data[i,1])
  }
  #plot the graph
  png(filename="plot2.png",width = 480,height = 480)
  plot(as.POSIXct(p[,10], origin="1970-01-01", tz="UTC"), as.numeric(as.character(p[,3])), ylim=range(as.numeric(as.character(p[,3]))),  axes=T,type="l",ylab = "Global Active Power (Kilowatts)",xlab="")
  dev.off()
  
}