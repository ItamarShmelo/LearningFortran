program array_of_type
    implicit none
    type example_type
        integer :: var1
        integer :: var2
        real(8) :: real1
        real(8) :: real2
        logical :: logi1 
        logical :: logi2
    end type example_type

    integer            :: ind
    real(8)            :: time_start, time_end
    integer, parameter :: array_size = 1000000

    type(example_type), dimension(:), allocatable :: type_array

    integer, dimension(:), allocatable :: var1_array , var2_array
    real(8), dimension(:), allocatable :: real1_array, real2_array
    logical, dimension(:), allocatable :: logi1_array, logi2_array

    ! initialize arrays
    time_start = get_time()
    allocate(type_array(array_size))
    allocate(var1_array(array_size), var2_array(array_size))
    allocate(real1_array(array_size), real2_array(array_size))
    allocate(logi1_array(array_size), logi2_array(array_size))
    time_end = get_time()
    write(*, *) "allocation time ", time_end - time_start

    time_start = get_time()
    var1_array = 1
    var2_array = 2
    real1_array = 3.0d0
    real2_array = 4.0d0
    time_end = get_time()
    write(*, *) "init array time", time_end - time_start
    
    time_start = get_time()
    
    type_array = example_type(1, 2, 3.0d0, 4.0d0, .false., .false.)
    
    time_end = get_time()
    write(*, *) "init type array time", time_end - time_start
    
    time_start = get_time()
    !$omp parallel do
    do ind = 1, array_size
        var1_array(ind)  = var1_array(ind) * 5
        var2_array(ind)  = var2_array(ind) + var1_array(ind)
        logi1_array(ind) = var1_array(ind) < var2_array(ind)
        logi2_array(ind) = real2_array(ind) < real1_array(ind)
    end do
    !$omp end parallel do
    time_end = get_time()
    write(*, *) "Time arrays", time_end - time_start    
    
    time_start = get_time()
    !$omp parallel do
    do ind = 1, array_size
        type_array(ind)%var1  = type_array(ind)%var1 * 5
        type_array(ind)%var2  = type_array(ind)%var2 + type_array(ind)%var1 
        type_array(ind)%logi1 = type_array(ind)%var1 < type_array(ind)%var2
        type_array(ind)%logi2 = type_array(ind)%real2 < type_array(ind)%real1
    end do
    !$omp end parallel do
    time_end = get_time()
    write(*, *) "Time type", time_end - time_start
    
    contains

    real(8) function get_time()
        integer :: count, max_count, count_rate
        call system_clock(count, count_rate, max_count)
        
        write(*, *) count, count_rate, max_count
        write(*, *) real(count, 8) / real(count_rate, 8)
        get_time = (real(count, 8) / real(count_rate, 8))
    end function get_time
end program array_of_type