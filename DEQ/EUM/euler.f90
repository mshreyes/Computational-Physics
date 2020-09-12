! Program: Euler's method for solving differential equations


program EULER
implicit none

! declaration of variables and arrays 
real, dimension(10000) :: X, Y
real :: FUNC, H
integer :: J, N, M

    ! Step size
    H = 0.01

    ! Initial conditions
    X(1) = 0
    Y(1) = 0.5

    ! Number of steps between the range [0,1]
    M = int(1/H) 

    do J  = 1, M

        Y(J + 1) = Y(J) + H*FUNC(X(J), Y(J))
        X(J + 1) = X(J) + H

    end do 

    ! data file 
    open(unit=4, file="euler2.txt", status="old")
        
        write(4,*) "# Values of X and Y when h = 0.01"

        do J = 1, M
            write(4,*) X(J), Y(J)
        end do

    close(4)

end program EULER


! ************************************************************************

real function FUNC(X, Y)
implicit none

real :: X, Y

    FUNC = 2*X*Y
    return

end function