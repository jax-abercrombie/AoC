tic()
# Import input
route <- read.table("~/AoC/2016/day1/2016_day1_input.txt", blank.lines.skip = FALSE, sep = ",", strip.white = TRUE)

# Make DF
route_df <- data.frame(matrix(nrow = length(colnames(route))))
route_df$direction <- NA
route_df$cardinal <- NA
route_df$blocks <- NA

route_df$direction[1] <- "R"
route_df$cardinal[1] <- "E"
route_df$blocks[1] <- 2

for (move in 2:length(colnames(route))){
  direction <- substr(route[1,move], 1, 1)
  blocks <- as.integer(substr(route[1,move], 2, 4))
    
  route_df$direction[move] <- direction
  route_df$blocks[move] <- blocks
}

for (move in 2:length(colnames(route))){
  if (route_df$cardinal[move-1] == "N"){
    if (route_df$direction[move] == "L"){
      route_df$cardinal[move] <- "W"
    }
    else if (route_df$direction[move] == "R"){
      route_df$cardinal[move] <- "E"
    }
  }
  
  if (route_df$cardinal[move-1] == "E"){
    if (route_df$direction[move] == "L"){
      route_df$cardinal[move] <- "N"
    }
    else if (route_df$direction[move] == "R"){
      route_df$cardinal[move] <- "S"
    }
  }
  
  if (route_df$cardinal[move-1] == "S"){
    if (route_df$direction[move] == "L"){
      route_df$cardinal[move] <- "E"
    }
    else if (route_df$direction[move] == "R"){
      route_df$cardinal[move] <- "W"
    }
  }
  
  if (route_df$cardinal[move-1] == "W"){
    if (route_df$direction[move] == "L"){
      route_df$cardinal[move] <- "S"
    }
    else if (route_df$direction[move] == "R"){
      route_df$cardinal[move] <- "N"
    }
  }
}


W <- 
  route_df %>%
  filter(cardinal %in% c("W"))

E <- 
  route_df %>%
  filter(cardinal %in% c("E"))

N <- 
  route_df %>%
  filter(cardinal %in% c("N"))

S <- 
  route_df %>%
  filter(cardinal %in% c("S"))
  

lateral <- abs(sum(as.integer(W$blocks))-sum(as.integer(E$blocks)))
longitudinal <- abs(sum(as.integer(N$blocks))-sum(as.integer(S$blocks)))

hq_distance <- lateral + longitudinal

hq_distance