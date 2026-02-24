# packages.R - install/load packages
pkgs <- c("shiny","shinythemes","tidyverse","lubridate","janitor","DT","plotly","zoo","scales","readr","shinycssloaders")
installed <- rownames(installed.packages())
for(p in pkgs) if(!p %in% installed) install.packages(p, repos="https://cloud.r-project.org")
invisible(lapply(pkgs, library, character.only=TRUE))
