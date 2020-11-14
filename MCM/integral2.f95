!Title: Monte Carlo integration
!Approach 2: Averaging of function (integrand) over number of trials

program MC_INTEGRATION
    implicit none
        
    real :: G
    real :: X, FW, AREA, A1, A2, B1, B2, Y, X1, Y1
    integer :: I, N, NS 
    
        N = 10000
        NS = 0
    
        !Limits of variable X
        A1 = 0.0
        A2 = 10.0
    
        !Limits of variable Y
        B1 = 0.0 
        B2 = 5.0
    
        !Width of rectangle in 1st quadrant
        FW = A2 - A1
    
        !Initialization of function value for Approach 2
        Y = 0
    
        do I = 1, N
            call random_number(Y1)
            call random_number(X1) 
            
            !random variable in the range (0,10)
            X = (A2 - A1)*X1 + A1

            !sum of function at X
            Y = Y + G(X)
    
        end do
    
        
        !Average of values of function at random points within the domain
        !Area by approach 2
        AREA = 4*(Y/real(N))*FW
        
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