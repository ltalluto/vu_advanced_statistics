## Monty Hall Problem
library(ggplot2)
lets_make_a_deal = function(x) {
	prizes = c("goat", "goat", "car")
	prizes = sample(prizes) #randomizes the order
	initial_choice = sample(1:3, 1)
	# choose a door with a goat to reveal, excluding our initial choice and the car
	revealed_goat = (1:3)[-initial_choice]
	revealed_goat = revealed_goat[prizes != "car"]
	revealed_goat = sample(revealed_goat, 1)
	
	winning_strategy = ifelse(prizes[initial_choice] == "car", "stay", "switch")
	return(winning_strategy)
}

games = data.frame(strategy = sapply(1:1000, lets_make_a_deal))
ggplot(games, aes(x=strategy)) + geom_bar(aes(y=after_stat(count/sum(count))), width = 0.5) + ylab("Proportion winning")
