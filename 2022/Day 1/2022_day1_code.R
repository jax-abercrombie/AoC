# Link to task: https://adventofcode.com/2020/day/1

library(dplyr)

# Import input
carry_list_df <- read.table("~/AoC/2022/Day 1/2022_day1_input.txt", blank.lines.skip = FALSE)
# carry_list <- as.vector(carry_list_df$X7569)


# Initialize variables
calorie_sum <- 0
calorie_sum_list <- c()

# Create pipe that groups based on NAs and 
carry_list_df <-
  carry_list_df %>% 
  mutate(elf = as.character(cumsum(is.na(V1)) + !is.na(V1))) %>%
  filter(!is.na(V1))


# Answer
carry_list_df %>%
  group_by(elf) %>%
  summarise(sum = sum(V1)) %>%
  arrange(desc(sum)) %>%
  slice(1:3)

