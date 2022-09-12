function w = ergotropy(A, B, C, x2, p2, omega, del_omega)

%phi = atan(C./(A - B));
aux = (C.^2 + (A - B).^2)./(A + B).^2;
n_bar = atan(sqrt(aux + 1));
n_bar = (A + B)./(2.0.*cosh(n_bar)) - 0.5;

w = real(0.5*sqrt(omega).*p2 + 0.5*sqrt(omega).*(omega + del_omega'.^2/(3*omega)).*x2 - n_bar);

end