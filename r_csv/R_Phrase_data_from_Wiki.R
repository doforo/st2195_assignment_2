library(tidyr)
library(rvest)
library(rjson)
library(dplyr)
library(stringr)


table1 <- read_html("https://en.wikipedia.org/wiki/Comma-separated_values")  #read the path

tb <- table1%>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/table[3]/tbody')%>%html_text()

print(tb)

y <- strsplit(tb, "\n")

t=unlist(y)

t1=t[1:5]
t2=t[6:10]
t3=t[11:15]
t4=t[16:20]
t5=t[21:25]

a <- matrix(c(t1,t2,t3,t4,t5), ncol=5,byrow=T)
a

df <- data.frame(Column1 = c(t1),
                 Column2 = c(t2),
                 column3 = c(t3),
                 column4 = c(t4),
                 column5 = c(t5)
)
print (df)

write.csv(df,'C://users/jl284/OneDrive/Desktop/wikipedia_data.csv', row.names = FALSE)

