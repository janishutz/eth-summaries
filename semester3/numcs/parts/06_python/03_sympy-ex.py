import sympy as sp

a, b = (0, 1);
x, y = sp.symbols("x, y")  # Create sympy symbols
f = x**2 + 3 * x - 2  # Create your function
# In the below, for 1D differentiation, we can omit the symbol and just use sp.diff(f)
df = sp.diff(f, x)  # Add more arguments for derivatives in other variables
F = sp.integrate(f, x)  # Integrates the function analytically in x
F = sp.integrate(f, (x, a, b))  # Indefinite integral in x in interval [a, b]
lambda_f = sp.lambdify(x, F)  # Creates a lambda function of F in variable x
lambda_f = sp.lambdify([x, y], F)  # Creates a lambda function of F in variables x and y
roots = sp.roots(f)  # Computes the roots of function f analytically
sp.hermite_poly(5)  # Creates hermite poly of degree 5
sp.chebyshevt_poly(5)  # Creates chebychev T (first kind) poly of degree 5
sp.chebyshevu_poly(5)  # Creates chebychev U (second kind) poly of degree 5
