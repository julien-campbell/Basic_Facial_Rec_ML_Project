%Part 1
P1 = [1 -1 -1 -1 -1 1 -1 1 1 1 1 -1 -1 1 1 1 1 -1 -1 1 1 1 1 -1 1 -1 -1 -1 -1 1]'; %0
P2 = [1 1 1 1 1 1 -1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 1 1 1 1 1 1 1 1 1 1 1 1]'; %1
P3 = [-1 1 1 1 1 1 -1 1 1 -1 -1 -1 -1 1 1 -1 1 -1 1 -1 -1 1 1 -1 1 1 1 1 1 -1]'; %2

P1_n = normc(P1);
P2_n = normc(P2);
P3_n = normc(P3);

P_norm = [P1_n P2_n P3_n];
P = [P1 P2 P3];

%autoassociative memory, where t_q = p_q
t1 = P1;
t2 = P2;
t3 = P3;
T = [t1 t2 t3];




%Hebb Rule Method
W_Hebb = T*P_norm';

%Creates Corrupted images (simply corrupts 3 pixels, 3, 10, and 24)
P1_c = P1;
P1_c(3) = -P1_c(3);
P1_c(10) = -P1_c(10);
P1_c(24) = -P1_c(24);
P1_c = normc(P1_c);

P2_c = P2;
P2_c(3) = -P2_c(3);
P2_c(10) = -P2_c(10);
P2_c(24) = -P2_c(24);
P2_c = normc(P2_c);

P3_c = P3;
P3_c(3) = -P3_c(3);
P3_c(10) = -P3_c(10);
P3_c(24) = -P3_c(24);
P3_c = normc(P3_c);

%Testing Network
%Displays recovered image from corrputed P1
result1 = W_Hebb*P1_c;
rec_img1 = reshape(result1,[6,5]);
%imshow(rec_img1, []); %comment out as needed to see the other images

%Displays recovered image from corrputed P2
result2 = W_Hebb*P2_c;
rec_img2 = reshape(result2,[6,5]);
%imshow(rec_img2, []); %comment out as needed to see the other images

%Displays recovered image from corrputed P3
result3 = W_Hebb*P3_c;
rec_img3 = reshape(result3,[6,5]);
%imshow(rec_img3, []); %comment out as needed to see the other images

Hebb_Table01_Part1 = [corr2(P1, result1) corr2(P1, result2) corr2(P1, result3); corr2(P2, result1) corr2(P2, result2) corr2(P2, result3); corr2(P3, result1) corr2(P3, result2) corr2(P3, result3)] 






%Psuedoinverse Method
W_pseuinv = T*inv(P'*P)*P';

r1 = W_pseuinv*P1_c;
r_img1 = reshape(r1,[6,5]);
%imshow(r_img1, []); %comment out as needed to see the other images

%Displays recovered image from corrputed P2
r2 = W_pseuinv*P2_c;
r_img2 = reshape(r2,[6,5]);
%imshow(r_img2, []); %comment out as needed to see the other images

%Displays recovered image from corrputed P3
r3 = W_pseuinv*P3_c;
r_img3 = reshape(r3,[6,5]);
%imshow(r_img3, []); %comment out as needed to see the other images

Pseuinv_Table01_Part1 = [corr2(P1, r1) corr2(P1, r2) corr2(P1, r3); corr2(P2, r1) corr2(P2, r2) corr2(P2, r3); corr2(P3, r1) corr2(P3, r2) corr2(P3, r3)] 




