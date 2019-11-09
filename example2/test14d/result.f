C****************************************************************
      program read
C****************************************************************
C234567
C
C initial condition
C
      implicit none
      integer i,j
      double precision l,z,T,MRT,X,AC,AR,CL
      parameter imax=32,jmax=192
      dimension z(1:jmax,1),T(1:imax,1),X(1:imax,1),AC(1:imax,1),
     &          AR(1:imax,1),CL(1:imax,1)
C
C input from 'nyuryokuyou.txt'
C
      open(11,file='nyuryokuyou.txt',status='old')
      do 10 j=1,jmax
         read(11,*) l
         z(j,1)=l
   10 continue
      close(11)
C
C set value
C
      do 20 i=1,imax
      T(i,1)=z(i,1)
      X(i,1)=z(64+i,1)
      AC(i,1)=z(96+i,1)
      AR(i,1)=z(128+i,1)
      CL(i,1)=z(160+i,1)
   20 continue
      MRT=z(33,1)
C
C output to 'result.text'
C
      open (21,file='result1.txt',status='replace')
      do 30 i=1,imax
       write(21,*) T(i,1),MRT
C       write(21, advance='no') T(i,1),MRT,AC(i,1),AR(i,1)
   30 continue
      close(21)

      open (31,file='result2.txt',status='replace')
      do 40 i=1,imax
       write(31,*) AC(i,1),AR(i,1)
C       write(21, advance='no') T(i,1),MRT,AC(i,1),AR(i,1)
   40 continue
      close(31)
C
      end program read
C
