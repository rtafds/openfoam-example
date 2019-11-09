#!/bin/sh
set -eu
#===========================================================================#
#
# This program was made by imoan 2016.11.11
# for coupled analysis for CFD and human thermal model.
#
# When you want to use this program, please check simulationTime and 
# change time to total simulation time, also interval time.
# (Iterations * Interval = total simulation time)
#
# This program works with 
#   1) U2
#   2) forHTM.f
#       a) output2.dat
#       b) Qc_old.txt
#   3) SakoiModel_master
#       a) nyuryokuyou.txt
#   4) forCFD.f
#       a) Area_O.txt
#       b) Area_S.txt
#       c) RESULT32.txt
#   5) forNextStep
#       a) Qc_new/old.txt  (/case)
#       b) Qe_new/old.txt  (/case)
#===========================================================================#
# setting simulationTime

for time in {1..40}            #number of iterations (Default: 240)
do
check=`echo "${time} % 2" |bc`
time=`expr ${time} \* 15`       #interval time (Default: 15 sec.)

#===========================================================================#
# saveOldData

mv Qc_new.txt Qc_old.txt
mv Qe_new.txt Qe_old.txt

#===========================================================================#
# calculation by CFD

bsub -o . -m queen08 -J 28-0-A buoyantHumidityPimpleFoam    #solver on OpenFOAM

#===========================================================================#
wait
sleep 0.5h

#===========================================================================#
# overWrite U

#cp U2 ${time}
#cd ${time}
#sed -n -e 1,171351p U > U1
#cp U U.org
#cat U1 U2 > U
#cd ../

#===========================================================================#
# samplingData

rm -rf T_result
rm -rf postProcessing
mkdir T_result
execFlowFunctionObjectsforHumidRad -latestTime           #utility on OpenFOAM

#---------------------------------------------------------------------------#
# humanData

