# DataMiningProject
Contains a project for ITCS 3162 - Intro to Data Mining. 

**Project Summary:**

This project required students to read a csv file into a data frame, apply cursory validations, split into training and testing sets, implement an algorithm that we discussed in class, provide some measure of model performance, then visualize the model.

I found a dataset containing statistics on the NFL Combine from 1999 to 2015. I was curious of the correlation between an NFL prospects weight and their forty yard dash time. 

**Project Model:**

I decided to use a simple linear regression model on my data set and a sum of squares test on the test set to measure model performance. The data set initially had 4957 entries, unfortunately after removing entries with NA data this brought the number down to 397 entries.

![Screenshot](https://github.com/tsmit317/DataMiningProject/blob/master/RegressionPlot.png?raw=true)

**Project Visualization:**

I decided to create a simple Shiny interactive web application to visualize the data. This application allows users interact with a slider bar depicting the weight of an NFL prospect to predict their 40 yard dash time. 

![Screenshot](https://user-images.githubusercontent.com/13583303/30254347-39fcb962-9665-11e7-9e05-c49eff0953c1.png)

**Software Used:**
- R 
- Shiny by RStudio

**Lessons Learned:**

The confidence interval for my project turned out to be fairly weak. This could be due to the low number of entries after cursory validations, which brought the number from 4957 to 397. Additionally, since I chose to split the data randomly, the confidence interval tends to fluctuate. Having a more complete data set, as well as, removing more outliers could help to stabalize and increase the interval. 
