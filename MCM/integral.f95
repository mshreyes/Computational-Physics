!Title: Monte Carlo integration
!Approach 1: Hit-and-Pass Monte Carlo Integration

program MC_INTEGRATION
implicit none
    
real :: G
real :: X, Y, FH, FW, AREA, A1, A2, B1, B2
integer :: I, N, NS 

    N = 10000 
    NS = 0 

    !Limits of variable X
    A1 = 0.0
    A2 = 10.0

    !Limits of variable Y
    B1 = 0.0 
    B2 = 5.0

    !Height and width of rectangle in 1st quadrant
    FH = B2 - B1
    FW = A2 - A1

    do I = 1, N
        
        !random variable in the range (0,10)
        X = (A2 - A1)*rand() + A1

        !random variable in the range (0,5)
        Y = (B2 - B1)*rand() + B1

        if (Y < G(X)) then
            NS = NS + 1 
        else 
            NS = NS + 0
        end if

    end do

    AREA = 4*(real(NS)/real(N))*FH*FW

    write(*,*) "Area of ellipse (by analytical method):" 
    write(*,*) "157.079633"
    write(*,*) "Area of ellipse (by Monte Carlo method): " 
    write(*,*) AREA
    
end program MC_INTEGRATION

!****************************************

real function G(X)
implicit none 

real :: X, A, B 
A = 10.0
B = 5.0

G = B*sqrt(1 - (X/A)**2)

return
end function 