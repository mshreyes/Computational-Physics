! **************************************************************************************
! Title: TASEP (MC simulation using averaging over time)
! Name: Shreyes Madgaonkar
! PRN: N19021045
! **************************************************************************************

program TASEP
implicit none

integer :: I, N, T, TW, N1, T1, S1, S2, T2, TS
real :: R1, R2, R3, R4, R5, R6, R7, ALPHA, A, BETA, RHO_AVG, J_AVG
integer, allocatable, dimension(:) :: RHO, J, RHO_TOTAL, J_TOTAL

! paramaters
ALPHA = 0.9
BETA = 0.8
A = 1.0
N = 1000

allocate(RHO(N))
allocate(RHO_TOTAL(N))
allocate(J(N))
allocate(J_TOTAL(N))


T = 0
TW = 3000
T1 = 0
T2 = 0
TS = 0

! initialization
    do I = 1, N
        RHO(I) = 0
        RHO_TOTAL(I) = 0
        J(I) = 0
        J_TOTAL(I) = 0
    end do 

! To generating an initial state by flipping spins of N/2 states
    N1 = int(N/2)

    do I = 1, N1
        call random_number(R1)
        S1 = int(N*R1 + 1)
        
        if (RHO(S1) == 0) then
            RHO(S1) = 1
        else
            RHO(S1) = 0
        end if
    end do  


! Dynamics & recording samples
    do 
        do I = 1, N

            call random_number(R2)
            S2 = int(N*R2 + 1)

        ! dynamics of site i = 1 (first site)
            if (S2 == 1) then       
                
                if (RHO(1) == 0) then

                    call random_number(R3)

                    if (R3 .le. ALPHA) then
                        RHO(1) = 1
                        J(1) = 0
                    else 
                        RHO(1) = 0
                        J(1) = 0
                    end if 

                else if (RHO(1) == 1) then

                    if (RHO(2) == 0) then
                        call random_number(R4)

                        if (R4 .le. A) then
                            RHO(2) = 1
                            RHO(1) = 0
                            J(1) = 1
                            J(2) = 0
                        else 
                            RHO(2) = 0
                            RHO(1) = 1
                            J(1) = 0
                        end if 
                    end if 

                else 
                    J(1) = 0
                end if 
            
        ! dynamics of the site i = N  (Nth site)  
            else if (S2 == N) then       

                if (RHO(N) == 0) then
                    
                    if (RHO(N-1) == 1) then
                        call random_number(R5)

                        if (R5 .le. A) then
                            RHO(N) = 1
                            RHO(N-1) = 0
                            J(N) = 0
                            J(N-1) = 1
                        else 
                            J(N-1) = 0
                        end if 
                    else 
                        J(N-1) = 0
                    end if

                else if (RHO(N) == 1) then

                    call random_number(R6)

                    if (R6 .le. BETA) then
                        RHO(N) = 0
                        J(N) = 0
                    else 
                        J(N) = 0
                    end if 
                
                else 

                    J(S2) = 0

                end if 
            
        ! dynamics of any bulk site     
            else if (S2 > 1 .and. S2 < N) then
                
                    if (RHO(S2) == 1) then

                        if (RHO(S2 + 1) == 0) then
                            call random_number(R7)

                            if (R7 .le. A) then
                                RHO(S2 + 1) = 1
                                RHO(S2) = 0
                                J(S2) = 1
                                J(S2 + 1) = 0
                            else 
                                J(S2) = 0
                                J(S2 + 1) = 0
                            end if  

                        end if
                            
                    else 
                            
                        RHO(S2) = 0
                        J(S2) = 0
                            
                    end if 

            end if
       
        end do 

        T = T + 1

    ! collecting samples after 1000 MC steps
        if (T > TW) then

            T1 = T1 + 1
            
        ! sampling after every 10 samples
            if (mod(T1,10) == 0) then
                
                do I = 1, N 
                    
                    RHO_TOTAL(I) = RHO_TOTAL(I) + RHO(I)
                    J_TOTAL(I) = J_TOTAL(I) + J(I)

                end do

                T2 = T2 + 1
            end if

        end if
        
    ! exit loop after collecting 5000 samples
        if (T2 .ge. 5000) then
            TS = T2
            exit 
        end if 

    end do    


    open(unit = 100, file = 'plots\TASEP.dat')

        do I = 1, N
            
            RHO_AVG = real(RHO_TOTAL(I))/real(TS)
            J_AVG = real(J_TOTAL(I))/real(TS)

            write(100,*) I, RHO_AVG, J_AVG

        end do

    close(100)


deallocate(RHO, RHO_TOTAL, J, J_TOTAL)


end program TASEP