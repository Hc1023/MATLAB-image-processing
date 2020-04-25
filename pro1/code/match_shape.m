function[sim_shape]=match_shape(M,N)
r1=ratio(M);
r2=ratio(N);
sim_shape=min(r1,r2)/max(r1,r2);
