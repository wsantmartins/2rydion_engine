function w = ergotropy(A, B, C, im_a, re_a, omega)

%phi = atan(C./(A - B));
aux = (C.^2 + (A - B).^2)./(A + B).^2;
r = 0.5*atan(sqrt(aux));
n_bar = atan(sqrt(aux + 1));
n_bar = (A + B)./(2.0.*cosh(n_bar)) - 0.5;

a = im_a.^2.0 + re_a.^2.0;

w = real(sqrt(3)*omega*((2.0.*n_bar + 1.0).*(sin(r).^2) + a));

end