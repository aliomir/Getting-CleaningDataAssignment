

cleanup<-function(){
    library(data.table)
    library(dplyr)
    xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
    ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
    ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
    xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")
    subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    features<-read.table("./UCI HAR Dataset/features.txt")
    actlabel<-read.table("./UCI HAR Dataset/activity_labels.txt")
    
    
    dimtrainx<-dim(xtrain)
    dimtestx<-dim(xtest)
    
    dimtrainy<-dim(ytrain)
    dimtesty<-dim(ytest)
    
    dimsubtrain<-dim(subtrain)
    dimsubtest<-dim(subtest)
    
  #  if(dimtestx[2]==dimtrainx[2]){
        xtesttrain<-rbind(xtest,xtrain)
  #  }else
   # {print("Variable for Testing & Training do not Match")}
    
    inputnames<-features[,2]
    names(xtesttrain)<-inputnames
    
#    if(dimtesty[2]==dimtrainy[2]){
        ytesttrain<-rbind(ytest,ytrain)
 #   }else
  #  {print("Variable for Testing & Training do not Match")}
    
    names(ytesttrain)<-"Activities"
    
    
  #  if(dimsubtrain[2]==dimsubtest[2]){
        subtesttrain<-rbind(subtrain,subtest)
   # }else
    #{print("Variable for Testing & Training do not Match")}
    names(subtesttrain)<-"Subject"
    
     xymerged<-cbind(subtesttrain,ytesttrain,xtesttrain)
     testortrain<-c(rep("test",dimtestx[1]),rep("train",dimtrainx[1]))
     
     Output1<-cbind(xymerged,testortrain)
    # meancol<-grep("mean",names(xymerged1))
    # stdcol<-grep("std",names(xymerged1))
    selecol<-c(grep("mean",names(Output1)),grep("std",names(Output1)))
    Output2<-Output1[,c(1,2,selecol,564)] 
    
    names(actlabel)<-c("Activities","Activity")
    Output3<-join(Output2,actlabel, by = "Activities")
    Output3<-mutate(Output3,Activities=Activity)
    Output3<-select(Output3,-Activity)
    
    finaloutput<-Output3 %>% group_by(Activities, Subject) %>%summarise_each(funs(mean))
    finaloutput<-finaloutput<-select(finaloutput,1:81)
    write.table(finaloutput, "./UCI HAR Dataset/q5.txt", row.names=FALSE)
    }
    
    





