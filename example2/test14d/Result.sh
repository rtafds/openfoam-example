#!/bin/sh
set -eu
#
rm -rf 1*.txt 2*.txt 3*.txt 4*.txt 5*.txt 6*.txt 7*.txt 8*.txt 9*.txt
rm -rf  excel.txt
#
############################################################################
#time
 for time in {220..240}
 do
 time=`expr ${time} \* 15`
#
#Sampling
 rm -rf postProcessing
 rm -rf T_result
 mkdir T_result
 execFlowFunctionObjects -time ${time}
 mv postProcessing/back_left_T/3600/cellSource.dat T_result/back_left_T.dat
 mv postProcessing/back_right_T/3600/cellSource.dat T_result/back_right_T.dat
 mv postProcessing/chest_left_T/3600/cellSource.dat T_result/chest_left_T.dat
 mv postProcessing/chest_right_T/3600/cellSource.dat T_result/chest_right_T.dat
 mv postProcessing/waist_left_back_T/3600/cellSource.dat T_result/waist_left_back_T.dat
 mv postProcessing/waist_left_front_T/3600/cellSource.dat T_result/waist_left_front_T.dat
 mv postProcessing/waist_right_back_T/3600/cellSource.dat T_result/waist_right_back_T.dat
 mv postProcessing/waist_right_front_T/3600/cellSource.dat T_result/waist_right_front_T.dat
 mv postProcessing/femur_left_back_T/3600/cellSource.dat T_result/femur_left_back_T.dat
 mv postProcessing/femur_left_front_T/3600/cellSource.dat T_result/femur_left_front_T.dat
 mv postProcessing/femur_right_back_T/3600/cellSource.dat T_result/femur_right_back_T.dat
 mv postProcessing/femur_right_front_T/3600/cellSource.dat T_result/femur_right_front_T.dat
 mv postProcessing/lowerleg_left_back_T/3600/cellSource.dat T_result/lowerleg_left_back_T.dat
 mv postProcessing/lowerleg_left_front_T/3600/cellSource.dat T_result/lowerleg_left_front_T.dat
 mv postProcessing/lowerleg_right_back_T/3600/cellSource.dat T_result/lowerleg_right_back_T.dat
 mv postProcessing/lowerleg_right_front_T/3600/cellSource.dat T_result/lowerleg_right_front_T.dat
 mv postProcessing/upperarm_left_back_T/3600/cellSource.dat T_result/upperarm_left_back_T.dat
 mv postProcessing/upperarm_left_front_T/3600/cellSource.dat T_result/upperarm_left_front_T.dat
 mv postProcessing/upperarm_right_back_T/3600/cellSource.dat T_result/upperarm_right_back_T.dat
 mv postProcessing/upperarm_right_front_T/3600/cellSource.dat T_result/upperarm_right_front_T.dat
 mv postProcessing/forearm_left_back_T/3600/cellSource.dat T_result/forearm_left_back_T.dat
 mv postProcessing/forearm_left_front_T/3600/cellSource.dat T_result/forearm_left_front_T.dat
 mv postProcessing/forearm_right_back_T/3600/cellSource.dat T_result/forearm_right_back_T.dat
 mv postProcessing/forearm_right_front_T/3600/cellSource.dat T_result/forearm_right_front_T.dat
 mv postProcessing/foot_left_T/3600/cellSource.dat T_result/foot_left_T.dat
 mv postProcessing/foot_right_T/3600/cellSource.dat T_result/foot_right_T.dat
 mv postProcessing/hand_left_T/3600/cellSource.dat T_result/hand_left_T.dat
 mv postProcessing/hand_right_T/3600/cellSource.dat T_result/hand_right_T.dat
 mv postProcessing/neck_back_T/3600/cellSource.dat T_result/neck_back_T.dat
 mv postProcessing/neck_front_T/3600/cellSource.dat T_result/neck_front_T.dat
 mv postProcessing/face_T/3600/cellSource.dat T_result/face_T.dat
 mv postProcessing/head_T/3600/cellSource.dat T_result/head_T.dat
 mv postProcessing/back_left_O/3600/faceSource.dat T_result/back_left_O.dat
 mv postProcessing/back_right_O/3600/faceSource.dat T_result/back_right_O.dat
 mv postProcessing/chest_left_O/3600/faceSource.dat T_result/chest_left_O.dat
 mv postProcessing/chest_right_O/3600/faceSource.dat T_result/chest_right_O.dat
 mv postProcessing/waist_left_back_O/3600/faceSource.dat T_result/waist_left_back_O.dat
 mv postProcessing/waist_left_front_O/3600/faceSource.dat T_result/waist_left_front_O.dat
 mv postProcessing/waist_right_back_O/3600/faceSource.dat T_result/waist_right_back_O.dat
 mv postProcessing/waist_right_front_O/3600/faceSource.dat T_result/waist_right_front_O.dat
 mv postProcessing/femur_left_back_O/3600/faceSource.dat T_result/femur_left_back_O.dat
 mv postProcessing/femur_left_front_O/3600/faceSource.dat T_result/femur_left_front_O.dat
 mv postProcessing/femur_right_back_O/3600/faceSource.dat T_result/femur_right_back_O.dat
 mv postProcessing/femur_right_front_O/3600/faceSource.dat T_result/femur_right_front_O.dat
 mv postProcessing/lowerleg_left_back_O/3600/faceSource.dat T_result/lowerleg_left_back_O.dat
 mv postProcessing/lowerleg_left_front_O/3600/faceSource.dat T_result/lowerleg_left_front_O.dat
 mv postProcessing/lowerleg_right_back_O/3600/faceSource.dat T_result/lowerleg_right_back_O.dat
 mv postProcessing/lowerleg_right_front_O/3600/faceSource.dat T_result/lowerleg_right_front_O.dat
 mv postProcessing/upperarm_left_back_O/3600/faceSource.dat T_result/upperarm_left_back_O.dat
 mv postProcessing/upperarm_left_front_O/3600/faceSource.dat T_result/upperarm_left_front_O.dat
 mv postProcessing/upperarm_right_back_O/3600/faceSource.dat T_result/upperarm_right_back_O.dat
 mv postProcessing/upperarm_right_front_O/3600/faceSource.dat T_result/upperarm_right_front_O.dat
 mv postProcessing/forearm_left_back_O/3600/faceSource.dat T_result/forearm_left_back_O.dat
 mv postProcessing/forearm_left_front_O/3600/faceSource.dat T_result/forearm_left_front_O.dat
 mv postProcessing/forearm_right_back_O/3600/faceSource.dat T_result/forearm_right_back_O.dat
 mv postProcessing/forearm_right_front_O/3600/faceSource.dat T_result/forearm_right_front_O.dat
 mv postProcessing/foot_left_O/3600/faceSource.dat T_result/foot_left_O.dat
 mv postProcessing/foot_right_O/3600/faceSource.dat T_result/foot_right_O.dat
 mv postProcessing/hand_left_O/3600/faceSource.dat T_result/hand_left_O.dat
 mv postProcessing/hand_right_O/3600/faceSource.dat T_result/hand_right_O.dat
 mv postProcessing/neck_back_O/3600/faceSource.dat T_result/neck_back_O.dat
 mv postProcessing/neck_front_O/3600/faceSource.dat T_result/neck_front_O.dat
 mv postProcessing/face_O/3600/faceSource.dat T_result/face_O.dat
 mv postProcessing/head_O/3600/faceSource.dat T_result/head_O.dat
 mv postProcessing/floor/3600/faceSource.dat T_result/floor.dat
 mv postProcessing/ceiling/3600/faceSource.dat T_result/ceiling.dat
 mv postProcessing/north/3600/faceSource.dat T_result/north.dat
 mv postProcessing/south/3600/faceSource.dat T_result/south.dat
 mv postProcessing/east/3600/faceSource.dat T_result/east.dat
 mv postProcessing/west/3600/faceSource.dat T_result/west.dat
 mv postProcessing/eastwindow/3600/faceSource.dat T_result/eastwindow.dat
 mv postProcessing/westwindow/3600/faceSource.dat T_result/westwindow.dat
 mv postProcessing/Lsouthwindow/3600/faceSource.dat T_result/Lsouthwindow.dat
 mv postProcessing/Leastwindow/3600/faceSource.dat T_result/Leastwindow.dat
 mv postProcessing/w_internal_T/3600/cellSource.dat T_result/w_internal_T.dat
