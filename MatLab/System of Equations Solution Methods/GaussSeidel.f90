program gauss_seidel
    implicit none
    integer:: i,j,k,n,iter
    real::a(10,10),b(10),x(10),sum,rowsum
    logical::dominant 
    open(10,file="input1.txt",status="old")
    open(20,file="output1.txt",status="replace")
    print*,"enter no of equations"
    read(10,*) n 
    print*,"enter coefficients"
    do i=1,n 
        read(10,*) (a(i,j),j=1,n)
    end do 
    do i=1,n 
        rowsum=0.0
        do j=1,n 
            if (j/=i)then 
                sum=sum+a(i,j)
            end if 
        end do 
        if (abs(a(i,i))<=rowsum)then 
            dominant=.false.
        end if 
    end do 
        
    if (dominant) then 
        write(20,*) "diagonally dominant"
        
    else 
        write(20,*) "not diagonally dominant"
        stop
    end if 
    print*,"enter constant matrix"
    read(10,*) (b(i),i=1,n)

    print*, "enter initial guess"
     read(10,*) (x(i),i=1,n)
     print*,"enter no of iterations"
     read(10,*) iter
     do k=1,iter
        write (20, '("Iteraton= ",I0)') k
        do i=1,n 
            sum=0.0
            do j=1,n
                if (j/=i)then
                sum=sum+a(i,j)*x(j)
                end if 
            end do 
            x(i)=(b(i)-sum)/a(i,i)
            write(20,'("x(",I0,")= ",F0.6)') i,x(i)
        end do 
    end do 
    write (20,*)"the solution is:"
    do i=1,n 
        write(20,*) x(i)
    end do 
    close(10)
    close(20)
end program gauss_seidel
