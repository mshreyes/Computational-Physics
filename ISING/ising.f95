! **************************************************************************************
! Title: Monte Carlo simulation of Ising model (by implementing Metropolis algorithm)
! Name: Shreyes Madgaonkar 
! PRN: N19021045


program ising 
implicit none    


integer :: N, I, J, ITER, H1, Q1, Q2, H2, H3, K1
real :: EI_TOTAL, EF_TOTAL, DEL_E, KB, BETA, JI, R1, R2, R3, R4, EAVG, MAVG, EA, EAT, MA, MAT, T 
integer, allocatable, dimension(:,:) :: S, SF, SI

! parameters 
N = 10
JI = 1
KB = 1.0
H1 = 0
H2 = 0
H3 = 0

ITER = 0
EA = 0
MA = 0
EAT = 0
MAT = 0

EI_TOTAL = 0
EF_TOTAL = 0

allocate(S(N,N))
allocate(SF(N,N))
allocate(SI(N,N))


! initialization
    do I = 1, N
        do J = 1, N

            call random_number(R1)

            if (R1 < 0.5) then 
                S(I,J) = -1
                SF(I,J) = -1
            else 
                S(I,J) = 1
                SF(I,J) = 1
            end if 

        end do 

    end do


open(24, file='plots\ising.dat')

T = 0

! calculating averages for a particular T
do 

    T = T + 0.005
    BETA = 1/real(KB*T)
    
    ! dynamics and collection of sample
    do 
        
        ! one Monte Carlo step
        do K1 = 1, int(N**2)

            call random_number(R2)
            call random_number(R3)

            Q1 = int(N*R2 + 1)
            Q2 = int(N*R3 + 1)

            do I = 1, N 
                do J = 1, N 
                    SI(I,J) = S(I,J)
                end do 
            end do
 
            ! Trial move
            SF(Q1,Q2) =  0 - S(Q1,Q2)
            
            call ENERGY(N, S, EI_TOTAL)
            call ENERGY(N, SF, EF_TOTAL)

            DEL_E = EF_TOTAL - EI_TOTAL
            
            if (DEL_E .le. 0) then 

                do I = 1, N 
                    do J = 1, N 
                        S(I,J) = SF(I,J)
                    end do 
                end do

            else 

                call random_number(R4)

                if (R4 < exp((-1)*BETA*DEL_E)) then
                    
                    do I = 1, N 
                        do J = 1, N 
                            S(I,J) = SF(I,J)
                        end do 
                    end do

                else

                    do I = 1, N 
                        do J = 1, N 
                            S(I,J) = SI(I,J)
                        end do 
                    end do
                end if 

            end if 
            
        end do

        ITER = ITER + 1

        ! collecting samples after 1000 MC steps
        if (ITER > 1000) then 
            H1 = H1 + 1
            
            if (mod(H1,10) == 0) then
                call MAG(N, S, MA)
                call ENERGY(N, S, EA)
                
                EAT = EAT + EA/real(N**2) 
                MAT = MAT + abs(MA)/real(N**2)

                H2 = H2 + 1
            end if

        end if 

        ! exit loop after collecting 5000 samples
        if (H2 .ge. 5000) exit

    end do

    EAVG = real(EAT)/real(H2)
    MAVG = real(MAT)/real(H2)

    write(24,*) 1/real(BETA*JI), EAVG, MAVG

    if (T .ge. 10.0) exit 
    
end do 

close(24)

deallocate(S,SF,SI)

end program ising
! **************************************************************************************


! **************************************************************************************
! Subroutine for calculating energy of a spin configuration
! **************************************************************************************

subroutine ENERGY(N, S, EOUT)
implicit none 

integer :: I, J 
real :: TOTAL, N1, N2, N3, N4, JI  
integer, intent(in) :: N
integer, intent(in) :: S(N,N) 
real, intent(out) :: EOUT 

TOTAL = 0
JI = 1

    do I = 1, N 
        do J = 1, N 

            if (J+1 > N) then 
                if (S(I,J) == S(I,1)) then 
                    N1 = 1
                else 
                    N1 = - 1
                end if 
            else 
                if (S(I,J) == S(I,J+1)) then 
                    N1 = 1
                else 
                    N1 = - 1
                end if
            end if 

            if (I+1 > N) then 
                if (S(I,J) == S(1,J)) then 
                    N2 = 1
                else 
                    N2 = - 1
                end if
            else 
                if (S(I,J) == S(I+1,J)) then 
                    N2 = 1
                else 
                    N2 = - 1
                end if
            end if

            if (J-1 < 1) then 
                if (S(I,J) == S(I,N)) then 
                    N3 = 1
                else 
                    N3 = - 1
                end if
            else 
                if (S(I,J) == S(I,J-1)) then 
                    N3 = 1
                else 
                    N3 = - 1
                end if
            end if

            if (I-1 < 1) then 
                if (S(I,J) == S(N,J)) then 
                    N4 = 1
                else 
                    N4 = - 1
                end if
            else 
                if (S(I,J) == S(I-1,J)) then 
                    N4 = 1
                else 
                    N4 = - 1
                end if
            end if

            TOTAL = TOTAL  - 0.5*JI*(N1 + N2 + N3 + N4)
        end do 
    end do

EOUT = real(TOTAL) 

end subroutine ENERGY
! **************************************************************************************




! **************************************************************************************
! Subroutine for calculating total magnetization of a configuration
! **************************************************************************************

subroutine MAG(N, S, M)
implicit none

integer :: I, J
real :: K
integer, intent(in) :: N
integer,intent(in) :: S(N,N)
real,intent(out) ::  M

K = 0

    do I = 1, N 
        do J = 1, N
            K = K + S(I,J) 
        end do 
    end do 

    M = real(K)

end subroutine MAG
! **************************************************************************************
