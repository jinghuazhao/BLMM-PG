library("gap")
set.seed(1234567)
meyer <- within(meyer, {
    y[is.na(y)] <- rnorm(length(y[is.na(y)]), mean(y, na.rm = TRUE), sd(y, na.rm = TRUE))
    g1 <- ifelse(generation == 1, 1, 0)
    g2 <- ifelse(generation == 2, 1, 0)
    id <- animal
    animal <- ifelse(!is.na(animal), animal, 0)
    dam <- ifelse(!is.na(dam), dam, 0)
    sire <- ifelse(!is.na(sire), sire, 0)
})
G <- kin.morgan(meyer)$kin.matrix * 2
library("regress")
r <- regress(y ~ -1 + g1 + g2, ~ G, data = meyer)
r
with(r, h2G(sigma, sigma.cov))
N <- dim(meyer)[1]
data <- with(meyer, list(N = N, y = y, g1 = g1, g2 = g2, u = rep(0, N), GI = solve(G)))
inits <- function() list(b1 = 0, b2 = 0, sigma.p = 0.03, sigma.r = 0.014)
modelfile <- function() {
  b1 ~ dnorm(0, 0.001)
  b2 ~ dnorm(0, 0.001)
  sigma.p ~ dunif(0, 1000)
  sigma.r ~ dunif(0, 1000)
  p <- pow(sigma.p, 2)
  r <- pow(sigma.r, 2)
  tau <- pow(sigma.r, -2)
  g[1:N] ~ dmnorm(u[], GI[, ]/p)
  for(i in 1:N) {y[i] ~ dnorm(b1*g1[i] + b2 * g2[i] + g[i], tau)}
  h2 <- p / (p + r)
}
library("R2jags")
jagsfit <- jags(data, inits, parameters.to.save = c("b1", "b2", "p", "r", "h2"), 
                model.file = modelfile, n.chains = 4, n.burnin = 5000, n.iter = 10000)
save(jagsfit, file = "jags3.fit")
print(jagsfit)
