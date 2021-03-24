# alterable parameters
b = 0.55
d = 0.5
init_pop = 100
num_iterations = 100

birth_prob = b / (b + d)
death_prob = d / (b + d)

n = init_pop
i = 0

populations = c(n)
iterations = c(i)

while(n > 0 && i < num_iterations) {
  if (birth_prob < runif(1)) {
    n = n + 1
  } else {
    n = n - 1
  }
  populations = c(populations, n)
  iterations = c(iterations, i)
  i = i + 1
}

plot(iterations, populations, type="l", main="Demographic stochasticity")
if(populations[length(populations)] <= 0) {
  sprintf("Population extinct after %d iterations", i)
}
