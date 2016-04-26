	program transform
	implicit none
	integer i,j,k,n, itype(1000), id(1000)
	double precision x(1000), y(1000), z(1000)
	double precision xmin, xmax, ymin, ymax, zmin, zmax
	double precision xx, xy, xz, yy, yx, yz, zx, zy, zz
	integer nAl, nSm
	character*2 type(1000)
	read(*,*) n
	read(*,*)
	nAl=0
	nSm=0
	do i=1,n
	  read(*,*) type(i), x(i), y(i), z(i)
	  if ( type(i).eq."Al") nAl=nAl+1
	  if ( type(i).eq."Sm") nSm=nSm+1
	enddo
c*******Calculate number of Al and Sm in order to put nAl and nSm at the POSCAR file
	xmin=x(1)
	ymin=y(1)
	zmin=z(1)
	do i=1,n
	  if (x(i).lt.xmin) xmin=x(i)
	  if (y(i).lt.ymin) ymin=y(i)
	  if (z(i).lt.zmin) zmin=z(i)
	enddo

	do i=1,n
	  x(i)=x(i)-xmin
	  y(i)=y(i)-ymin
	  z(i)=z(i)-zmin
	enddo
	
	xmin=x(1)
	ymin=y(1)
	zmin=z(1)
	xmax=x(1)
	ymax=y(1)
	zmax=z(1)
	do i=1,n
	  if (x(i).lt.xmin) xmin=x(i)
	  if (y(i).lt.ymin) ymin=y(i)
	  if (z(i).lt.zmin) zmin=z(i)
	  if (x(i).gt.xmax) xmax=x(i)
	  if (y(i).gt.ymax) ymax=y(i)
	  if (z(i).gt.zmax) zmax=z(i)
	enddo
	write(*,"(A)") "MRO"
	write(*,*) "1.000"
c	write(*,*) xmin, ymin, zmin
	write(*,*) xmax, "0.000 0.000"
	write(*,*) "0.000", ymax, "0.000"
	write(*,*) "0.000 0.000", zmax
	write(*,*) nAl, nSm
	write(*,"(A)") "Selective Dynamics"
	write(*,"(A)") "Cartesian"
c*******Sort Atoms.... At the beggining we have all the Al and at the end the Sm
	do i=1,n
	  if ( type(i).eq."Al") then
	    write(*,*) x(i), y(i), z(i), "T T T"
	  endif
	enddo
	do i=1,n
	  if ( type(i).eq."Sm") then
	    write(*,*) x(i), y(i), z(i), "T T T"
	  endif
	enddo
c*******Sort Atoms.... At the beggining we have all the Al and at the end the Sm

	stop
	end
	  

	
