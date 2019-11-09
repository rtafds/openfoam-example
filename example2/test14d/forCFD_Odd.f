C********************************************************************C
C
C This program wad made by imoan 2016.11.11
C for coupled analysis for CFD and human thermal model.
C
C This program works with
C   1) Area_O.txt    (Body surface area data of CFD)
C   2) Area_S.txt    (Body surface area data of SakoiModel)
C   3) RESULT32.txt  (Result from SakoiModel)
C
C This program create file to calculate next step by CFD.
C   1) Qc_new.txt    (Convective heat loss)
C   2) Qe_new.txt    (Evaporative heat loss)
C   3) Tcl.txt       (Skin temperature)
C
C********************************************************************C
      program forCFD_Even
C********************************************************************C
C234567
C
C initial condition
C
      implicit none
      integer i,x,dig,check
      double precision a,j,k,l,m,n,o,q,r,s,T,P,Qc,Qcd,Qe,Qed,AO,AS,Tcl
      parameter imax=32,xmax=32
      dimension T(1:imax,1),P(1:imax,1),
     &          Qc(1:imax,1),Qe(1:imax,1),
     &          Qcd(1:imax,1),Qed(1:imax,1),
     &          AO(1:imax,1),AS(1:imax,1),Tcl(1:imax,1),dig(1:imax)
C
      open (21,file='Area_O.txt',status='old')
      open (31,file='Area_S.txt',status='old')
      open (41,file='TempP.txt',status='old')
      open (51,file='RESULT32.txt',status='old')
      open (61,file='Qc_w.txt',status='replace')
      open (71,file='Qe_w.txt',status='replace')
      open (81,file='Tcl.txt',status='replace')
C
      do 10 i=1,imax
      Qc(i,1)=0.0d0
      Qe(i,1)=0.0d0
   10 continue
      check=0
C
C read Area_O.txt
C
      do 20 i=1,imax
         read(21,*) j
         AO(i,1)=j
   20 continue
C
C read Area_S.txt
C
      do 30 i=1,imax
         read(31,*) j
         AS(i,1)=j
   30 continue
C
C input from 'TempP.txt.dat'
C
      do 40 i=1,imax
         read(41,*) r,s
         T(i,1)=r
         P(i,1)=s
   40 continue
C
C input from 'RESULT32.txt.dat'
C
      do 50 i=1,imax
         read(51,*) l,m,n,o,q
C for Convective
         Qc(i,1)=n*AS(i,1)/AO(i,1)
         Qc(i,1)=Qc(i,1)*1000.0d0
         Qcd(i,1)=Qc(i,1)-idint(Qc(i,1))
         Qc(i,1)=Qc(i,1)-Qcd(i,1)
C for Evaporatibe
         Qe(i,1)=750.0d0*q*(287.0d0+T(i,1))
     &           /(P(i,1)*0.01d0*225700000.0d0)
        if ((Qe(i,1) .ge. 1.0E-3) .and. (Qe(i,1) .lt. 1.0E-2)) then
         Qe(i,1)=Qe(i,1)*1.0E8
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=1
        else if ((Qe(i,1) .ge. 1.0E-4) .and. (Qe(i,1) .lt. 1.0E-3)) then
         Qe(i,1)=Qe(i,1)*1.0E9
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=2
        else if ((Qe(i,1) .ge. 1.0E-5) .and. (Qe(i,1) .lt. 1.0E-4)) then
         Qe(i,1)=Qe(i,1)*1.0E10
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=3
        else if ((Qe(i,1) .ge. 1.0E-6) .and. (Qe(i,1) .lt. 1.0E-5)) then
         Qe(i,1)=Qe(i,1)*1.0E11
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=4
        else if ((Qe(i,1) .ge. 1.0E-7) .and. (Qe(i,1) .lt. 1.0E-6)) then
         Qe(i,1)=Qe(i,1)*1.0E12
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=5
        else if ((Qe(i,1) .ge. 1.0E-8) .and. (Qe(i,1) .lt. 1.0E-7)) then
         Qe(i,1)=Qe(i,1)*1.0E13
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=6
        else if ((Qe(i,1) .ge. 1.0E-9) .and.
     &           (Qe(i,1) .lt. 1.0E-8)) then
         Qe(i,1)=Qe(i,1)*1.0E14
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=7
        else if ((Qe(i,1) .ge. 1.0E-10) .and.
     &          (Qe(i,1) .lt. 1.0E-9)) then
         Qe(i,1)=Qe(i,1)*1.0E15
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=8
        else if ((Qe(i,1) .ge. 1.0E-11) .and.
     &           (Qe(i,1) .lt. 1.0E-10)) then
         Qe(i,1)=Qe(i,1)*1.0E16
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=9
        else
         Qe(i,1)=Qe(i,1)*1.0E7
         Qed(i,1)=Qe(i,1)-idint(Qe(i,1))
         Qe(i,1)=Qe(i,1)-Qed(i,1)
         dig(i)=10
        end if
