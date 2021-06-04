##########################
#### Mt Gonga Biomass ####
##########################


#### Loading libraries ####

library(tidyverse) #dplyr included
library(readxl)



#### Importing the data ####

gonga_biomass <- "biomass2015.xls"


#Option 1 (each sheet separately)

#Find the names of the Excel-sheets
#excel_sheets(path = gonga_biomass)

#Importing each sheet
#site_L <- read_excel(gonga_biomass, sheet = "Site L")
#site_M <- read_excel(gonga_biomass, sheet = "Site M")
#site_A <- read_excel(gonga_biomass, sheet = "Site A")
#site_H <- read_excel(gonga_biomass, sheet = "Site H")


#Option 2 (all sheets together - better option)
gonga_data <- 1:4 %>%
  map_dfr(~read_excel(path = "biomass2015.xls", sheet = .x))

#hello


#### Summarise production to find total biomass ####

gonga_biomass.df <- gonga_data %>%
  group_by(site, plot) %>%
  summarise(total_biomass = sum(production, na.rm = TRUE))



#### Making the plot ####
biomass_figure <- ggplot(data = gonga_biomass.df, aes(x = site, y = total_biomass, fill = site)) +
  geom_boxplot()

biomass_figure

