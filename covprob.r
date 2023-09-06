set.seed(5160)
cnt<-10000
n<-15
prop<-0.55
wci<-0
acci<-0

for (i in 1:cnt){

    sample<-rbinom(n, size = 1, prob = prop)
    sample_prop <-sum(sample)/n 
    p_prime=(sum(sample)+2)/(n+4)
    
    #Wald CI Cov.Prob.:
    wald_lower<-sample_prop-1.96*sqrt(sample_prop*(1-sample_prop)/n)
    wald_upper<-sample_prop+1.96*sqrt(sample_prop*(1-sample_prop)/n)
    if (prop >= wald_lower && prop <= wald_upper) {
    wci <-(wci+1)
    }

    #A-C CI Cov.Prob.:
    ac_lower <- p_prime-1.96*sqrt((p_prime*(1-p_prime))/ (n+4))
    ac_upper <- p_prime+1.96*sqrt((p_prime*(1-p_prime))/ (n+4))
    if (prop >= ac_lower && prop <= ac_upper) {
    acci<-(acci + 1)
    }

}
ac_covprob<-(acci/cnt)
w_covprob<-(wci/cnt)

cat("Agresti-Coull Coverage Probability:", ac_covprob, "\n")
cat("Wald Coverage Probability:", w_covprob, "\n")