mv postProcessing/back_left_T/${time}/cellSource.dat T_result/back_left_T.dat
mv postProcessing/back_right_T/${time}/cellSource.dat T_result/back_right_T.dat
mv postProcessing/chest_left_T/${time}/cellSource.dat T_result/chest_left_T.dat
mv postProcessing/chest_right_T/${time}/cellSource.dat T_result/chest_right_T.dat
mv postProcessing/waist_left_back_T/${time}/cellSource.dat T_result/waist_left_back_T.dat
mv postProcessing/waist_left_front_T/${time}/cellSource.dat T_result/waist_left_front_T.dat
mv postProcessing/waist_right_back_T/${time}/cellSource.dat T_result/waist_right_back_T.dat
mv postProcessing/waist_right_front_T/${time}/cellSource.dat T_result/waist_right_front_T.dat
mv postProcessing/femur_left_back_T/${time}/cellSource.dat T_result/femur_left_back_T.dat
mv postProcessing/femur_left_front_T/${time}/cellSource.dat T_result/femur_left_front_T.dat
mv postProcessing/femur_right_back_T/${time}/cellSource.dat T_result/femur_right_back_T.dat
mv postProcessing/femur_right_front_T/${time}/cellSource.dat T_result/femur_right_front_T.dat
mv postProcessing/lowerleg_left_back_T/${time}/cellSource.dat T_result/lowerleg_left_back_T.dat
mv postProcessing/lowerleg_left_front_T/${time}/cellSource.dat T_result/lowerleg_left_front_T.dat
mv postProcessing/lowerleg_right_back_T/${time}/cellSource.dat T_result/lowerleg_right_back_T.dat
mv postProcessing/lowerleg_right_front_T/${time}/cellSource.dat T_result/lowerleg_right_front_T.dat
mv postProcessing/upperarm_left_back_T/${time}/cellSource.dat T_result/upperarm_left_back_T.dat
mv postProcessing/upperarm_left_front_T/${time}/cellSource.dat T_result/upperarm_left_front_T.dat
mv postProcessing/upperarm_right_back_T/${time}/cellSource.dat T_result/upperarm_right_back_T.dat
mv postProcessing/upperarm_right_front_T/${time}/cellSource.dat T_result/upperarm_right_front_T.dat
mv postProcessing/forearm_left_back_T/${time}/cellSource.dat T_result/forearm_left_back_T.dat
mv postProcessing/forearm_left_front_T/${time}/cellSource.dat T_result/forearm_left_front_T.dat
mv postProcessing/forearm_right_back_T/${time}/cellSource.dat T_result/forearm_right_back_T.dat
mv postProcessing/forearm_right_front_T/${time}/cellSource.dat T_result/forearm_right_front_T.dat
mv postProcessing/foot_left_T/${time}/cellSource.dat T_result/foot_left_T.dat
mv postProcessing/foot_right_T/${time}/cellSource.dat T_result/foot_right_T.dat
mv postProcessing/hand_left_T/${time}/cellSource.dat T_result/hand_left_T.dat
mv postProcessing/hand_right_T/${time}/cellSource.dat T_result/hand_right_T.dat
mv postProcessing/neck_back_T/${time}/cellSource.dat T_result/neck_back_T.dat
mv postProcessing/neck_front_T/${time}/cellSource.dat T_result/neck_front_T.dat
mv postProcessing/face_T/${time}/cellSource.dat T_result/face_T.dat
mv postProcessing/head_T/${time}/cellSource.dat T_result/head_T.dat
mv postProcessing/back_left_O/${time}/faceSource.dat T_result/back_left_O.dat
mv postProcessing/back_right_O/${time}/faceSource.dat T_result/back_right_O.dat
mv postProcessing/chest_left_O/${time}/faceSource.dat T_result/chest_left_O.dat
mv postProcessing/chest_right_O/${time}/faceSource.dat T_result/chest_right_O.dat
mv postProcessing/waist_left_back_O/${time}/faceSource.dat T_result/waist_left_back_O.dat
mv postProcessing/waist_left_front_O/${time}/faceSource.dat T_result/waist_left_front_O.dat
mv postProcessing/waist_right_back_O/${time}/faceSource.dat T_result/waist_right_back_O.dat
mv postProcessing/waist_right_front_O/${time}/faceSource.dat T_result/waist_right_front_O.dat
mv postProcessing/femur_left_back_O/${time}/faceSource.dat T_result/femur_left_back_O.dat
mv postProcessing/femur_left_front_O/${time}/faceSource.dat T_result/femur_left_front_O.dat
mv postProcessing/femur_right_back_O/${time}/faceSource.dat T_result/femur_right_back_O.dat
mv postProcessing/femur_right_front_O/${time}/faceSource.dat T_result/femur_right_front_O.dat
mv postProcessing/lowerleg_left_back_O/${time}/faceSource.dat T_result/lowerleg_left_back_O.dat
mv postProcessing/lowerleg_left_front_O/${time}/faceSource.dat T_result/lowerleg_left_front_O.dat
mv postProcessing/lowerleg_right_back_O/${time}/faceSource.dat T_result/lowerleg_right_back_O.dat
mv postProcessing/lowerleg_right_front_O/${time}/faceSource.dat T_result/lowerleg_right_front_O.dat
mv postProcessing/upperarm_left_back_O/${time}/faceSource.dat T_result/upperarm_left_back_O.dat
mv postProcessing/upperarm_left_front_O/${time}/faceSource.dat T_result/upperarm_left_front_O.dat
mv postProcessing/upperarm_right_back_O/${time}/faceSource.dat T_result/upperarm_right_back_O.dat
mv postProcessing/upperarm_right_front_O/${time}/faceSource.dat T_result/upperarm_right_front_O.dat
mv postProcessing/forearm_left_back_O/${time}/faceSource.dat T_result/forearm_left_back_O.dat
mv postProcessing/forearm_left_front_O/${time}/faceSource.dat T_result/forearm_left_front_O.dat
mv postProcessing/forearm_right_back_O/${time}/faceSource.dat T_result/forearm_right_back_O.dat
mv postProcessing/forearm_right_front_O/${time}/faceSource.dat T_result/forearm_right_front_O.dat
mv postProcessing/foot_left_O/${time}/faceSource.dat T_result/foot_left_O.dat
mv postProcessing/foot_right_O/${time}/faceSource.dat T_result/foot_right_O.dat
mv postProcessing/hand_left_O/${time}/faceSource.dat T_result/hand_left_O.dat
mv postProcessing/hand_right_O/${time}/faceSource.dat T_result/hand_right_O.dat
mv postProcessing/neck_back_O/${time}/faceSource.dat T_result/neck_back_O.dat
mv postProcessing/neck_front_O/${time}/faceSource.dat T_result/neck_front_O.dat
mv postProcessing/face_O/${time}/faceSource.dat T_result/face_O.dat
mv postProcessing/head_O/${time}/faceSource.dat T_result/head_O.dat
#
#---------------------------------------------------------------------------#
# environmentData
#---------------------------------------------------------------------------#
# If you use experimental house in TOKAI City, you should use under comands.

