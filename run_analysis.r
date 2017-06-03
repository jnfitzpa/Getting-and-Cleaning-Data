setwd("C:\\Users\\nathan\\OneDrive\\Documents\\Data_Science\\R\\GettingCleaningData\\Week4\\UCI HAR Dataset")
library(dplyr)
library(tidyr)

features <- read.table("features.txt", col.names = c('feature_id','features'))
labels <- read.table("activity_labels.txt", col.names = c('label_id','activity'))

X_train <- read.table("train\\X_train.txt", col.names = features$features)
train_labels <- read.table("train\\y_train.txt", col.names = 'label_id')

X_test <- read.table("test\\X_test.txt", col.names = features$features)
test_labels <- read.table("test\\y_test.txt", col.names = 'label_id')

#Adding Label Columns
X_train <- cbind(X_train, train_labels)
X_test <- cbind(X_test, test_labels)

#Merging Train and Test
merged <- rbind(X_train,X_test)



#Selecting Only Means, Standard Deviations, and Labels
MeanStd <- merged[,grep("\\.mean\\.\\.$|\\.std\\.\\.$|label_id",names(merged))]

#Merging Descriptive Labels
MeanStd <- merge(MeanStd, labels, by = "label_id")
MeanStd <- select(MeanStd, -label_id)


#Adding Subjects

subject_train <- read.table('train\\subject_train.txt', col.names = "subject")
subject_test <- read.table('test\\subject_test.txt', col.names = "subject")

MeanStd <- cbind(MeanStd,rbind(subject_train,subject_test))

#5, creating tidy dataset

tidyData <- MeanStd %>% 
  gather(variable.stat,measurements,-activity,-subject) %>%
  separate(variable.stat, into=c('variable','stat')) %>%
  group_by(activity,subject,variable,stat) %>%
  summarise(avgMeasurement = mean(measurements))

write.table(tidyData, file = 'tidy_data.txt', row.names = FALSE)
