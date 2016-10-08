df1 <- read.csv("/Users/ameykelekar/Downloads/CombinedRecommendedListingAndListingsDatav0.10.csv", header=TRUE)
summary(df1)
df1

gbv1 <- 'User'
find.maximum <- TRUE
x1<-df1

# figure out the ranks of each miles-per-gallon, within cyl columns
if ( find.maximum ){
  # note the negative sign (which changes the order of mpg)
  # *and* the `rev` function, which flips the order of the `tapply` result
  x1$ranks <- unlist( rev( tapply( -x1$HobbiesRatingsAsPerUsersHobbies , x1[ , gbv1 ] , rank, ties.method = 'random' ) ) )
} else {
  x1$ranks <- unlist( tapply( x1$HobbiesRatingsAsPerUsersHobbies , x1[ , gbv1 ] , rank, ties.method ='random') )
}

result1 <- x1[ x1$ranks <= 10 , ]
result1

# Write CSV in R
write.csv(result1, file = "CombinedRecommendedListingAndListingsDatav0.11.csv")
