# alterable parameters
b = 0.55
d = 0.5
n = 10
num_iterations = 100

birth_prob = b / (b + d)
death_prob = d / (b + d)
extinct = 0

populations = numeric(num_iterations)
populations[1] = n

for(i in 2:num_iterations) {
  if(populations[i-1] <= 0) {
    extinct = i
    break
  }
  if (birth_prob < runif(1)) {
    populations[i] = populations[i-1] + 1
  } else {
    populations[i] = populations[i-1] - 1
  }
}

iterations = seq(from = 1, to = num_iterations, by = 1)
plot(iterations, populations, type="l", main="Demographic stochasticity")

if(extinct) {
  sprintf("Populations extinct after %d iterations", extinct)
}

