# utils.R - cleaning and canonicalization used by the app
library(tidyverse)
library(lubridate)
library(janitor)

canonicalize_facility <- function(x){
  x %>% str_replace_all("[^[:alnum:] ]","") %>% str_squish() %>% str_to_title()
}

clean_outreach <- function(df){
  df %>%
    mutate(date = as.Date(date),
           facility = canonicalize_facility(facility),
           service = str_to_title(service),
           attendance = as.integer(as.numeric(attendance)),
           attendance = if_else(is.na(attendance) | attendance < 0, 0L, attendance),
           note = coalesce(note, "normal")) %>%
    filter(!is.na(date))
}
