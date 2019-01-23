
library(dplyr)
library(ggplot2)
library(forcats)
library(XML)
library(reshape2)
library(plyr)
library(ggplot2)

##################################
##### LLegir base de dades   ----
marc <- as.data.frame(read.csv2("marc.csv",head=T,sep=";",dec=","))

marc <- marc %>% 
  mutate(Edad_f = factor(Edad, levels = c(1:18), labels = c("85+","80-84","75-79","70-74","65-69","60-64","55-59","50-54","45-49",
                                                            "40-44","35-39","30-34","25-29",
                                                            "20-24","15-19","10-14","5-9","0-4")),
         Valor = round(Valor, 2))


ggplot(marc, aes(x = Edad_f, y = Valor, fill = Sexo)) + 
  theme_bw() +
  theme(legend.position = "bottom", legend.title = element_blank(), panel.background = element_rect("white"))+
  geom_bar(data =subset (marc, Sexo == "Hombre"), stat = "identity") + 
  geom_bar(data =subset (marc, Sexo == "Mujer"), stat = "identity") + 
  coord_flip() + 
  scale_fill_brewer(palette = "Set1") + ylab("Población") + xlab("Edad") +
  geom_hline(yintercept = c(-4,-2,0,2,4), color = "grey") 
  

