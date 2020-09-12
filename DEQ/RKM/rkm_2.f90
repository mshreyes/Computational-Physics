! Program: Runge-Kutta 2nd order method for solving differential equations


program RKM2
implicit none

real, dimension(10000) :: X, Y
real :: FUNC, H, S1, S2
integer :: J, M

    ! Step size
    H = 0.01

    ! initial conditions
    X(1) = 0
    Y(1) = 0.5

    ! Number of steps between the range [0,1]
    M = int(1/H)

    do J  = 1, M

        S1 = FUNC(X(J), Y(J))
        S2 = FUNC(X(J) + H, Y(J) + H*S1)

        Y(J + 1) = Y(J) + (H/2)*(S1 + S2)
        X(J + 1) = X(J) + H

    end do 

    ! data file
    open(unit=10, file="rkm22.txt", status="old")
        
        write(10,*) "# Values of X and Y when h = 0.01 [Runge-Kutta 2nd order method]"

        do J = 1, M
            write(10,*) X(J), Y(J)
        end do

    close(10)

end program RKM2


! ************************************************************************

real function FUNC(X, Y)
implicit none

real :: X, Y

    FUNC = 2*X*Y
    return

end function