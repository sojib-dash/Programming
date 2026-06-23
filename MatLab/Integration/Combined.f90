program combined
    implicit none
    integer::i,n,choice
    real::a,b,h,x 
    real::sum,integral,sum1,sum2
    real,external::f 
    open(10,file="input10.txt",status="old")
    open(20,file="output10.txt",status="replace")
    print*,"enter lower limit"
    read(10,*) a 
    print*,"enter upper limit"
    read(10,*)b 
    print*,"enter number of subintervals"
    read(10,*) n 
    print*,"enter your choice"
    print*,"1.Trapezoidal rule"
    print*,"2.simpson's 1/3 rule"
    print*,"3.simpson's 3/8 rule"
    print*,"4.weddle's rule"
    read(10,*) choice
    h=(b-a)/n 
    write(20,*)"iteration table"
    write(20,'(A5,2A15)')"i","x","f(x)"
    do i=0,n
        x=a+i*h 
        write(20,'(I5,2F15.6)') i,x,f(x)
    end do 
    select case(choice)
case(1)
    sum=0.0 
    do i=1,n-1
        x=a+i*h 
        sum=sum+f(x)
    end do 
    integral=h/2.0*(f(a)+f(b)+2*sum)
    write(20,*) "the integral is= ,integral"
case(2)
    if (mod(n,2)/=0)then 
        write(20,*)"simpson's 1/3 rule is not applicable"
        stop
    end if 
    sum1=0.0
    sum2=0.0
    do i=1,n-1
        x=a+i*h
        if (mod(i,2)/=0)then 
            sum1=sum1+f(x)
        else
            sum2=sum2+f(x)
        end if 
    end do 
integral=(h/3.0)*(f(a)+f(b)+4.0*sum1+2*sum2)
    write(20,*) "the integral is= ,integral"
case(3)
    if (mod(n,3)/=0)then 
        write(20,*) "Simpson's 3/8 rule is not applicable"
        stop
    end if 
    sum1=0.0
    sum2=0.0
    do i=1,n-1
        x=a+i*h 
        if (mod(n,3)/=0)then 
            sum1=sum1+f(x)
        else
            sum2=sum2+f(x)
        end if 
    end do
integral=(3.0*h/8.0)*(f(a)+f(b)+3.0*sum1+2*sum2)
write(20,*) "the integral is= ,integral"
    case(4)
        if(mod(n,6)/=0)then 
            print*,"weddle's rule is not applicable"
stop 
        end if 
        sum=0.0 
        do i=0,n-6,6 
            sum=sum+(3.0*h/10.0)*( &
            f(a+i*h)+5.0*(f(a+(i+1)*h))&
            +f(a+(i+2)*h)+6.0*(f(a+(i+3)*h))&
            +f(a+(i+4)*h)+5.0*(f(a+(i+5)*h))&
            +f(a+(i+6)*h))
        end do 
        integral=sum 
        write(20,*) "The integral is= ",integral 
    case default 
        print*,"invalid choice"
    end select 
        end program combined 
        real function f(x)
        implicit none
        real::x 
        f=x*x 
        end function f 



