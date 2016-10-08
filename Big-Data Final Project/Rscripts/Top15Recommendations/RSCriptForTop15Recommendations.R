df <- read.csv("/Users/ameykelekar/Downloads/CombinedRecommendedListingAndListingsDatav0.4.csv", header=TRUE)
summary(df)
 df
 
gbv <- 'User'
find.maximum <- TRUE
x<-df

# figure out the ranks of each miles-per-gallon, within cyl columns
if ( find.maximum ){
  # note the negative sign (which changes the order of mpg)
  # *and* the `rev` function, which flips the order of the `tapply` result
  x$ranks <- unlist( rev( tapply( -x$AgeRatingsAsPerUsersGroup , x[ , gbv ] , rank, ties.method = 'random' ) ) )
} else {
  x$ranks <- unlist( tapply( x$AgeRatingsAsPerUsersGroup , x[ , gbv ] , rank, ties.method ='random') )
}

result <- x[ x$ranks <= 15 , ]
result

# Write CSV in R
write.csv(result, file = "CombinedRecommendedListingAndListingsDatav0.9.csv")
