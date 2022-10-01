%Read Images (Inputs) into type double matrix 75x75 in grayscale
AudreyHepburn = double(imread('AudreyHepburn.jpg'));
BillGates = double(rgb2gray(imread('BillGates.jpg')));
MrWhite = double(rgb2gray(imread('MrWhite.jpg')));
SheldonCooper = double(rgb2gray(imread('SheldonCooper.jpg')));
TaylorSwift = double(rgb2gray(imread('TaylorSwift.jpg')));

%flatten, normalize, and transpose input matrices of 75x75 into 5625x1
AH_norm_reshaped = reshape(normc(AudreyHepburn),[1,5625])';
BG_norm_reshaped = reshape(normc(BillGates),[1,5625])';
MW_norm_reshaped = reshape(normc(MrWhite),[1,5625])';
SC_norm_reshaped = reshape(normc(SheldonCooper),[1,5625])';
TS_norm_reshaped = reshape(normc(TaylorSwift),[1,5625])';

%flatten and transpose input matrices of 75x75 into 5625x1
AH_reshaped = reshape(AudreyHepburn,[1,5625])';
BG_reshaped = reshape(BillGates,[1,5625])';
MW_reshaped = reshape(MrWhite,[1,5625])';
SC_reshaped = reshape(SheldonCooper,[1,5625])';
TS_reshaped = reshape(TaylorSwift,[1,5625])';

%Input Matrices
P_norm = [AH_norm_reshaped BG_norm_reshaped MW_norm_reshaped SC_norm_reshaped TS_norm_reshaped]; %used for Hebb rule method
P = [AH_reshaped BG_reshaped MW_reshaped SC_reshaped TS_reshaped]; %used for pseudoinverse method

%Outputs, assuming autoassociative memory
t_AH = AH_reshaped;
t_BG = BG_reshaped;
t_MW = MW_reshaped;
t_SC = SC_reshaped;
t_TS = TS_reshaped;

%Output Matrix
T = [t_AH t_BG t_MW t_SC t_TS];

%Add 20dB white Gaussian noise to each image:
AH_noisy_n = normc(awgn(AH_reshaped, 20, 'Measured'));
BG_noisy_n = normc(awgn(BG_reshaped, 20, 'Measured'));
MW_noisy_n = normc(awgn(MW_reshaped, 20, 'Measured'));
SC_noisy_n = normc(awgn(SC_reshaped, 20, 'Measured'));
TS_noisy_n = normc(awgn(TS_reshaped, 20, 'Measured'));

AH_noisy = awgn(AH_reshaped, 20, 'Measured');
BG_noisy = awgn(BG_reshaped, 20, 'Measured');
MW_noisy = awgn(MW_reshaped, 20, 'Measured');
SC_noisy = awgn(SC_reshaped, 20, 'Measured');
TS_noisy = awgn(TS_reshaped, 20, 'Measured');

%Show noisy image:
%noisy_img = reshape(TS_noisy,[75,75]);
%imshow(noisy_img,[])

%Show original image:
%imshow(AudreyHepburn,[])
%imshow(BillGates,[])
%imshow(MrWhite,[])
%imshow(SheldonCooper,[])
%imshow(TaylorSwift,[])



%Hebb Rule Method
W_Hebb = T*P_norm';

result_AH = reshape(W_Hebb*AH_noisy_n,[75,75]);
result_BG = reshape(W_Hebb*BG_noisy_n,[75,75]);
result_MW = reshape(W_Hebb*MW_noisy_n,[75,75]);
result_SC = reshape(W_Hebb*SC_noisy_n,[75,75]);
result_TS = reshape(W_Hebb*TS_noisy_n,[75,75]);


%Show recovered image:
%imshow(r_AH,[])
%imshow(r_BG,[])
%imshow(r_MW,[])
%imshow(r_SC,[])
%imshow(r_TS,[])

Hebb_Table01_Part2 = [corr2(AudreyHepburn, result_AH) corr2(AudreyHepburn, result_BG) corr2(AudreyHepburn, result_MW) corr2(AudreyHepburn, result_SC) corr2(AudreyHepburn, result_TS); corr2(BillGates, result_AH) corr2(BillGates, result_BG) corr2(BillGates, result_MW) corr2(BillGates, result_SC) corr2(BillGates, result_TS); corr2(MrWhite, result_AH) corr2(MrWhite, result_BG) corr2(MrWhite, result_MW) corr2(MrWhite, result_SC) corr2(MrWhite, result_TS); corr2(SheldonCooper, result_AH) corr2(SheldonCooper, result_BG) corr2(SheldonCooper, result_MW) corr2(SheldonCooper, result_SC) corr2(SheldonCooper, result_TS); corr2(TaylorSwift, result_AH) corr2(TaylorSwift, result_BG) corr2(TaylorSwift, result_MW) corr2(TaylorSwift, result_SC) corr2(TaylorSwift, result_TS)]


%Pseudoinverse Method
W_pseuinv = T*inv(P'*P)*P';

r_AH = reshape(W_pseuinv*AH_noisy,[75,75]);
r_BG = reshape(W_pseuinv*BG_noisy,[75,75]);
r_MW = reshape(W_pseuinv*MW_noisy,[75,75]);
r_SC = reshape(W_pseuinv*SC_noisy,[75,75]);
r_TS = reshape(W_pseuinv*TS_noisy,[75,75]);

Pseuinv_Table01_Part2 = [corr2(AudreyHepburn, r_AH) corr2(AudreyHepburn, r_BG) corr2(AudreyHepburn, r_MW) corr2(AudreyHepburn, r_SC) corr2(AudreyHepburn, r_TS); corr2(BillGates, r_AH) corr2(BillGates, r_BG) corr2(BillGates, r_MW) corr2(BillGates, r_SC) corr2(BillGates, r_TS); corr2(MrWhite, r_AH) corr2(MrWhite, r_BG) corr2(MrWhite, r_MW) corr2(MrWhite, r_SC) corr2(MrWhite, r_TS); corr2(SheldonCooper, r_AH) corr2(SheldonCooper, r_BG) corr2(SheldonCooper, r_MW) corr2(SheldonCooper, r_SC) corr2(SheldonCooper, r_TS); corr2(TaylorSwift, r_AH) corr2(TaylorSwift, r_BG) corr2(TaylorSwift, r_MW) corr2(TaylorSwift, r_SC) corr2(TaylorSwift, r_TS)]





