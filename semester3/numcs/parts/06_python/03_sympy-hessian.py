import sympy as sp

sym = sp.symbols("x, y")
x, y = sym
f = x**2 + y**2

# Compute gradient and hessian
grad = [sp.diff(f, k) for k in sym]
hess = [[sp.diff(f, k).diff(j) for j in sym] for k in sym]

# Compute jacobian of vector function
x_m = sp.MatrixSymbol('x', 2, 1)
two_d_func = sp.Matrix([[x_m[0]**2], [x_m[1]**2]])
jacobi = two_d_func.jacobian(x_m)
