syms t s
syms a b positive
Mt=[dirac(t-a),heaviside(t-b);exp(-a*t)*sin(b*t),t^2*cos(3*t)]
MS=laplace(Mt,t,s)