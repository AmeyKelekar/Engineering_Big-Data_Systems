df2 <- read.csv("/Users/ameykelekar/Downloads/CombinedRecommendedListingAndListingsDatav0.12.csv", header=TRUE)
summary(df2)
df2

gbv2 <- 'User'
find.maximum <- TRUE
x2<-df2

# figure out the ranks of each miles-per-gallon, within cyl columns
if ( find.maximum ){
  # note the negative sign (which changes the order of mpg)
  # *and* the `rev` function, which flips the order of the `tapply` result
  x2$ranks <- unlist( rev( tapply( -x2$ProfessionRatingsAsPerUsersProfession , x2[ , gbv2 ] , rank, ties.method = 'random' ) ) )
} else {
  x2$ranks <- unlist( tapply( x2$ProfessionRatingsAsPerUsersProfession , x2[ , gbv2 ] , rank, ties.method ='random') )
}

result2 <- x2[ x2$ranks <= 7 , ]
result2

# Write CSV in R
write.csv(result2, file = "CombinedRecommendedListingAndListingsDatav0.13.csv")
