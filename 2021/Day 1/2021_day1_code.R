# Link to task: https://adventofcode.com/2021/day/1

# Import input
sonar <- read.table("~/AoC/2021/Day 1/2021_day1_input.txt", blank.lines.skip = FALSE)

# First attempt (easy for loop and counter)
count <- 0
for (m in 1:(nrow(sonar)-1)){
  m1 <- sonar$V1[m]
  m2 <- sonar$V1[m+1]
  if (m2 > m1){
    count <- count + 1
  }
}
print(count)


# Second attempt


sonar2 <- 
  sonar %>%
  