# mv postProcessing/inceiling/3600/faceSource.dat T_result/inceiling.dat
# mv postProcessing/wall_north2/3600/faceSource.dat T_result/wall_north2.dat
# mv postProcessing/wall_east/3600/faceSource.dat T_result/wall_east.dat
# mv postProcessing/wall_west2/3600/faceSource.dat T_result/wall_west2.dat
# mv postProcessing/wall2F/3600/faceSource.dat T_result/wall2F.dat
# mv postProcessing/inwall2F1/3600/faceSource.dat T_result/inwall2F1.dat
# mv postProcessing/inwall2F2/3600/faceSource.dat T_result/inwall2F2.dat
# mv postProcessing/inwall2F3/3600/faceSource.dat T_result/inwall2F3.dat
# mv postProcessing/around/3600/faceSource.dat T_result/around.dat
# mv postProcessing/glass2F1/3600/faceSource.dat T_result/glass2F1.dat
# mv postProcessing/glass2F2/3600/faceSource.dat T_result/glass2F2.dat
# mv postProcessing/glass_north/3600/faceSource.dat T_result/glass_north.dat
# mv postProcessing/glass_south1/3600/faceSource.dat T_result/glass_south1.dat
# mv postProcessing/glass_south2/3600/faceSource.dat T_result/glass_south2.dat
# mv postProcessing/glass_west3/3600/cellSource.dat T_result/glass_west3.dat
 cat T_result/* > output.dat
#
#Sampling(output output2.dat)
 cat output.dat | sed -ne '0~4p' > output2.dat
#
#to thermal manikin(output nyuryokuyou.txt)
 ifort cat.f
 ./a.out
 ifort result.f
 ./a.out

#
#Sakoi model
 cd SakoiModel_master
 cp RESULT32_${time}.txt ..
 cd ..

 sed 1d RESULT32_${time}.txt > RESULT32_b.txt
 awk '{print $2,$3,$4,$5}' RESULT32_b.txt > RESULT32.txt

 paste result1.txt result2.txt RESULT32.txt > ${time}.txt

 rm RESULT32_${time}.txt

 done

 cat 3*.txt > 3e.txt
 cat *e.txt > excel_B.txt

