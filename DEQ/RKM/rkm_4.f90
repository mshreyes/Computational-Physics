! Program: Runge-Kutta 4th order method for solving differential equations


program RKM4
implicit none

real, dimension(10000) :: X, Y
real :: FUNC, H, S1, S2, S3, S4
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
        S2 = FUNC(X(J) + H/2, Y(J) + (H/2)*S1)
        S3 = FUNC(X(J) + H/2, Y(J) + (H/2)*S2)
        S4 = FUNC(X(J) + H, Y(J) + H*S3)

        Y(J + 1) = Y(J) + (H/6)*(S1 + 2*S2 + 2*S3 + S4)
        X(J + 1) = X(J) + H

    end do 

    ! data file
    open(unit=11, file="rkm42.txt", status="old")
        
        write(11,*) "# Values of X and Y when h = 0.01 [Runge-Kutta 4th order method]"

        do J = 1, M
            write(11,*) X(J), Y(J)
        end do

    close(11)

end program RKM4


! ************************************************************************

real function FUNC(X, Y)
implicit none

real :: X, Y

    FUNC = 2*X*Y
    return

end function FUNC