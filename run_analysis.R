library(dplyr)

# Unzip data
unzip('getdata_projectfiles_UCI HAR Dataset.zip', exdir='unzipped')

# Read train data
subject_train <- read.table('unzipped/UCI HAR Dataset/train/subject_train.txt', header=FALSE)
X_train <- read.table('unzipped/UCI HAR Dataset/train/X_train.txt', strip.white=TRUE, header=FALSE)
y_train <- read.table('unzipped/UCI HAR Dataset/train/y_train.txt', header=FALSE)

# Read test data
subject_test <- read.table('unzipped/UCI HAR Dataset/test/subject_test.txt', header=FALSE)
X_test <- read.table('unzipped/UCI HAR Dataset/test/X_test.txt', strip.white=TRUE, header=FALSE)
y_test <- read.table('unzipped/UCI HAR Dataset/test/y_test.txt', header=FALSE)

# Combine subject, y and all of the X features into data frames
train <- data.frame(subject_train, y_train, X_train)
test <- data.frame(subject_test, y_test, X_test)

# Read in names from the features from features.txt. (make.names replaces illegal characters with .)
featureNames <- make.names(as.character(read.table('unzipped/UCI HAR Dataset/features.txt', header=FALSE)[,2]))
# Prepend names for first two columns (subject_* and y_*)
featureNames <- c('subject', 'activity', featureNames)
# Set names for train and test data frames
names(train) <- featureNames
names(test) <- featureNames

# Now join into one large data frame containing test and training data
all <- rbind(train, test)

# We want to keep any variables whose names originally contained "-mean()" or "-std()"
# make.names above replaced some characters with . so we search for ".mean.." and ".std.."
# Find column indices for those variables:
meanIndicies <- grep(".mean..", featureNames, fixed = TRUE)
stdDeviationIndicies <- grep(".std..", featureNames, fixed = TRUE)

# Union the column indices together, and add 1 and 2 for the first two columns (subject and y)
columnsToKeep <- union(meanIndicies, stdDeviationIndicies)
columnsToKeep <- union(c(1,2), columnsToKeep) #keep subject and activity

# Now filter 'all' down to just the columns we are interested in
all <- all[,columnsToKeep]

# Clean up the names using a series of string replacements
names(all) <- sub("...", ".", names(all), fixed = TRUE)
names(all) <- sub("\\.$", "", names(all))
names(all) <- sub("\\.$", "", names(all))
names(all) <- sub("BodyBody", "Body", names(all), fixed = TRUE) #assuming BodyBody is a mistake in features.txt
names(all) <- sub("tBody", "Body.", names(all), fixed = TRUE)
names(all) <- sub("fBody", "FFT.Body.", names(all), fixed = TRUE)
names(all) <- sub("tGravity", "Gravity.", names(all), fixed = TRUE)
names(all) <- sub("Acc", "Acceleration.", names(all), fixed = TRUE)
names(all) <- sub("Gyro", "Gyroscope.", names(all), fixed = TRUE)
names(all) <- sub("Jerk", "Jerk.", names(all), fixed = TRUE)
names(all) <- sub("Mag", "Magnitude.", names(all), fixed = TRUE)
names(all) <- sub(".mean", ".Mean", names(all), fixed = TRUE)
names(all) <- sub(".std", ".StdDev", names(all), fixed = TRUE)
names(all) <- sub("..", ".", names(all), fixed = TRUE)
names(all) <- sub("Magnitude.Mean", "Mean.Magnitude", names(all), fixed = TRUE)
names(all) <- sub("Magnitude.StdDev", "StdDev.Magnitude", names(all), fixed = TRUE)

# Our activity variable currently contains integers. We want to replace them with activity names.
# Read from activity_labels.txt - there are two columns, and integer key and an activity label
activityLabels <- read.table("unzipped/UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c("activity","activityLabel"))
# 'Inner join' all and activityLabels to add an activityLabel column
all <- merge(all, activityLabels, by="activity")

# Now we create the final dataset, calculating the mean across groups,
# using group_by and summarise_each from dplyr:
grouped <- group_by(all, subject, activityLabel)
final <- summarise_each(grouped, funs(mean))
# And save the final result
write.table(final, 'final.txt', row.name=FALSE)
