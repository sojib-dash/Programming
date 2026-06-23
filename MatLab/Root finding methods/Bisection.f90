program bisectionmethod
    implicit none
    real :: a,b,tol,root 
    integer :: iteration,out
    real,external :: f 
    open(10,file="input11.txt",status="old")
    open(20,file="output11.txt",status="replace")
    out=20
    print*,"enter lower bound"
    read(10,*) a 
    print*,"enter upper bound"
    read(10,*) b
    print*,"enter tolerance of error"
    read(10,*) tol
    print*,"enter maximum number of iterations"
    read(10,*) iteration
    call bisection(a,b,tol,root,iteration,out)
    write(out, *) "Approximate root= ",root
    close(10)
    close(20)
end program bisectionmethod

real function f(x)
    implicit none
    real::x 
    f=x**3-x-2.0
end function f 

subroutine bisection (a,b,tol,root,iteration,out)
    implicit none 
    real::a,b,tol,root
    real::left,right,mid
    real::fa,fb,fmid
    integer::i,iteration,out
    real,external::f 
    left=a 
    right=b 
    fa=f(left)
    fb=f(right)
    if (fa*fb>0.0) then
        write(out,*) "a and b do not bracket any root"
        stop
    end if 
    write(out, '(A4,4A15)') "i","left","right","mid","f(mid)"
    do i=1,iteration
        mid=(left+right)/2.0
        fmid=f(mid)
    write(out, '(I4,4F15.6)') i,left,right,mid,fmid
    if (abs(fmid)<tol)then 
        root=mid
        return 
    end if 
    if (fa*fmid>0.0) then 
        left=mid 
        fa=fmid 
    else
        right=mid 
        fb=fmid
    end if
    end do  
    root=(left+right)/2.0
end subroutine bisection



