# binom_cov_prob
R code that calculates the coverage probabilities for Wald and Agresti-Coull confidence intervals on binomial trial simulation 

Based on Wikipedia, The coverage probability, or coverage for short, is the probability that a confidence interval or confidence region will include the true value (parameter).
The construction of the confidence interval ensures that the probability of finding the true parameter $\Theta$ in the sample-dependent interval $(T_u,T_v)$ is (at least) $\Gamma$:
$$\mathbf{P}(T_u\leq \Theta \leq T_v)\geq \Gamma, \forall \Theta $$

Brief process:
1. Use `rbinom()` function to generate a random sample of n binary outcomes, where `size` option specifies the i.i.d. property of the data generated, which accords with basic rules of binomial distribution.
2. Get $\hat{p}$ and $\hat{p}'$ under the simulation, where $\hat{p}'=\frac{y+2}{n+4}$, $2$ comes from the approximation of 1.96, the z-statistics for $\alpha=0.05$, $4$ comes from $1.96^2$
3. Calculate both Wald and Agresti-Coull confidence intervals, record them separately. Note that the Agresti-Coull confidence intervals is calculated as $$\hat{p}'\pm z_{1-\frac{\alpha}{2}}\sqrt{\frac{\hat{p}'(1-\hat{p}')}{n+4}}$$
4. Record the $True$'s (for if the parameter `prop`, namely $\pi$ is in the CI), separately.
5. Repeated step 1-4 for `cnt` times.
6. Calculate the coverage probabilities by calculating $\frac{True}{\verb|cnt|}$
