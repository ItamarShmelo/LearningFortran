program epsilon_check
    implicit none
    
    real(8) :: sasha
    real(4) :: itamar

    itamar = 1.0
    sasha = 1.d0

    write(*, *) "epsilon real(4)", epsilon(itamar)
    write(*, *) "epsilon real(8)", epsilon(sasha)
    
end program epsilon_check