C for SkinTemp
         Tcl(i,1)=m
   50 continue
C
C check for same value in Qc
C
      do 100 i=1,imax
  500   check=0
        if (mod(idint(Qc(i,1)),10) .eq. 0) then
         Qc(i,1)=Qc(i,1)+1.0d0
        end if
        do 110 x=1,xmax
         if ((idint(Qc(i,1)) .ne. idint(Qc(x,1))) .or. (i .eq. x)) then
          check=check+1
         else
          Qc(i,1)=Qc(i,1)+1.0d0
         end if
  110   continue
        if (check .eq. imax) then
         goto 100
        else
         goto 500
        end if
  100 continue
      do 120 i=1,imax
         Qc(i,1)=Qc(i,1)*0.001d0
  120 continue
C
C check for same value in Qe
C
      do 130 i=1,imax
  600  check=0
        if (mod(idint(Qe(i,1)),10) .eq. 0) then
         Qe(i,1)=Qe(i,1)+1.0d0
        end if
        do 140 x=1,xmax
         if (dig(i) .ne. dig(x)) then
          check=check+1
         else if ((Qe(i,1) .ne. Qe(x,1)) .or. (i .eq. x)) then
          check=check+1
         else
          Qe(i,1)=Qe(i,1)+1.0d0
         end if
  140   continue
        if (check .eq. imax) then
         goto 130
        else
         goto 600
        end if
  130 continue
      do 150 i=1,imax
       if (dig(i) .eq. 1) then
         Qe(i,1)=Qe(i,1)*1.0E-8
       else if (dig(i) .eq. 2) then
         Qe(i,1)=Qe(i,1)*1.0E-9
       else if (dig(i) .eq. 3) then
         Qe(i,1)=Qe(i,1)*1.0E-10
       else if (dig(i) .eq. 4) then
         Qe(i,1)=Qe(i,1)*1.0E-11
       else if (dig(i) .eq. 5) then
         Qe(i,1)=Qe(i,1)*1.0E-12
       else if (dig(i) .eq. 6) then
         Qe(i,1)=Qe(i,1)*1.0E-13
       else if (dig(i) .eq. 7) then
         Qe(i,1)=Qe(i,1)*1.0E-14
       else if (dig(i) .eq. 8) then
         Qe(i,1)=Qe(i,1)*1.0E-15
       else if (dig(i) .eq. 9) then
         Qe(i,1)=Qe(i,1)*1.0E-16
       else if (dig(i) .eq. 10) then
         Qe(i,1)=Qe(i,1)*1.0E-7
       end if
  150 continue
C
C output to 'Qcread.txt'
C
      do 160 i=1,imax
        write(61,1000) Qc(i,1)
  160 continue

C output to 'Qeread.txt'
C
      do 170 i=1,imax
        write(71,2000) Qe(i,1)
  170 continue
C
C output to 'Tcl.txt'
C
      do 180 i=1,imax
        write(81,*) Tcl(i,1)
  180 continue

      close(11)
      close(21)
      close(31)
      close(41)
      close(51)
      close(61)
      close(71)
      close(81)
C
C********************************************************************C
 1000 format(f8.3)
 2000 format(1pe12.5)
      end program forCFD_Even
C********************************************************************C
