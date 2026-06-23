program simpson13
    implicit none 
    integer::i,n 
    real::a,b,x,h
    real::sum1,sum2,integral 
    real,external::f 
    open(10,file="input7.txt",status="old")
    open(20, file="output7.txt",status="replace")
    print*,"enter lower limit"
    read (10,*) a 
    print*,"enter upper limit"
    read(10,*) b 
    print*, "enter  number of subintervals"
    read (10,*) n 
    if (mod(n,2)/=0) then 
        write(10,*)  "simpson's 1/3 rule is not applicable" 
        stop 
    end if 
    h=(b-a)/n 
    sum1=0.0
    sum2=0.0
    write(20,*) "simpson's 1/3 Rule Table"
    write (20, '(A5,2A15)') "i","x","f(x)"  
    do i=1,n-1
        x=a+i*h
        write(20,'(I5,2F15.6)') i,x,f(x)  
        if   (mod(i,2)/=0) then 
            sum1= sum1+f(x) 
        else 
            sum2=sum2+f(x)
        end if                 
    end do 
    integral=(h/3.0)*(f(a)+f(b)+4.0*sum1+2.0*sum2)
    write (20,*) "integral= ", integral
    close(10)
    close(20)
end program simpson13
real function f(x)
    implicit none 
    real::x 
    f=x*x
end function f 




