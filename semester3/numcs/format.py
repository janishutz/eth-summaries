import numpy as np
import scipy as sp


def fastbroyd(x0, F, J, tol=1e-12, maxit=20):
    x = x0.copy()  # make sure we do not change the iput
    lup = sp.linalg.lu_factor(J)  # LU decomposition of J
    s = sp.linalg.lu_solve(lup, F(x))  # start with a Newton corection
    sn = np.dot(s, s)  # squared norm of the correction
    x -= s
    f = F(x)  # start with a full Newton step
    dx = np.zeros((maxit, len(x)))  # containers for storing corrections s and their sn:
    dxn = np.zeros(maxit)
    k = 0
    dx[k] = s
    dxn[k] = sn
    k += 1  # the number of the Broyden iteration

    # Broyden iteration
    while sn > tol and k < maxit:
        w = sp.linalg.lu_solve(lup, f)  # f = F (actual Broyden iteration x)
        # Using the Sherman-Morrison-Woodbury formel
        for r in range(1, k):
            w += dx[r] * (np.dot(dx[r - 1], w)) / dxn[r - 1]
            z = np.dot(s, w)
            s = (1 + z / (sn - z)) * w
            sn = np.dot(s, s)
            dx[k] = s
            dxn[k] = sn
            x -= s
            f = F(x)
            k += 1  # update x and iteration number k
    return x, k  # return the final value and the numbers of iterations needed
