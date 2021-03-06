% SUM OF SUM, DPS DF, EXACT
function out = SOSforExactDPSDF(lSRk,lRkDm,snrth,alpha,beta,SETfull)
out = 0;
mu = snrth/alpha;
for ii = 1:length(SETfull)
    elements = nchoosek(SETfull,ii); % n_1 < ... < n_t
    [row,column] = size(elements);
    for rr = 1:row
        subsum = 0; 
        for cc = 1:column
            subsum = subsum + lSRk(elements(rr,cc));
        end        
        X = @(x) exp(- x.*subsum - snrth./beta./x.*lRkDm );
        temp = integral(X,mu,inf);
        out = out + ((-1)^(ii+1)) * subsum * temp;
    end
end