program newtonrhapson
    implicit none
    integer:: iteration,out
    real::x0,tol,root
    real,external::f,fp
    open(10,file="input13.txt",status="old")
    open(20,file="output14.txt",status="replace")
    out=20
    print*,"enter initial approximation"
    read(10,*) x0
    print*,"enter tolerance of error"
    read(10,*) tol
    print*,"enter maximum number of iterations"
    read(10,*) iteration
    call rhapson(x0,tol,root,iteration,out)
    write(20,*) "The root is= ",root 
    close(10)
    close(20)
end program newtonrhapson

real function f(x)
    implicit none
    real::x
    f=x**3-x-2.0
end function f 

real function fp(x)
    implicit none
    real::x
    fp=3.0*x**2 -1.0
end function fp 

subroutine rhapson(x0,tol,root,iteration,out)
    real::x0,x1,tol,root
    real::fx,fpx
    integer::i,iteration,out
    real,external::f,fp
    write(out,'(A4,3A15)')"i","x","f(x)","f'(x)"
    do i=1,iteration
        fx=f(x0)
        fpx=fp(x0)
        if(abs(fpx)<1.0E-6)then
            write(out,*) "derivative too small"
            stop
        end if 
        x1 = x0 - fx/fpx
        write(out,'(I4,3F15.6)') i,x0,fx,fpx
        if (abs(x1-x0)<tol) then
            root=x1
            return
        end if 
        x0=x1
    end do 
    root=x0
end subroutine rhapson






