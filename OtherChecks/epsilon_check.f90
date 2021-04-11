program epsilon_check
    implicit none
    
    real(8) :: sasha
    real(4) :: itamar

    write(*, *) "epsilon real(4)", epsilon(itamar)
    write(*, *) "epsilon real(8)", epsilon(sasha)
    
end program epsilon_check