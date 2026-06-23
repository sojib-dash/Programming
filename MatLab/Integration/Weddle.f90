program weddle
    implicit none 
    integer::i,n 
    real::a,b,h,x
    real::sum,integral 
    real,external::f 
    open(10,file="input9.txt",status="old")
    open(20, file="output9.txt",status="replace")
    print*, "enter lower limit"
    read(10,*)a 
    print*,"enter upper limit"
    read(10,*) b 
    print*,"enter number of subintervals"
    read(10,*) n 
    if (mod(n,6)/=0)then 
        print*,"weddle's rule is not applicable"
        stop 
    end if 
    h=(b-a)/n
    sum=0.0
    write (20,*) "Weddle's Rule Table"
    write (20, '(A5,2A15)') "i","x","f(x)"
    do i=0,n 
        x=a+i*h 
        write(20,'(I5,2F15.6)') i,x,f(x)
    end do 

    do i=0,n-6,6
        sum=sum+(3.0*h/10.0)*(&
        f(a+i*h)+5.0*f(a+(i+1)*h)&
        +f(a+(i+2)*h)+6.0*f(a+(i+3)*h)&
        +f(a+(i+4)*h)+5*f(a+(i+5)*h)&
        +f(a+(i+6)*h))
    end do 
    integral=sum 
    write (20,*)"The integral is=  ",integral 
    close(10)
    close(20)
    end program weddle
real function f(x)
implicit none
real::x
f=x*x
end function f 


