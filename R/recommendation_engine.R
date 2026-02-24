# recommendation_engine.R
library(dplyr)
decision_recommendation <- function(recent_tbl){
  # recent_tbl: facility x last 90 days attendance + notes
  avg_attendance <- mean(recent_tbl$attendance, na.rm=TRUE)
  market_share <- mean(recent_tbl$note=="market_day")
  rainy_share <- mean(recent_tbl$note=="rain")
  
  recs <- list()
  if(avg_attendance < 10) recs <- c(recs, "Low turnout: run short focus group to probe reasons; trial different outreach day.")
  if(market_share > 0.08) recs <- c(recs, "High market-day conflicts: schedule outreach to avoid local market days.")
  if(rainy_share > 0.12) recs <- c(recs, "Seasonal rain impact: pilot mobile brigades or covered venues during rainy season.")
  if(length(recs)==0) recs <- c("Sustained attendance; document local best practices and share at monthly learning session.")
  paste(recs, collapse=" | ")
}
