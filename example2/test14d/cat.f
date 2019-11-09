C****************************************************************
      program read
C****************************************************************
C234567
C
C initial condition
C
      implicit none
      integer i,j,k
      double precision l,m,n,o,p,r,z,Ta,MRT,Q,T,a,X,AC,AR,CL
      parameter imax=32,jmax=75,kmax=128
      dimension z(1:jmax,1:3),T(1:imax,1:2),a(1:kmax,1),
     &          X(1:imax,1:2),AC(1:imax,1),AR(1:imax,1),
     &          CL(1:imax,1),Q(1:imax,1)
C
C input from 'output.dat','Area_O.txt' and 'Qread.txt' 
C
      open(11,file='output2.dat',status='old')
      do 10 j=1,jmax
         read(11,*) l,m,n,o
         z(j,1)=n-273.0d0
         z(j,2)=m
         z(j,3)=o
   10 continue
      close(11)
C
      open(21,file='Qc_w.txt',status='old')
      do 20 i=1,imax
         read(21,*) p
         Q(i,1)=p
   20 continue
      close(21)
C
      open(31,file='nyuryokuyou.txt',status='old')
      do 30 k=1,kmax
         read(31,*) r
         a(k,1)=r
   30 continue
      close(31)

      do 40 i=1,imax
         AC(i,2)=a(i+96,1)
   40 continue
C
C calculate variables
C
C human
      T(1,1)=z(12,1)
      T(2,1)=z(39,1)
      T(3,1)=z(53,1)
      T(4,1)=z(51,1)
      T(5,1)=z(8,1)
      T(6,1)=z(6,1)
      T(7,1)=z(3,1)
      T(8,1)=z(1,1)
      T(9,1)=z(71,1)
      T(10,1)=z(67,1)
      T(11,1)=z(69,1)
      T(12,1)=z(65,1)
      T(13,1)=z(63,1)
      T(14,1)=z(61,1)
      T(15,1)=z(33,1)
      T(16,1)=z(31,1)
      T(17,1)=z(37,1)
      T(18,1)=z(59,1)
      T(19,1)=z(57,1)
      T(20,1)=z(29,1)
      T(21,1)=z(27,1)
      T(22,1)=z(35,1)
      T(23,1)=z(20,1)
      T(24,1)=z(18,1)
      T(25,1)=z(48,1)
      T(26,1)=z(46,1)
      T(27,1)=z(25,1)
      T(28,1)=z(16,1)
      T(29,1)=z(14,1)
      T(30,1)=z(44,1)
      T(31,1)=z(42,1)
      T(32,1)=z(23,1)
C human cell temperature
      T(1,2)=z(13,1)
      T(2,2)=z(40,1)
      T(3,2)=z(54,1)
      T(4,2)=z(52,1)
      T(5,2)=z(9,1)
      T(6,2)=z(7,1)
      T(7,2)=z(4,1)
      T(8,2)=z(2,1)
      T(9,2)=z(72,1)
      T(10,2)=z(68,1)
      T(11,2)=z(70,1)
      T(12,2)=z(66,1)
      T(13,2)=z(64,1)
      T(14,2)=z(62,1)
      T(15,2)=z(34,1)
      T(16,2)=z(32,1)
      T(17,2)=z(38,1)
      T(18,2)=z(60,1)
      T(19,2)=z(58,1)
      T(20,2)=z(30,1)
      T(21,2)=z(28,1)
      T(22,2)=z(36,1)
      T(23,2)=z(21,1)
      T(24,2)=z(19,1)
      T(25,2)=z(49,1)
      T(26,2)=z(47,1)
      T(27,2)=z(26,1)
      T(28,2)=z(17,1)
      T(29,2)=z(15,1)
      T(30,2)=z(45,1)
      T(31,2)=z(43,1)
      T(32,2)=z(24,1)
C human cell humidity
      X(1,2)=z(13,3)
      X(2,2)=z(40,3)
      X(3,2)=z(54,3)
      X(4,2)=z(52,3)
      X(5,2)=z(9,3)
      X(6,2)=z(7,3)
      X(7,2)=z(4,3)
      X(8,2)=z(2,3)
      X(9,2)=z(72,3)
      X(10,2)=z(68,3)
      X(11,2)=z(70,3)
      X(12,2)=z(66,3)
      X(13,2)=z(64,3)
      X(14,2)=z(62,3)
      X(15,2)=z(34,3)
      X(16,2)=z(32,3)
      X(17,2)=z(38,3)
      X(18,2)=z(60,3)
      X(19,2)=z(58,3)
      X(20,2)=z(30,3)
      X(21,2)=z(28,3)
      X(22,2)=z(36,3)
      X(23,2)=z(21,3)
      X(24,2)=z(19,3)
      X(25,2)=z(49,3)
      X(26,2)=z(47,3)
      X(27,2)=z(26,3)
      X(28,2)=z(17,3)
      X(29,2)=z(15,3)
      X(30,2)=z(45,3)
      X(31,2)=z(43,3)
      X(32,2)=z(24,3)
C average temperature (Ta)
      Ta=z(75,1)
C average wall temperature (MRT)
      MRT=(z(5,1)*z(5,2)+z(10,1)*z(10,2)+z(11,1)*z(11,2)
     &    +z(22,1)*z(22,2)+z(41,1)*z(41,2)+z(50,1)*z(50,2)
     &    +z(55,1)*z(55,2)+z(56,1)*z(56,2)+z(73,1)*z(73,2)
     &    +z(75,1)*z(75,2))/(z(5,2)+z(10,2)+z(11,2)+z(22,2)
     &    +z(41,2)+z(50,2)+z(55,2)+z(56,2)+z(73,2)+z(75,2))
C
      do 50 i=1,imax
C water vapor pressure
        X(i,1)=(101.325*X(i,2))/(0.62198+X(i,2))
C convection efficiency
       if (T(i,1) .eq. T(i,2)) then
        AC(i,1)=AC(i,2)
       else
        AC(i,1)=Q(i,1)/(T(i,1)-T(i,2))
       end if
C radiation efficiency
        AR(i,1)=0.90d0*5.67d0*10.0d0**(-8.0d0)*
     &         ((T(i,1)+273.0d0)**4.0d0-(MRT+273.0d0)**4.0d0)/
     &         (T(i,1)-MRT)
C clothing insulation
        CL(i,1)=0.0d0
   50 continue
C clothing insulation add
        CL(9,1) =0.106d0
        CL(10,1)=0.106d0
        CL(11,1)=0.098d0
        CL(12,1)=0.098d0
        CL(23,1)=0.017d0
        CL(24,1)=0.015d0
        CL(28,1)=0.017d0
        CL(29,1)=0.015d0
C
C output to 'nyuryokuyou.text'
C
      open (41,file='nyuryokuyou.txt',status='replace')
C Ta
      do 60 i=1,imax
        write(41,*) T(i,2)
   60 continue
C MRT
      do 70 i=1,imax
        write(41,*) MRT
   70 continue
C evap
      do 80 i=1,imax
        write(41,*) X(i,1)
   80 continue
C convection efficiensy
      do 90 i=1,imax
        write(41,*) AC(i,1)
   90 continue
C radiation efficiency
      do 100 i=1,imax
        write(41,*) AR(i,1)
  100 continue
C clothing insulation
      do 110 i=1,imax
        write(41,*) CL(i,1)
  110 continue
      close(41)
C
      open (61,file='alpha.txt',position='append')
C Ta
      do 120 i=1,imax
        write(61,*) T(i,1),T(i,2),MRT,X(i,1),AC(i,1),AR(i,1)
  120 continue
C
      end
