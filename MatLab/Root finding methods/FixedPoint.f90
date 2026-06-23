program fixedpointmethod
    implicit none
    integer::iteration,out
    real::x0,tol,root
    real,external::g
    open(10, file="input13.txt",status="old")
    open(20, file="output13.txt",status="replace")
    out=20
    print*,"enter initial approximation"
    read(10,*) x0
    print*,"enter tolerance of error"
    read(10,*) tol
    print*,"enter maximum number of iterations"
    read(10, *) iteration
    call fixedpoint (x0,tol,root ,iteration,out)
    write(out,*) "Approximate root= ",root 
    close(10)
    close(20)
end program fixedpointmethod

real function g(x)
    implicit none
    real::x 
    g=(x+2.0)**(1.0/3.0)
end function g

subroutine fixedpoint(x0,tol,root,iteration,out)
    implicit none 
    real::x0,x1,tol,root
    integer::i,iteration,out
    real,external::g 
    write(out, '(A4,2A15)') "i","x(i)","g(x(i))"
    do i=1,iteration
        x1=g(x0)
        write(out, '(I4,2F15.6)') i,x0,x1
        if (abs(x1-x0)<tol) then 
            root=x1
            return
        end if 
        x0=x1
    end do 
    root=x1
end subroutine fixedpoint



