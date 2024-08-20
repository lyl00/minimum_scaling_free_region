function c_term = coeffs_term(polynomial,term,var)
% COEFFS_TERM extract coefficients of specific single/vector of terms in a multi-variate
% polynomial function
% e.g. f = 3x^3 + 2x^2*y + 4y^2*z,
% then coeffs_term(f,y^2*z,[x,y,z]) = 4
[c,t] = coeffs(polynomial,var);
% extract coeffs of one single term
c_term = [];
c_term = sym(c_term);
for i = 1:size(term)
    if isempty(find(t==term(i)))==1
        c_term_ = 0;
    else
        c_term_ = c(find(t==term(i)));
    end
    c_term = [c_term;c_term_];
end

