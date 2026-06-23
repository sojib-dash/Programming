program rootfinding
    implicit none
    real::a,b,tol,root,x0
    integer:: iteration,out,choice
    real,external::f,fp,g
    open(10,file="input15.txt",status="old")
    open(20,file="output15.txt",status="replace")
    out=20
    print*,"enter tolerance of error"
    read(10,*) tol
    print*,"enter maximum number of iterations"
    read(10,*) iteration
    print*,"1.Bisection Method"
    print*,"2.False Position Method"
    print*,"3.Newton Rhapson Method"
    print*,"4.Fixed Point Iteration Method"
    print*,"enter your choice"
    read(10,*) choice

    select case(choice)
        case(1)
            print*,"enter lower bound"
            read(10,*) a 
            print*,"enter upper bound"
            read(10,*) b 
            call bisection (a,b,tol,root,iteration,out)
            write(out,*) "Approximate root= ",root
        case(2)
            print*,"enter lower bound"
            read(10,*) a 
            print*,"enter upper bound"
            read(10,*) b 
            call falseposition(a,b,tol,root,iteration,out)
            write(out,*) "Approximate root= ",root
        case(3)
            print*,"enter initial approximation"
            read(10,*) x0
            call  rhapson(x0,tol,root,iteration,out)
            write(out,*) "Approximate root= ",root
        case(4)
            print*,"enter initial approximation"
            read(10,*) x0
            call fixedpoint(x0,tol,root,iteration,out)
            write(out,*) "Approximate root= ",root
        case default
            write(out,*) "invalid input"
    end select 
    
    close(10)
    close(20)
end program rootfinding

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

real function g(x)
    implicit none
    real::x 
    g=(x+2.0)**(1.0/3.0)
end function g 

subroutine bisection(a,b,tol,root,iteration,out)
    implicit none
    real::a,b,tol,root
    real::left,right,mid
    real:: fa,fb,fmid
    integer::i,iteration,out
    real,external::f 
    left=a 
    right=b 
    fa=f(left)
    fb=f(right)
    if (fa*fb>0.0)then 
        write(out,*) "a and b do not bracket any root"
        stop
    end if 
    write(out,'(A4, 4A15)') "i","left","right","mid","f(mid)"
    do i=1,iteration 
        mid=(left+right)/2.0
        fmid=f(mid)
        write(out,'(I4, 4F15.6)') i,left,right,mid,fmid
        if (abs(fmid)<tol)then 
            root=mid
            return
        end if 
        if(fa*fmid>0.0)then 
            left=mid
            fa=fmid
        else 
            right=mid
            fb=fmid 
        end if 
    end do 
    root=(left+right)/2.0
end subroutine bisection

subroutine falseposition(a,b,tol,root,iteration,out)
    implicit none
    real::a,b,tol,root
    real::left,right,mid
    real:: fa,fb,fmid
    integer::i,iteration,out
    real,external::f 
    left=a 
    right=b 
    fa=f(left)
    fb=f(right)
    if (fa*fb>0.0)then 
        write(out,*) "a and b do not bracket any root"
        stop
    end if 

    write(out,'(A4, 4A15)') "i","left","right","mid","f(mid)"

    do i=1,iteration 
        mid=(left*fb-right*fa)/(fb-fa)
        fmid=f(mid)
        write(out,'(I4, 4F15.6)') i,left,right,mid,fmid
        if (abs(fmid)<tol)then 
            root=mid
            return
        end if 
        if(fa*fmid>0.0)then 
            left=mid
            fa=fmid
            else 
            right=mid
            fb=fmid 
        end if 
    end do 
    root=mid
end subroutine falseposition

subroutine rhapson(x0,tol,root,iteration,out)
    implicit none
    real::x0,x1,tol,root 
    real::fx,fpx
    real,external::f,fp
    integer::i,iteration,out 
    write(out,'(A4,3A15)') "i","x","f(x)","f'(x)"
    do i=1,iteration 
        fx=f(x0)
        fpx=fp(x0)
        if(abs(fpx)<1.0E-6) then 
            write(out, *)"derivative too small"
            stop
        end if 
        x1= x0 - fx/fpx
        write(out,'(I4,3F15.6)') i,x0,fx,fpx
        if (abs(x1-x0)<tol)then 
            root=x1
            return 
        end if 
        x0=x1
    end do 
    root=x0 
end subroutine rhapson

subroutine fixedpoint(x0,tol,root,iteration,out)
    implicit none
    real::x0,x1,tol,root 
    integer::i,iteration,out 
    real,external::g 
    write(out,'(A4,2A15)') "i","x(i)","g(x(i))"
    do i=1,iteration 
        x1=g(x0)
        write(out,'(I4,2F15.6)') i,x0,x1     
        if (abs(x1-x0)<tol) then 
            root=x1
            return 
        end if 
        x0=x1
    end do 
    root=x1
end subroutine fixedpoint

