df <- read.csv2("COVID-19_aantallen_gemeente_cumulatief.csv")
df1 <- df

library(lubridate)
df1$Date_of_report <- as.Date(ymd_hms(df1$Date_of_report))
df1$Province <- as.factor(df1$Province)
df1$Total_reported <- as.numeric(df1$Total_reported)

library(dplyr)
df1 <- df1 %>%
    select(c(Date_of_report, Province, Total_reported)) %>%
    arrange(Date_of_report, Province, Total_reported)
df2 <- df1 %>%
    group_by(Date_of_report, Province) %>%
    summarise(Total_reported = sum(Total_reported))
#glimpse(df1)
library(plotly)
library(tidyr)
library(dplyr)

plot_ly(df2, x = ~Date_of_report, y = ~Total, color = ~Province, type = "scatter", mode="markers")
df4 <- ungroup(df2)
plot_ly(df4, x = ~Date_of_report, y = ~Total, color = ~Province, type = "scatter", mode="lines")

df3 <- df2[df2$Province %in% c('Drenthe', 'Flevoland', 'Friesland', 'Gelderland', 'Groningen',
                               'Limburg', 'Noord-Brabant', 'Noord-Holland', 'Overijssel') ,]
plot_ly(df3, x = ~Date_of_report, y = ~Total, color = ~Province, type = "scatter", symbols = 1:9)


fig <- plot_ly(df3, x = ~Date_of_report)
fig <- fig %>% add_trace(y = ~Total, name = 'trace 0',color = ~Province)
fig

