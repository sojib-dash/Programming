program tridiagonal 
    implicit none 
    integer::i,n 
    real::a(10),b(10),c(10),d(10)
    real::cp(10),dp(10),x(10)
    open(10,file="input5.txt",status="old")
    open(20,file="output5.txt",status="replace")
    print*,"enter number of equations"
    read (10,*) n 
    print*, "enter lower diagonal entries"
    read (10,*) (a(i),i=2,n)
    print*, "enter main diagonal entries"
    read (10, *) (b(i), i=1,n)
    print*, "enter upper diagonal entries"
    read (10,*) (c(i), i=1,n-1)
    print*, "enter constants"
    read (10,*) (d(i),i=1,n)
    cp(1)=c(1)/b(1)
    dp(1)=d(1)/b(1)
    do i=2,n 
        cp(i)=c(i)/(b(i)-a(i)*cp(i-1))
        dp(i)=(d(i)-a(i)*dp(i-1))/(b(i)-a(i)*cp(i-1))
    end do 
    x(n)=dp(n)
    do i=n-1,1,-1
        x(i)=dp(i)-cp(i)*x(i+1)
    end do 
    write (20,*) "solution"
    do i=1,n 
        write (20,*) x(i)
    end do 
    close(10)
    close(20)
end program tridiagonal
