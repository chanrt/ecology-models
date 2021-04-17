# initial populations
prey0 = 10
predator0 = 4

# environmental parameters
prey_growth = 6
interaction = 3
dependence = 2
predation = 1
stabiliser = 1

# simulations parameters
T = 10
dt = 0.01
num_iterations = T/dt

prey = numeric(num_iterations)
prey[1] = prey0
predator = numeric(num_iterations)
predator[1] = predator0

for(i in 2:num_iterations) {
  
  prey[i] = prey[i-1] + (prey_growth * prey[i-1] - interaction * prey[i-1] * predator[i-1]) * dt
  predator[i] = predator[i-1] + (predation * prey[i-1] * predator[i-1] - dependence * predator[i-1]) * dt
  
  if(prey[i] < stabiliser) {
    prey[i] = stabiliser
  }
  if(predator[i] < stabiliser) {
    predator[i] = stabiliser
  }
}

time = seq(from = dt, to = T, by = dt)
title = "Simulation of Lotka-Volterra Model"
max_y = max(c(max(prey, predator)))

plot(time, prey, xlab = "Generations", ylab = "Populations", main = title, type = "l", col = "blue", ylim = c(0, max_y))
lines(time, predator, type = "l", col = "red")
legend(x = T, y = NULL, legend = c("Predator", "Prey"), col = c("red", "blue"), lty = 1)