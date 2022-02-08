from re import X


def tangente(A):
    A = matrix(A)
    print(A)
    Q, R = A.transpose().QR()
    print(Q)
    print(R)

def EulerNewtonContinuacionHomotopica(H, x0, h, N, M):
    u = vector((*x0, 0))
    J = H.diff()
    for k in [1..N]:
        v = u + h*tangente(J(*u))
        for j in [1..M]:
            v = v - invMoorePenrose(J(*v))*J(v)
        u = v
    return u

x = var('x')
t = var('t')
f(x) = cos(x)-x
x0 = vector([0])
H(x,t) = f(x)-(1-t)*f(*x0)
print(EulerNewtonContinuacionHomotopica(H, x0, 0.1, 10, 10))