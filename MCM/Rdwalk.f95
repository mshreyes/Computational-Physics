! Title: 2D Random walk simulation using Monte Carlo method
! Name: SHreyes Madgaonkar
! PRN: N19021045

program RDWALK1
implicit none
    
real :: A, P
integer :: I, J, N, K, M, S

    N = 10
    
    open(unit=15, file='rdwalk1.dat')

    S = 0 

        do K = -10, 10
        
            do J = 1, 1000
                
                do I = 1, N

                    call random_number(A)        

                    if (A .lt. 0.5) then
                        S = S + 1
                    else 
                        S = S - 1
                    end if

                end do

                if (S == K) then 
                    M = M + 1
                    S = 0
                else 
                    S = 0
                end if 

                

            end do 

            P = real(M)/1000
                
            write(15,*) K, P
            M = 0

        end do 

    close(15) 
     
end program RDWALK1
