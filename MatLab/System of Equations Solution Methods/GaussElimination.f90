program gausselimination 
    implicit none 
    integer::i,j,k,n
    real::a(10,10),b(10),x(10)
    real::factor,sum 
    open(10,file="input4.txt",status="old")
    open(20,file="output4.txt",status="replace")
    print*,"enter no of equations"
    read (10,* ) n 
    print*,"enter coefficients"
    do i=1,n 
        read (10,*) (a(i,j), j=1,n)
    end do 
    print*,"enter constants"
    read (10,*) (b(i),i=1,n)
    do k=1,n-1 
        do i=k+1,n 
            factor=a(i,k)/a(k,k)
            do j=k,n 
                a(i,j)=a(i,j)-factor*a(k,j)
            end do 
            b(i)=b(i)-factor*b(k)
        end do 
    end do 
    x(n)=b(n)/a(n,n)
    do i=n-1,1,-1
        sum=0.0
        do j=i+1,n 
            sum=sum+a(i,j)*x(j)
        end do 
        x(i)=(b(i)-sum)/a(i,i)
    end do 
    write(20,*) "solution"
    do i=1,n 
        write(20,*) x(i)
    end do 
    close(10)
    close(20)
end program gausselimination
