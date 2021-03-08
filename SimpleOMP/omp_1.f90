program omp_1
    use omp_lib 
    implicit none

    integer :: tsum
    
    write(*, *) "There are ", OMP_GET_NUM_PROCS(), "processors"
    
    !$omp parallel
    write(*, *) "There are ", OMP_GET_NUM_THREADS(), "threads"
    !$omp end parallel

    tsum = 0
    !$omp parallel
    tsum = tsum + OMP_GET_THREAD_NUM()
    !$omp end parallel
    write(*, *) "Sum is ", tsum
end program omp_1