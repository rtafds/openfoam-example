C********************************************************************C
C
C This program wad made by imoan 2016.11.11
C for coupled analysis for CFD and human thermal model.
C Experimental House in TOKAI City Use ONLY!
C
C This program works with
C   1) output2.dat     (Body surface area data of humanthermal model)
C   2) Qc_w.txt        (Convective heat loss of last step)
C   3) nyuryokuyou.txt (boudary condition for SakoiModel of last step)
C
C This program create file to calculate next step by CFD.
C   1) nyuryokuyou.txt (boudary condition for SakoiModel of next step)
C   2) alpha.txt       (for save data)
C
C********************************************************************C
      program forHTM
C********************************************************************C
C234567
C
C initial condition
C
      implicit none
      integer i,j,k
      double precision l,m,n,o,r,s,u,v,z,Ta,MRT,Qc,Qr,T,a,X,P,AC,AR,CL
      parameter imax=32,jmax=71,kmax=128
      dimension z(1:jmax,1:5),T(1:imax,1:2),a(1:kmax,1),
     &          X(1:imax,2),P(1:imax,1),AC(1:imax,1),
     &          AR(1:imax,1),CL(1:imax,1),Qc(1:imax,1),Qr(1:imax,1)
C-------------------------------------------------------------------C
C input from 'output.dat','Area_O.txt' and 'Qread.txt' 
C
      open(11,file='output2.dat',status='old')
      do 10 j=1,jmax
         read(11,*) l,m,n,o,r,s
         z(j,1)=n-273.0d0
         z(j,2)=m
         z(j,3)=o
         z(j,4)=r
         z(j,5)=s
   10 continue
      close(11)
C
      open(21,file='Qc_w.txt',status='old')
      do 20 i=1,imax
         read(21,*) u
         Qc(i,1)=u
   20 continue
      close(21)
C
      open(31,file='nyuryokuyou.txt',status='old')
      do 30 k=1,kmax
         read(31,*) v
         a(k,1)=v
   30 continue
      close(31)

      do 40 i=1,imax
         AC(i,2)=a(i+96,1)
   40 continue
C-------------------------------------------------------------------C
C set variables
C
C human surface temperature (Ts)
      T(1,1)=z(11,1)
      T(2,1)=z(38,1)
      T(3,1)=z(50,1)
      T(4,1)=z(48,1)
      T(5,1)=z(8,1)
      T(6,1)=z(6,1)
      T(7,1)=z(3,1)
      T(8,1)=z(1,1)
      T(9,1)=z(68,1)
      T(10,1)=z(64,1)
      T(11,1)=z(66,1)
      T(12,1)=z(62,1)
      T(13,1)=z(60,1)
      T(14,1)=z(58,1)
      T(15,1)=z(32,1)
      T(16,1)=z(30,1)
      T(17,1)=z(36,1)
      T(18,1)=z(56,1)
      T(19,1)=z(54,1)
      T(20,1)=z(28,1)
      T(21,1)=z(26,1)
      T(22,1)=z(34,1)
      T(23,1)=z(19,1)
      T(24,1)=z(17,1)
      T(25,1)=z(46,1)
      T(26,1)=z(44,1)
      T(27,1)=z(24,1)
      T(28,1)=z(15,1)
      T(29,1)=z(13,1)
      T(30,1)=z(42,1)
      T(31,1)=z(40,1)
      T(32,1)=z(22,1)
C
C human cell temperature (Ta)
      T(1,2)=z(12,1)
      T(2,2)=z(39,1)
      T(3,2)=z(51,1)
      T(4,2)=z(49,1)
      T(5,2)=z(9,1)
      T(6,2)=z(7,1)
      T(7,2)=z(4,1)
      T(8,2)=z(2,1)
      T(9,2)=z(69,1)
      T(10,2)=z(65,1)
      T(11,2)=z(67,1)
      T(12,2)=z(63,1)
      T(13,2)=z(61,1)
      T(14,2)=z(59,1)
      T(15,2)=z(33,1)
      T(16,2)=z(31,1)
      T(17,2)=z(37,1)
      T(18,2)=z(57,1)
      T(19,2)=z(55,1)
      T(20,2)=z(29,1)
      T(21,2)=z(27,1)
      T(22,2)=z(35,1)
      T(23,2)=z(20,1)
      T(24,2)=z(18,1)
      T(25,2)=z(47,1)
      T(26,2)=z(45,1)
      T(27,2)=z(25,1)
      T(28,2)=z(16,1)
      T(29,2)=z(14,1)
      T(30,2)=z(43,1)
      T(31,2)=z(41,1)
      T(32,2)=z(23,1)
C
C human cell humidity
      X(1,2)=z(12,3)
      X(2,2)=z(39,3)
      X(3,2)=z(51,3)
      X(4,2)=z(49,3)
      X(5,2)=z(9,3)
      X(6,2)=z(7,3)
      X(7,2)=z(4,3)
      X(8,2)=z(2,3)
      X(9,2)=z(69,3)
      X(10,2)=z(65,3)
      X(11,2)=z(67,3)
      X(12,2)=z(63,3)
      X(13,2)=z(61,3)
      X(14,2)=z(59,3)
      X(15,2)=z(33,3)
      X(16,2)=z(31,3)
      X(17,2)=z(37,3)
      X(18,2)=z(57,3)
      X(19,2)=z(55,3)
      X(20,2)=z(29,3)
      X(21,2)=z(27,3)
      X(22,2)=z(35,3)
      X(23,2)=z(20,3)
      X(24,2)=z(18,3)
      X(25,2)=z(47,3)
      X(26,2)=z(45,3)
      X(27,2)=z(25,3)
      X(28,2)=z(16,3)
      X(29,2)=z(14,3)
      X(30,2)=z(43,3)
      X(31,2)=z(41,3)
      X(32,2)=z(23,3)
