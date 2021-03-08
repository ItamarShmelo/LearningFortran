program calculate_pi
    implicit none
    
    integer, parameter :: N = 1000000
    integer            :: i
    real(8), parameter :: delta_x = 1.0 / N
    real(8)            :: sum, my_pi
    real               :: time_start, time_end

    call cpu_time(time_start)
    write(*, *) N, delta_x, f(0.5d0)    
    
    sum = 0.0d0
    !$omp parallel do reduction(+:sum)
    do i = 0, N-1  
        !!$omp critical
        sum = sum + delta_x * f(delta_x * i)
        !!$omp end critical
    end do 
    !$omp end parallel do
    
    my_pi = 4.0d0 * sum
    write(*, *) "Pi = ", my_pi

    call cpu_time(time_end)
    write(*, *) "Time taken ", time_end - time_start, " seconds"
    contains
    real(8) function f(x)
        real(8), intent(in) :: x
        f = sqrt(1.0d0 - x ** 2)
    end function f
end program calculate_pi