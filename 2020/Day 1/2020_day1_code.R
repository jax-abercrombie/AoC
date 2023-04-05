# Link to task: https://adventofcode.com/2020/day/1


## PART 1
# Import input
expense_list_df <- read.delim("~/AoC/2020/Day 1/2020_day1_input.txt")
expense_list <- as.vector(expense_list_df$X1348)

# Make all combinations from list of expenses
expense_combos <- combn(expense_list, 2, simplify = TRUE)

# Make loop to iterate over all combinations, sum them to see if they equal 2020, and mutliply them if so
answer_vec <- c()
for (combo in 1:ncol(expense_combos)){
  combo_sum <- sum(expense_combos[,combo])
  if (combo_sum == 2020){
    answer_vec <- c(answer_vec, expense_combos[,combo])
    prod <- (expense_combos[2,combo])*(expense_combos[1,combo])
    answer_vec <- c(answer_vec, prod)
    }
  }

# Answer
print(answer_vec)


## PART 2
# Make all combinations from list of expenses
expense_combos2 <- combn(expense_list, 3, simplify = TRUE)

# Make loop to iterate over all combinations, sum them to see if they equal 2020, and mutliply them if so
answer_vec2 <- c()
for (combo in 1:ncol(expense_combos2)){
  combo_sum <- sum(expense_combos2[,combo])
  if (combo_sum == 2020){
    answer_vec2 <- c(answer_vec2, expense_combos2[,combo])
    prod2 <- (expense_combos2[1,combo])*(expense_combos2[2,combo])*(expense_combos2[3,combo])
    answer_vec2 <- c(answer_vec2, prod2)
  }
}

# Answer
print(answer_vec2)

