!Title: 2D Random walk simulation using Monte Carlo method

program RDWALK1
implicit none
    
real, dimension(:), allocatable :: X, Y
real :: A, B
integer :: I, J

    J = 200000
    allocate(X(J)) 
    allocate(Y(J)) 
    
    X(1) = 0
    Y(1) = 0

    do I = 1, J-1
        call random_number(A)
        call random_number(B)
        

        if (A .lt. 0.5) then
            X(I+1) = X(I) + 1
        else 
            X(I+1) = X(I) - 1
        end if

        if (B .lt. 0.5) then
            Y(I+1) = Y(I) + 1
        else 
            Y(I+1) = Y(I) - 1
        end if

    end do

    open(unit=15, file='rdwalk1.dat')
        
        write(15,*) "#  Average of steps along X axis = ", SUM(X)/J
        write(15,*) "#  Average of steps along Y axis = ", SUM(Y)/J
        write(15,*) "#  X               Y    "

        do I = 1, J
            write(15,*) X(I), Y(I)
        end do

    close(15) 
     
    deallocate(X, Y)

end program RDWALK1
