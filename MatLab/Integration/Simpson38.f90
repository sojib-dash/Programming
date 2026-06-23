program simpson38 
    implicit none 
    integer:: i,n 
    real::a,b,h,x
    real::sum1,sum2,integral
    real,external::f
    open(10,file="input8.txt",status="old")
    open(20,file="output8.txt",status="replace")
    print*,"enter lower limit"
    read (10,*) a 
    print*, "enter upper limit"
    read (10,*) b 
    print*,"enter number of subintervals"
    read (10,*) n 
    if (mod(n,3)/=0)then
        write(20,*)"simpson's 3/8 rule is not applicable"
        stop
    end if 
    h=(b-a)/n 
    sum1=0.0
    sum2=0.0
    write(20,*) "Simpson's 3/8 Rule"
    write (20, '(A5,2A15)') "i","x","f(x)"
    do i=1,n-1
        x=a+i*h
        write (20 , '(I5,2F15.6)') i,x,f(x)
        if (mod(i,3)/=0)then
        sum1=sum1+f(x)
        else  
            sum2= sum2+f(x)
        end if 
        end do 
        integral=(3.0*h/8.0)*(f(a)+f(b)+3.0*sum1+2.0*sum2)
        write (20,*) "The integral is= ",integral 
        close(10)
        close(20)
    end program simpson38
    real function f(x)
    implicit none
    real::x
    f= x*x
end function f 
