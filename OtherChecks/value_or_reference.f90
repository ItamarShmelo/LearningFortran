program value_or_reference
    implicit none

    real(8), dimension(:), allocatable :: array_uno, array_dos

    allocate(array_uno(5), array_dos(5))

    array_uno = 1.d0

    array_dos = array_uno

    array_dos(3) = 5.d0

    write(*, *) "array uno :: ", array_uno
    write(*, *) "array dos :: ", array_dos
    
end program value_or_reference