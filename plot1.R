plot1<-function(){
  
  data<-read.table("household_power_consumption.txt",skip=36320,nrows = 121800,sep=";")
  data[,1]<-gsub("/","-",data[,1])
  data<-data[data[,1]=="1-2-2007" | data[,1]=="2-2-2007",]
  for (i in 1:nrow(data)){
    data[i,1]<-paste0(strsplit(data[i,1],"-")[[1]][3],"-",strsplit(data[i,1],"-")[[1]][2],"-",strsplit(data[i,1],"-")[[1]][1])
  }
  data[,1]<-as.Date(data[,1])
  png(filename="plot1.png",width = 480,height = 480)
  hist(as.numeric(as.character(data[,3])),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
}