# libraries
library(tidyverse)
library(tidytext)
library(ggwordcloud)
library(urltools)

# hente vores data
link <- "https://labs.statsbiblioteket.dk/labsapi/api/aviser/export/fields?query=Slesvig%20OR%20Schleswig%20AND%20Holsten%20OR%20Holstein%20AND%20krig%2A%20py%3A1848-1851&fields=link&fields=recordID&fields=timestamp&fields=pwa&fields=cer&fields=fulltext_org&fields=pageUUID&fields=editionUUID&fields=titleUUID&fields=editionId&fields=familyId&fields=newspaper_page&fields=newspaper_edition&fields=lplace&fields=location_name&fields=location_coordinates&max=-1&structure=header&structure=content&format=CSV"


# gøre url koden læselig
url_decode(link)


# loade dataen ind i R
Slesvig_1848_1851 <- read_csv(link)


# gøre datasættet tidy
Slesvig_1848_1851_tidy <- Slesvig_1848_1851 %>% 
  unnest_tokens(word, fulltext_org)

#Stopordsliste 1800-tallet fra Max 
stopord_1800 <- read_csv("https://gist.githubusercontent.com/maxodsbjerg/1537cf14c3d46b3d30caa5d99f8758e9/raw/9f044a38505334f035be111c9a3f654a24418f6d/stopord_18_clean.csv")

#frasortere stopordene
Slesvig_1848_1851_tidy %>% 
  anti_join(stopord_1800)
  