C
C pressure around each segment
      P(1,1)=z(12,4)
      P(2,1)=z(39,4)
      P(3,1)=z(51,4)
      P(4,1)=z(49,4)
      P(5,1)=z(9,4)
      P(6,1)=z(7,4)
      P(7,1)=z(4,4)
      P(8,1)=z(2,4)
      P(9,1)=z(69,4)
      P(10,1)=z(65,4)
      P(11,1)=z(67,4)
      P(12,1)=z(63,4)
      P(13,1)=z(61,4)
      P(14,1)=z(59,4)
      P(15,1)=z(33,4)
      P(16,1)=z(31,4)
      P(17,1)=z(37,4)
      P(18,1)=z(57,4)
      P(19,1)=z(55,4)
      P(20,1)=z(29,4)
      P(21,1)=z(27,4)
      P(22,1)=z(35,4)
      P(23,1)=z(20,4)
      P(24,1)=z(18,4)
      P(25,1)=z(47,4)
      P(26,1)=z(45,4)
      P(27,1)=z(25,4)
      P(28,1)=z(16,4)
      P(29,1)=z(14,4)
      P(30,1)=z(43,4)
      P(31,1)=z(41,4)
      P(32,1)=z(23,4)
C
C radiative heat flux each segment
      Qr(1,1)=z(11,5)
      Qr(2,1)=z(38,5)
      Qr(3,1)=z(50,5)
      Qr(4,1)=z(48,5)
      Qr(5,1)=z(8,5)
      Qr(6,1)=z(6,5)
      Qr(7,1)=z(3,5)
      Qr(8,1)=z(1,5)
      Qr(9,1)=z(68,5)
      Qr(10,1)=z(64,5)
      Qr(11,1)=z(66,5)
      Qr(12,1)=z(62,5)
      Qr(13,1)=z(60,5)
      Qr(14,1)=z(58,5)
      Qr(15,1)=z(32,5)
      Qr(16,1)=z(30,5)
      Qr(17,1)=z(36,5)
      Qr(18,1)=z(56,5)
      Qr(19,1)=z(54,5)
      Qr(20,1)=z(28,5)
      Qr(21,1)=z(26,5)
      Qr(22,1)=z(34,5)
      Qr(23,1)=z(19,5)
      Qr(24,1)=z(17,5)
      Qr(25,1)=z(46,5)
      Qr(26,1)=z(44,5)
      Qr(27,1)=z(24,5)
      Qr(28,1)=z(15,5)
      Qr(29,1)=z(13,5)
      Qr(30,1)=z(42,5)
      Qr(31,1)=z(40,5)
      Qr(32,1)=z(22,5)
C
C-------------------------------------------------------------------C
C calculate variables
C average temperature (Ta)
      Ta=z(71,1)
C average wall temperature (MRT)
      MRT=(z(5,1)*z(5,2)+z(10,1)*z(10,2)
     &    +z(21,1)*z(21,2)
     &    +z(52,1)*z(52,2)+z(53,1)*z(53,2)
     &    +z(70,1)*z(70,2))/(z(5,2)+z(10,2)+z(21,2)
     &    +z(52,2)+z(53,2)+z(70,2)+z(71,2))
C
      do 50 i=1,imax
C water vapor pressure
        X(i,1)=(X(i,2)*P(i,1)*0.01d0)/6.22d0
C convection efficiency
       if (T(i,1) .eq. T(i,2)) then
        AC(i,1)=AC(i,2)
       else
        AC(i,1)=Qc(i,1)/(T(i,1)-T(i,2))
       end if
C radiation efficiency
        AR(i,1)=-Qr(i,1)/(T(i,1)-MRT)
!        AR(i,1)=0.90d0*5.67d0*10.0d0**(-8.0d0)*
!     &         ((T(i,1)+273.0d0)**4.0d0-(MRT+273.0d0)**4.0d0)/
!     &         (T(i,1)-MRT)
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
        CL(27,1)=0.03d0
        CL(28,1)=0.017d0
        CL(29,1)=0.015d0
        CL(32,1)=0.03d0

C-------------------------------------------------------------------C
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
        write(41,*) dabs(AC(i,1))
   90 continue
C radiation efficiency
      do 100 i=1,imax
        write(41,*) dabs(AR(i,1))
  100 continue
C clothing insulation
      do 110 i=1,imax
        write(41,*) CL(i,1)
  110 continue
      close(41)

C-------------------------------------------------------------------C
C for save data
C
      open (61,file='TempP.txt',status='replace')
      do 120 i=1,imax
        write(61,*) T(i,1),P(i,1)
  120 continue
C
      open (71,file='alpha.txt',position='append')
      do 130 i=1,imax
        write(71,*) T(i,1),T(i,2),MRT,X(i,1),AC(i,1),AR(i,1)
  130 continue
      close(71)
C
C********************************************************************C
      end program forHTM
C********************************************************************C
