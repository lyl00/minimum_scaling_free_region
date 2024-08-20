function [A,empty_flag] = generate_coeffs_matrix(polynomial_func, X, monomials, intermediates)
% GENERATE_COEFFS_MATRIX generate Aij for each <Aij, Xj> in standard SDP
% problem consistent with mosek conic programming formulation. refer to:https://docs.mosek.com/latest/toolbox/tutorial-sdo-shared.html
% Input: polynomial_func is the polynomial function with respect to the intermediate [x y z]
%        monomials is the monomials in [x y z], whose coefficients
%        matrix is needed and monomial_index is the current query coefficients
% Output:Coefficients matrix A corresponding to this query (monomial_index)
% e.g.   Aij = generate_coeffs_matrix(f_matrix(m,n+1), eval(strcat('X',num2str(m),num2str(n)), monomials(i))
empty_flag = 0;
size_A = size(X,1);
A = zeros(size_A);
A = sym(A);
X_coeff = coeffs_term(polynomial_func,monomials,intermediates);
[c,t] = coeffs(X_coeff, X);
if isempty(t)==1
    empty_flag = 1;
else
    for i = 1:size(t,2)
        str = string(t(i));
        str_split = split(str,'_');
        index_row = str2double(str_split(end-1));
        index_column = str2double(str_split(end));
        A(index_row,index_column) = c(i);
    end

end

end

