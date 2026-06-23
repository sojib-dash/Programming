program trapezoidal 
    implicit none 
    integer::i,n 
    real::a,b,x,sum,integral,h 
    real,external::f 
    open(10,file="input6.txt",status="old")
    open(20,file="output6.txt",status="replace")
    print*, "enter lower limit"
    read (10,*) a 
    print*,"enter upper limit"
    read (10,*) b 
    print*, "enter no of subintervals"
    read (10,*) n 
    h=(b-a)/n 
    sum=0.0 
    write (20,*) "Trapezoidal rule table"
    write (20, '(A5,2A15)') "i", "x","f(x)"

    do i=1,n-1 
        x=a+i*h 
        write (20,'(I5,2F15.6)') i,  x,  f(x)
        sum=sum+f(x)
    end do 
    integral= (h/2.0)*(f(a)+f(b)+2.0*sum)
    write (20,*) "integral= ",integral 
    close(10)
    close(20)
end program trapezoidal
real function f(x)
implicit none
real::x
f =x*x 
end function f 
