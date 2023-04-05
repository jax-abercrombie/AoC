# Link to task: https://adventofcode.com/2021/day/1

# Import input
sonar <- read.table("~/AoC/2021/Day 1/2021_day1_input.txt", blank.lines.skip = FALSE)

# First attempt (easy for loop and counter)
# Part 1
count <- 0
for (m in 1:(nrow(sonar)-1)){
  m1 <- sonar$V1[m]
  m2 <- sonar$V1[m+1]
  if (m2 > m1){
    count <- count + 1
  }
}
print(count)




# Part 2
count2 <- 0

for (m in 1:(nrow(sonar)-3)){
  m1 <- sonar$V1[m]
  m2 <- sonar$V1[m+1]
  m3 <- sonar$V1[m+2]
  m4 <- sonar$V1[m+3]
  sum1 <- m1 + m2 + m3
  sum2 <- m2 + m3 + m4
  if (sum1 < sum2){
    count2 <- count2 + 1
  }
}
print(count2)




# Second attempt
sonar$index <- 1:nrow(sonar)

sonar2 <- 
  sonar %>% 
  arrange(V1)

sonar2$index_ascend <- 1:nrow(sonar)

sonar2 <-
  sonar2 %>%
  mutate(diff = index - index_ascend)

2000-nrow(sonar2)