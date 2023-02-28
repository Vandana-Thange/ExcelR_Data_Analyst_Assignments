
# 1.Try to write a code for printing sequence of numbers from 1 to 50 with the differences of 3, 5, 10 
seq(0, 50, by = 3)
seq(0, 50, by = 5)
seq(0, 50, by = 10)




#2. What are the different data objects in R? and write syntax and example for each and every object


#Vectors
x <- c(1, 2, 3, 4)
y <- c("a", "b", "c", "d")
z <- 5

print(x)
print(class(x))

print(y)
print(class(y))

print(z)
print(class(z))

#Lists
ls <- list(c(1, 2, 3, 4), list("a", "b", "c"))
print(ls)
print(class(ls))

#Matrices
x <- c(1, 2, 3, 4, 5, 6)
mat <- matrix(x, nrow = 2)

print(mat)
print(class(mat))

#Factors
s <- c("spring", "autumn", "winter", "summer", 
       "spring", "autumn")

print(factor(s))
print(nlevels(factor(s)))

#Syntax
arr <- array(c(1, 2, 3), dim = c(3, 3, 3))

print(arr)

#Data Frames
x <- 1:5
y <- LETTERS[1:5]
z <- c("Albert", "Bob", "Charlie", "Denver", "Elie")
df <- data.frame(x, y, z)
print(df)















# 3. Create Data frame with 3 columns and 5 rows and write a code to fetch and delete row and a column using index and add new column and row to the existed data frame


exam_data = data.frame(
  attempts = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1),
  score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
  name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'),
  qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
)
print("Original dataframe:")
print(exam_data)

#  fetching Data
result =  exam_data[c(5),c(3)]
print(result)

#Delete column
exam_data = subset(exam_data, select = -c(name))
print(exam_data)

#Delete Row
exam_data <- exam_data[-c(5), ]
print(exam_data)

#New column
exam_data$country = c("INDIA","UK","UAE","CANADA","INDIA","INDIA","USA","RUSSIA","FRANCE")
print(exam_data)
#New row
new_exam_data = data.frame(
  attempts = c(1),
  score = c(10.5),
  qualify = c('yes'),
  country = c('UK')
)
exam_data =  rbind(exam_data, new_exam_data)
print("After adding new row(s) to an existing data frame:")
print(exam_data)



#4.Write nested if else statements to print whether the given number is negative, positive or Zero 

data <- as.double(readline(prompt = "Enter a number: "))

if (data > 0) {
  print("Positive number")
} else if (data == 0) {
  print("0")
} else {
  print("Negative number")
}



#5.write a program to input any value and check whether it is character, numeric or special character
check_value_type <- function(x) {
  if(is.numeric(x)) {
    print("The value is numeric.")
  } else if(is.character(x)) {
    print("The value is a character.")
  } else {
    print("The value is a special character.")
  }
}

# Test the function
check_value_type(5)
check_value_type("hello")
check_value_type("#")



#write difference between break and next also write examples for both 

# Break Statement
# The break keyword is a jump statement that is used to terminate the loop at a particular iteration.
# Next Statement
# The next statement is used to skip the current iteration in the loop and move to the next iteration without exiting from the loop itself.

# Example Break Statement
no <- 1:10

for (val in no)
{
  if (val == 5) 
  {
    print(paste("Coming out from for loop Where i = ", val))
    break
  }
  print(paste("Values are: ", val))
}

# Example Next Statement
no <- 1:10

for (val in no)  
{
  if (val == 6)  
  {
    print(paste("Skipping for loop Where i =  ", val))
    next
  }
  print(paste("Values are:  ", val))
}



#7.write a program to print a given vector in reverse format  x= c(1,5.6,3,10,3.5,5)
v = c(1,5.6,3,10,3.5,5)
print("Original vector-1:")
print(v)
rv = rev(v)
print("The said vector in reverse order:")
print(rv)




#.write a program to get the mode value of the given vector (‘a’,’b’,’c’,’t’,’a’,’c’,’r’,’a’,’c’,’t’,’z’,’r’,’v’,’t’,’u’,’e’,’t’)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

charv <- c("a","b","c","t","a","c","r","a","c","t","z","r","v","t","u","e","t")
result <- getmode(charv)
print(result)



#9.Write a function to filter only data belongs to ‘setosa’ in species of Iris dataset.( using dplyr package) 
  list_of_packages <- c("dplyr", "ggplot2")
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)
  library("dplyr")
iris$Sepal.Length %>% mean()
iris_setosa <- iris %>% filter(Species == "setosa")
head(iris_setosa)
  iris_sepal_petal_length <- iris %>% select(Petal.Length, Sepal.Length)
head(iris_sepal_petal_length)




#10.Create a new column for iris dataset with the name of Means_of_obs, which contains mean value of each row.( using dplyr package)

library(dplyr) 
data()
Means_of_obs = mutate( Means_of_obs
                  
) 
View(Means_of_obs) 


# 11.Filter data for the “versicolor” and get only ‘sepel_length’ and Sepel _width’ columns.( using dplyr package)

library(dplyr)
iris %>% 
  select(Sepal.Width,Sepal.Length,Species) %>% 
  filter(Species=="versicolor")


#12.create below plots for the mtcars also write your inferences for each and every plot (use ggplot package) Use Different ( Size , Colour )

library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = drat)) +
  geom_point(aes(color = factor(gear)))
#boxplot 

boxplot(mtcars)
#histogram
hist(mtcars$disp)
#line graph

plot(mtcars$mpg , type= "l")
#bar graph

p<-ggplot(data=mtcars, aes(x=mpg, y=hp)) 
geom_bar(stat="identity")
p