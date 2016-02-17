setwd("C:\\Users\\marten\\code\\R\\GettingAndCleaning\\project\\UCI HAR Dataset")
features <- read.csv("features.txt", sep = "", header = F)
outcome <- read.csv("test\\X_test.txt", sep = "", header = F)

colnames(outcome) <- features[[2]]

activity <- read.csv("test\\y_test.txt", sep = "", header = F)
subject <- read.csv("test\\subject_test.txt", sep = "", header = F)

test <- cbind(activity, outcome)
colnames(test)[1] <-"activity" 

test <- cbind(subject, test)
colnames(test)[1] <-"subject" 

set <- rep("test", nrow(test))
test <- cbind(test, set)

outcome <- read.csv("train\\X_train.txt", sep = "", header = F)
activity <- read.csv("train\\y_train.txt", sep = "", header = F)
subject <- read.csv("train\\subject_train.txt", sep = "", header = F)

colnames(outcome) <- features[[2]]

train <- cbind(activity, outcome)
colnames(train)[1] <-"activity" 

train <- cbind(subject, train)
colnames(train)[1] <-"subject" 

set <- rep("train", nrow(train))
train <- cbind(train, set)

df <- rbind(test, train)

activities <- read.csv("activity_labels.txt", sep = "", header = F)

df <- merge (df, activities, by.x = "activity", by.y = "V1", all.x)

colnames(df)[ncol(df)]<- ("activityname")

meanstd <- grep("mean|std|activityname|subject", names(df1))

means <- df[,meanstd]
means <- aggregate(means[,2:80], by=list(Category=df$activityname, df$subject), FUN = mean)
colnames(means)[1:2]<- c("activity","subject")
write.table(means, file = "means.txt", row.names = F, sep = " ")