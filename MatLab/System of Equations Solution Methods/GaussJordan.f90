
program gaussjordan 
    implicit none 
    integer::i,j,k,n 
    real::a(10,10),b(10),x(10),ratio 
    open(10,file="input3.txt",status="old")
    open (20, file="output3.txt",status="replace")
    print*,"enter no of equations"
    read (10,*)n 
    print*,"enter the coefficients"
    do i=1,n 
        read (10,*) (a(i,j),j=1,n)
    end do 
    print*,"enter constant matrix"
        read (10,*) (b(i),i=1,n) 
    do i=1,n 
        ratio=a(i,i)
        do j=1,n 
            a(i,j)=a(i,j)/ratio
        end do 
        b(i)=b(i)/ratio 
        do k=1,n 
            if (k/=i)then 
                ratio=a(k,i)
                do j=1,n 
                    a(k,j)=a(k,j)-ratio*a(i,j)
                end do 
                b(k)=b(k)-ratio*b(i)
            end if 
        end do 
    end do 
    do i=1,n 
    x(i)=b(i)
    end do 
    write (20,*) "solution"
    do i=1,n 
        write (20,*) x(i)
    end do 
    close(10)
    close(20)
end program gaussjordan
