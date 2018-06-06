# Import a CSV file
csv_file<-read.csv(file.choose())

csv_file<-read.csv(file="d://out5.csv")

# View the file
View(csv_file)

# Edit the file
csv_file<-edit(csv_file)

# Export CSV file
write.csv(csv_file,file.choose())


# Import a text file
txt_file<-read.table(file="d://out5.csv",header=TRUE,sep=" ")

# Using write.table
write.table(csv_file,file="d://out5.csv",sep=",",row.names=FALSE)
write.table(datafile,file.choose(),sep=",",row.names=FALSE)

# Install the XLSX package to work with excel files
# ***Requires 32 bit version and java compatibility
# to work

install.packages("xlsx",dependencies=TRUE)

# Load the package into memory
library(xlsx)

# Import worksheet from an excel file
a<-read.xlsx(file.choose(),1)
a

# Write to excel file
write.xlsx(a,file.choose(),sheetName="test",row.names=FALSE)
write.xlsx(a,file.choose(),sheetName="test2",append=TRUE,row.names=FALSE)