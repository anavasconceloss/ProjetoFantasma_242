install.packages("tidyverse")
library(tidyverse)

#Transformação de cada uma das abas da planilha em data frames

df_athena<-as.data.frame(Olimpiadas_2000_2016_Verão_)
df_londres<-as.data.frame(Olimpiadas_2000_2016_Verão_)
df_rio<-as.data.frame(Olimpiadas_2000_2016_Verão_)
df_sydney<-as.data.frame(Olimpiadas_2000_2016_Verão_)
df_beijing<-as.data.frame(Olimpiadas_2000_2016_Verão_)

#Igualando as colunas

colnames(df_athena)[2]<-"Sex"
colnames(df_athena)[4]<-"Height"
colnames(df_athena)[5]<-"Weight"
df_athena$Year<-2004

colnames(df_londres)[1]<-"Names"
df_londres$Year<-2012

colnames(df_rio)[1]<-"Names"
colnames(df_rio)[3]<-"Age"
colnames(df_rio)[4]<-"Height"
colnames(df_rio)[5]<-"Weight"
colnames(df_rio)[6]<-"Team"
df_rio$Year<-2016


colnames(df_sydney)[1]<-"Names"
colnames(df_sydney)[2]<-"Sex"
colnames(df_sydney)[3]<-"Age"
colnames(df_sydney)[4]<-"Height"
colnames(df_sydney)[5]<-"Weight"
colnames(df_sydney)[6]<-"Team"
colnames(df_sydney)[7]<-"Sport"
colnames(df_sydney)[8]<-"Event"
colnames(df_sydney)[9]<-"Medal"
df_sydney$Year<-2000

df_beijing$Year<-2008
df_beijing$Height<-as.numeric(df_beijing$Height)

#Transformando em só um data frame

data<-bind_rows(df_athena, df_beijing, df_londres, df_rio, df_sydney)

#Análise 1 COM duplicatas, ou seja, número de MEDALHAS

df_women<-data%>%filter(Sex == "F" | Sex == "F")

contagem<-table(df_women$Team)

#Análise 1 sem duplicatas, ou seja, MULHERES MEDALHISTAS

mulheres_medalhistas<-df_women[!duplicated(df_women$Names), ]

contagem_2<-table(mulheres_medalhistas$Team)

#Fazendo a análise 1 apenas p/ as olimpiadas de Atenas

df2<-df_athena%>%filter(Sex == "F" | Sex == "F")
df2<-df2[!duplicated(df2$Names), ]
atenas<-table(df2$Team)
view(atenas)
