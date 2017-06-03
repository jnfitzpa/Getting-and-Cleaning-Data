# Code Book

This repo contains the R script that transforms raw fitness data from a wearable fitness tracker into a tidy dataset. The raw data did not contain any labels or descriptive variable names. Instead, the labels and varable names were stored in seperate files. Furthermore, the data was split into training and test sets. The purpose of the script is to merge the data sets together, attach descriptive labels (activities), give each variable a descriptive title, and select only the variables related to average and standard deviation of the measurements.

The final step in the script is to make the dataframe into a "tidy" dataset. Several of the variables were different measurement types. To be considred a "tidy" dataset, these variables should be condensed into one single variable. In addition to making the data tidy, the script also summarizes the data by average measurent grouped by subject, measurment type, and activity.

The final tidy dataset includes the following variables:

- 'activity' : This variable represents the activity (running, walking, laying, etc...) that the subject was engaged in when the data was gathered.

- 'subject' : An integer label representing the particular individual participating in the study

- 'variable' : A label describing the sensor and type of analysis that the data was preprocessed with.

- 'stat' : The statistial type of analysis, eg., "mean" and "standard deviation"

- 'avgMeasurement' : The average of all the data grouped by activity, subject, variable, and statistic (measured in g's)
