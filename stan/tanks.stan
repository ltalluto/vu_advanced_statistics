data {
   int <lower = 1> n; // number of data points
   vector <lower=1> [n] s; // captured serial numbers
}
parameters {
   real <lower = max(s)> Nmax;
}
model {
   s ~ uniform(1, Nmax); // likelihood
   // this is a super vague prior!
   Nmax ~ gamma(0.001, 0.001);  
}
