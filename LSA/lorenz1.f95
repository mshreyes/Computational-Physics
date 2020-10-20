!Title: To find the solutions for Lorenz equations using Euler's method


program LORENZ
implicit none

!declaration of variables and arrays
real, dimension(:), allocatable :: X, Y, Z, T
real :: FN, GN, HN
real :: H
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

    !Euler's method
    do I = 1, 20000 

        X(I+1) = X(I) + H*FN(X(I), Y(I)) 
        Y(I+1) = Y(I) + H*GN(X(I), Y(I), Z(I)) 
        Z(I+1) = Z(I) + H*HN(X(I), Y(I), Z(I))

        T(I+1) = T(I) + H

    end do

    !store data in a file
    open(unit=21, file='plots\leqn1.dat')
       
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
real, intent(in) :: X, Y
real :: SIG
SIG = 10

FN = SIG*(Y - X)
return 

end function FN

!***********************************************************

real function GN(X, Y, Z)
implicit none
real, intent(in) :: X, Y, Z
real :: R
R = 28

GN = X*(R - Z) - Y
return 

end function GN

!***********************************************************

real function HN(X, Y, Z)
implicit none
real, intent(in) :: X, Y, Z
real :: B
B = 8.0/3.0

HN = X*Y - Z*B
return 

end function HN