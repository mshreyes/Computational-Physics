!Title: To find the solutions for Lorenz equations using Runge-Kutta 4th order method

program LORENZ
implicit none

!declaration of variables and arrays
real, dimension(:), allocatable :: X, Y, Z, T
real :: FN, GN, HN
real :: H, K1, K2, K3, K4, L1, L2, L3, L4, M1, M2, M3, M4
integer :: I, J
    
    !allocate arrays
    J = 25000
    allocate(X(J), Y(J), Z(J), T(J))

    !step size
    H = 0.01

    !initial conditions
    T(1) = 0
    X(1) = 2.0
    Y(1) = 2.0
    Z(1) = 5.0

    !Runge-Kutta 4th order method
    do I = 1, 20000 

        K1 = FN(X(I), Y(I))
        L1 = GN(X(I), Y(I), Z(I))
        M1 = HN(X(I), Y(I), Z(I))


        K2 = FN(X(I) + (H/2)*K1, Y(I) + (H/2)*L1)
        L2 = GN(X(I) + (H/2)*K1, Y(I) + (H/2)*L1, Z(I) + (H/2)*M1)
        M2 = HN(X(I) + (H/2)*K1, Y(I) + (H/2)*L1, Z(I) + (H/2)*M1)


        K3 = FN(X(I) + (H/2)*K2, Y(I) + (H/2)*L2)
        L3 = GN(X(I) + (H/2)*K2, Y(I) + (H/2)*L2, Z(I) + (H/2)*M2)
        M3 = HN(X(I) + (H/2)*K2, Y(I) + (H/2)*L2, Z(I) + (H/2)*M2)

        K4 = FN(X(I) + H*K3, Y(I) + H*L3)
        L4 = GN(X(I) + H*K3, Y(I) + H*L3, Z(I) + H*M3)
        M4 = HN(X(I) + H*K3, Y(I) + H*L3, Z(I) + H*M3)

        X(I+1) = X(I) + (H/6)*(K1 + 2*K2 + 2*K3 + K4)
        Y(I+1) = Y(I) + (H/6)*(L1 + 2*L2 + 2*L3 + L4)
        Z(I+1) = Z(I) + (H/6)*(M1 + 2*M2 + 2*M3 + M4)

        T(I+1) = T(I) + H
    end do

    !store data in a file
    open(unit=21, file='plots\leqn2.dat')
       
        do I = 1, 20000
            write(21,*) T(I), X(I), Y(I), Z(I)
        end do
    
    close(21) 
    
    !deallocate arrays
    deallocate(X, Y, Z, T)

end program LORENZ

!***********************************************************

real function FN(X, Y)
implicit none
real :: X, Y, SIG

SIG = 10

FN = SIG*(Y - X)
return

end function FN

!***********************************************************

real function GN(X, Y, Z)
implicit none
real :: X, Y, Z, R
R = 28

GN = X*(R - Z) - Y
return

end function GN

!***********************************************************

real function HN(X, Y, Z)
implicit none
real :: X, Y, Z, B
B = 8.0/3.0

HN = X*Y - B*Z
return

end function HN