mv postProcessing/floor/${time}/faceSource.dat T_result/floor.dat
mv postProcessing/ceiling/${time}/faceSource.dat T_result/ceiling.dat
mv postProcessing/north/${time}/faceSource.dat T_result/north.dat
mv postProcessing/south/${time}/faceSource.dat T_result/south.dat
mv postProcessing/east/${time}/faceSource.dat T_result/east.dat
mv postProcessing/west/${time}/faceSource.dat T_result/west.dat
mv postProcessing/w_internal_T/${time}/cellSource.dat T_result/w_internal_T.dat

#---------------------------------------------------------------------------#
# If you use model house in TOYOTA City, you should use under comands.

#mv postProcessing/inceiling/${time}/faceSource.dat T_result/inceiling.dat
#mv postProcessing/wall_north2/${time}/faceSource.dat T_result/wall_north2.dat
#mv postProcessing/wall_east/${time}/faceSource.dat T_result/wall_east.dat
#mv postProcessing/wall_west2/${time}/faceSource.dat T_result/wall_west2.dat
#mv postProcessing/wall2F/${time}/faceSource.dat T_result/wall2F.dat
#mv postProcessing/inwall2F1/${time}/faceSource.dat T_result/inwall2F1.dat
#mv postProcessing/inwall2F2/${time}/faceSource.dat T_result/inwall2F2.dat
#mv postProcessing/inwall2F3/${time}/faceSource.dat T_result/inwall2F3.dat
#mv postProcessing/around/${time}/faceSource.dat T_result/around.dat
#mv postProcessing/glass2F1/${time}/faceSource.dat T_result/glass2F1.dat
#mv postProcessing/glass2F2/${time}/faceSource.dat T_result/glass2F2.dat
#mv postProcessing/glass_north/${time}/faceSource.dat T_result/glass_north.dat
#mv postProcessing/glass_south1/${time}/faceSource.dat T_result/glass_south1.dat
#mv postProcessing/glass_south2/${time}/faceSource.dat T_result/glass_south2.dat
#mv postProcessing/glass_west3/${time}/cellSource.dat T_result/glass_west3.dat
#
#===========================================================================#
# gatheringData to output.dat

cat T_result/* > output.dat

#===========================================================================#
# formatChange (output output2.dat)

cat output.dat | sed -ne '0~4p' > output2.dat

#===========================================================================#
# createFile for human thermal model (output nyuryokuyou.txt)

ifort forHTM.f
./a.out

#===========================================================================#
# calculation by SakoiModel

cp nyuryokuyou.txt SakoiModel_master
cd SakoiModel_master
mv nyuryokuyou.txt OUTCOND32_SETUP.txt
ifort Main.for
./a.out
cp RESULT32.txt ../
cp RESULT32.txt RESULT32_${time}.txt

#===========================================================================#
# createFile for CFD (output Qc_new.txt,Qcread_new.txt)

cd ../
mv RESULT32.txt RESULT32org.txt
sed 1d RESULT32org.txt > RESULT32.txt

if [ ${check} -eq 0 ]; then
 ifort forCFD_Even.f
 ./a.out
elif [ ${check} -ne 0 ]; then
 ifort forCFD_Odd.f
 ./a.out
fi

sed -e "s/ *$//" -e "s/^[ ]*/q               uniform /" -e "s/0$/1/" -e "s/$/;/" Qc_w.txt > Qc_new.txt
sed -e "s/ *$//" -e "s/^[ ]*/uniform /" -e "s/0E/1E/" -e "s/E/e/" -e "s/$/;/" Qe_w.txt > Qe_new.txt

#===========================================================================#
# overWrite time
# If you change interval time, change here to same value. (Default: 15 sec.)

cd system
mv controlDict controlDict.org
sed -e "s/${time};/`expr ${time} \+ 15`;/" controlDict.org > controlDict
cd ../

#===========================================================================#
# overWrite boundaryCondition (T and X)

cp Qc_old.txt ${time}
cp Qc_new.txt ${time}
cp Qe_old.txt ${time}
cp Qe_new.txt ${time}
cp forNextStep ${time}
cd ${time}
./forNextStep
cd ../

#===========================================================================#

cd rface
mkdir ${time}
cd ../
cp T_result/face_O.dat rface/${time}/
cp T_result/face_T.dat rface/${time}/


#===========================================================================#
 done
#===========================================================================#
