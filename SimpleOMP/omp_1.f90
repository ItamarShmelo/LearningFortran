program omp_1
    use omp_lib 
    implicit none
    
    write(*, *) "There are ", OMP_GET_NUM_PROCS(), "processors"
    
    !$omp parallel
    write(*, *) "There are ", OMP_GET_NUM_THREADS(), "threads"
    !$omp end parallel
end program omp_1