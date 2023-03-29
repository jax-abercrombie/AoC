# Link to task: https://adventofcode.com/2020/day/1

# Import list
expense_list_df <- read.delim("~/AoC/2020/Day 1/puzzle_input.txt")
expense_list <- as.vector(expense_list_df$X1348)

# Make all combinations from list of expenses
expense_combos <- combn(expense_list, 2, simplify = TRUE)

# Make loop to iterate over all combinations, sum them to see if they equal 2020, and mutliply them if so
answer_vec <- c()
for (combo in 1:length((expense_combos)/2)-2){
  combo_sum <- sum(expense_combos[combo+2:combo+2])
  if (combo_sum == 2020){
    answer_vec <- c(answer_vec, expense_combos[combo], expense_combos[combo+1])
    product <- (expense_combos[combo])*(expense_combos[combo+1])
    answer_vec <- c(answer_vec, product)
  }
}

# Answer
print(answer_vec)

