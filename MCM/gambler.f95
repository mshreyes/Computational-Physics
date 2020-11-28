! Title: Gambler's ruin problem

program Gamblers_ruin
implicit none

real :: P, Q, PRAND
integer :: J, NC, WIN, LOSS, C, GAMES, I

real, allocatable, dimension(:) :: PW, QL, PA
integer, allocatable, dimension(:) :: IC

allocate(IC(9))     ! initial capital
allocate(PW(9))     ! probability of A winning the game
allocate(QL(9))     ! probability of A losing the game
allocate(PA(9))     ! (analytical) probability that A wins the game

! initialization
do J = 1, 9
    IC(J) = 2*J
end do

! parameters
P = 0.4   ! probability that A wins one round
Q = 1 - P  ! probability that A loses one round
NC = 20     ! total capital 

! (Analytically obtained) Probability of A winning the game
if (abs(p - 0.5) .ge. 10.0**(-6)) then      ! when p is not equal to 0.5
    do I = 1, 9
        PA(I) = (1.0 - (Q/P)**IC(I))/(1.0 - (Q/P)**NC)
    end do
else if (abs(p - 0.5) .le. 10.0**(-6)) then     ! when p is equal to 0.5
    do I = 1, 9
        PA(I) = real(IC(I))/real(NC)
    end do
end if

! Number of games played (ensembles-like)
GAMES = 20000


do J = 1, 9

    WIN = 0
    LOSS = 0    

    do I = 1, GAMES
        
        C = IC(J)

        ! a loop for a single game 
        do
            ! one round is everytime a random number is called
            call random_number(PRAND)

            if (PRAND .le. P) then
                C = C + 1       ! A wins a round
            else 
                C = C - 1       ! A loses a round 
            end if 

            if (C == NC) then 
                WIN = WIN + 1       ! exit when A wins a game (i = N)       
                exit
            end if

            if (C == 0) then 
                LOSS = LOSS + 1     ! exits when A loses a game (i = 0) 
                exit
            end if
        end do
    end do

    ! probability that A wins a game
    PW(J) = real(WIN)/real(GAMES) 

    ! probability that A loses a game
    QL(J) = 1 - PW(J)

end do


open(unit = 60, file = 'plots\gambler.dat')

    write(60,*) "# Games played: ", GAMES
    write(60,*) "#      i      P(i)         PA(i)       Error"
    write(60,*)

    ! probability distribution 
    do J = 1, 9
        write(60,9) IC(J), PW(J), PA(J), abs(PW(J)-PA(J))
    end do

close(60)

9 format(I8,4x,F9.7,4x,F9.7,4x,F10.8)

deallocate(IC,PW,QL,PA)

end program Gamblers_ruin