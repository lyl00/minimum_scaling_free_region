function [polynomial_sos, dim_sos, X] = gen_sos_polynomial(degree,intermediate,var_name)
%GEN_SOS_POLYNOMIAL generates SOS polynomial function of degree 2*degree with
%respect to the intermediates.
%intermediates: eg. euclidean coordinate [x, y, z]
monomials = mono_grevlex_fun(intermediate,degree);
dim_sos = size(monomials,1);
syms X;
for i = 1:dim_sos
    for j = 1:dim_sos
        elementname = strcat(var_name,'_',num2str(i),'_',num2str(j));
        X(i,j) = sym(elementname);
    end
end

polynomial_sos = monomials'*X*monomials; % sigma = [x]^T_d*X*[x]_d

end

