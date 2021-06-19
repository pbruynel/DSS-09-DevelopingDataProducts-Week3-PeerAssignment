# library(lubridate)
# names <- c("John", "Pete", "Rick", "John", "Pete", "Rick")
# days <- c("Mo", "Mo", "Mo", "Tu", "Tu", "Tu")

# c("John", "Mo", "item1", 3)
# c("John", "Mo", "item2", 1)
# c("Pete", "Mo", "item1", 4)
# c("Pete", "Mo", "item2", 1)
# c("John", "Tu", "item1", 0)
# c("John", "Tu", "item2", 3)
# c("Pete", "Tu", "item1", 2)
# c("Pete", "Tu", "item2", 5)

df <- data.frame(matrix(ncol = 4, nrow = 0))
df <- rbind(df, c("John", "Mo", "item1", 3))
df <- rbind(df, c("John", "Mo", "item2", 1))
df <- rbind(df, c("Pete", "Mo", "item1", 4))
df <- rbind(df, c("Pete", "Mo", "item2", 1))
df <- rbind(df, c("John", "Tu", "item1", 0))
df <- rbind(df, c("John", "Tu", "item2", 3))
df <- rbind(df, c("Pete", "Tu", "item1", 2))
df <- rbind(df, c("Pete", "Tu", "item2", 5))
x <- c("name", "day", "item", "sold")
colnames(df) <- x
df$sold <- as.numeric(df$sold)

str(df)

# I want to know how many items each person has sold each day.
# So I want to take the sum of the sold items of each person each day.
# The result should be:
# name day totalSold
# John  Mo         4
# Pete  Mo         5
# John  Tu         3
# Pete  Tu         7

df1 <- df %>%
    group_by(name, day) %>%
    summarise(totalSold = sum(sold))


