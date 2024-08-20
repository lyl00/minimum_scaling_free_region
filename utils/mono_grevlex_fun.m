function y_mon = mono_grevlex_fun(x,degmax)
% MONO_GREVLEX_FUN 
  
% Generate monomials following the grevlex order
% e.g., for intermediates x = [x,y,z], degmax = 2
% y_mon = [1,x,y,z,x^2,xy,xz,y^2,yz,z^2];

nvar = size(x,2);
% nvar = 2;
vpow = [];
for k = 0:degmax
 vpow = [vpow;genpow(nvar,k)];
end

% Build monomial vector entrywise
% by calling constructor @MPOL/MPOL
dm = size(vpow,1);
var = cell(dm,1);
pow = var;
coef = var;
for k = 1:dm
 var{k} = x;
 pow{k} = vpow(k,:);
 coef{k} = 1;
end
y_str = struct('var',var,'pow',pow,'coef',coef);
y_mon = [];
for i = 1:dm
    monomial = y_str(i).coef;
    for j = 1:nvar
        monomial = monomial * y_str(i).var(j)^y_str(i).pow(j);
    end
    y_mon = [y_mon;monomial];
end

end