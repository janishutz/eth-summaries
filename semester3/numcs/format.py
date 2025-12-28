def simpson(f, a, b, N):
    x, h = np.linspace(a, b, 2 * int(N) + 1, retstep=True)
    I = h / 3.0 * (np.sum(f(x[::2])) + 4.0 * np.sum(f(x[1::2])) + f(x[0]) - f(x[-1]))
    return I
