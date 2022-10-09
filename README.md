# MATH260
Projects from Intermediate Applied Statistics (MATH260)//Fall 2020 


## Project 1 -- ANOVA project looking at duration of unemployment by age group in OECD countries  

### My goal for this project:
The goal of this project is to see whether the duration of unemployment (in months) of
OECD countries differs by age group. The data set looks at 9 different OECD countries
(Australia, Canada, Czech Republic, Finland, France, Hungary, Norway, Slovak Republic,
United States) and the duration of unemployment (in months) for each age group (15-19 years,
20-24 years, 25-54 years, 55-99 years) in those countries in 2017. The data set was found on the
OECD.Stat which allows users to search for and extract data from across the OECD databases.
The data was initially collected via survey by the governments of the aforementioned countries
and then relayed to the OECD (OECD, 2020). 

### What I learned from this project:
There is a difference in mean duration of unemployment in the 9 OECD countries in 2017 between age groups 55-99 and 15-19 years as well as between 55-99 years and 20-24 years. There was no difference in mean duration of unemployment between any other age groups.

### If I had more time I would change:
It would have been interesting to look at the duration of unemployment in these OECD countries by race/ethnicity. Additionally, it would have been nice to have more than 9 datapoints. Because the sample sizes for each of those age groups (N=9) is relatively small, the outliers could affect the findings.

### Available Files: 
### [Project 1 Write Up](https://github.com/emartin43/MATH260/blob/main/Project%201%20--%20ANOVA/WriteUp1_EvelynMartin.pdf)
### [Project 1 R Script](https://github.com/emartin43/MATH260/blob/main/Project%201%20--%20ANOVA/Project1_EvelynMartin.R)
### [Unemployment Data](https://github.com/emartin43/MATH260/blob/main/Project%201%20--%20ANOVA/Data1_EvelynMartin.csv)

## Project 2 -- Logistic regression project looking at relationship between productivity and average hours of work per worker in OECD countries

### My goal for this project:
The goal of this project is to see whether there is a linear relationship between productivity ($/hour) and average annual hours of work per worker. Understanding and identifying the relationship the relationship between the productivity of a worker’s labor and their hours of work is important to knowing if working more hours is an efficient use of labor, capital, and resources. A positive linear relationship between these two variables would mean that when people work more, they are more productive, and a negative linear relationship would mean when people work more, they are less productive.

### What I learned from this project:
After looking at two simple linear model, one with transformed variables and one without, we found that the simple linear model of the natural log of productivity versus average annual hours of work per worker does a slightly better job of representing the relationship between the data. In the end, there is a negative linear relationship between the natural log of productivity and average annual hours of work per worker, meaning when people work more, they are less productive, on average.

### If I had more time I would change:
Since doing this project, I've learned of omitted variable bias as an issue with regression models. It is very possible that there are other determinants of productivity ($/hour) that are also correlated with average annual hours of work per worker. Therefore, the impact of our dependent variable might be overestimated in this project. 

### Available Files:
### [Project 2 Write Up](https://github.com/emartin43/MATH260/blob/main/Project%202%20--%20Logistic%20Regression/WriteUp2_EvelynMartin.pdf)
### [Project 2 R Script](https://github.com/emartin43/MATH260/blob/main/Project%202%20--%20Logistic%20Regression/Project2_EvelynMartin.R)
### [Productivity Data](https://github.com/emartin43/MATH260/blob/main/Project%202%20--%20Logistic%20Regression/Data2_EvelynMartin.csv)

## Project 3 -- Multiple linear regression project looking at the determinants of max bench weight of female powerlifters 

### My goal for this project:
Knowing the best way to predict how much someone can lift is useful information, especially for powerlifters and their coaches.The intent of this project is to find a model that can best predict how much female powerlifters can bench press based on how much they can lift in other events, their age and weight, and what equipment they use. The data used in this project comes from openpowerlifting.org, an open archive where statistics on powerlifters and the competitions they participated in are uploaded onto a permanent and accessible website. Information such as where the meet was located, when it took place, how much they lifted, what age group they participated in, and so on are types of data points that can be included. Our data comes from the October 2020 version.

### What I learned from this project:
A significant portion (~76%) of the variability in female powerlifters max bench weight, on average, can be explained by how much she can squat. In this project it seemed best to choose the simpler model for reasons such as computational efficiency, ease of understanding, and similarly accurate prediction power compared to more complex models -- sometimes simpler is better. 

### If I had more time I would change:
It would be interesting to compare male and female powerlifters using the same model and question. Women tend to have more muscle in their lower bodies than men, and men tend to have more upper body strength than women. So, I would be curious as to know how much of the variability in male powerlifters max bench weight, on average, can be explained by how much he can squat, especially considering his already advantageous upper body strenght. 

### Available Files:
### [Project 3 Write Up](https://github.com/emartin43/MATH260/blob/main/Project%203%20--%20Multiple%20Linear%20Regression/WriteUp3_EvelynMartin.pdf)
### [Project 3 R Script](https://github.com/emartin43/MATH260/blob/main/Project%203%20--%20Multiple%20Linear%20Regression/Project3_EvelynMartin.R)
### [Powerlifting Data](https://openpowerlifting.gitlab.io/opl-csv/bulk-csv.html)
Note: The dataset we used is larger than 25 MB, so the link to the website for data download takes place of our actual dataset. 
