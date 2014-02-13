%% Define constants
delete('holder.g')
folder = '/usr/brlcad/bin/';
C = sprintf('%smged holder.g', folder);

%% Draw the round edges
% updated 6.12.12 to make the aluminium and the connector block slightly
% larger. It will conseqently accommodate the chip more loosely prevenring
% its cracking
unix(sprintf('%s in Cc1.s rcc   -2.2  2.1 -0.1   0 0 8.1   2.2\n', C));
unix(sprintf('%s in Cc2.s rcc   -2.2 22.9 -0.1   0 0 8.1   2.2\n', C));
unix(sprintf('%s r Cc.r u Cc1.s u Cc2.s\n', C));

%% Draw the body of the chip
% updated 6.12.12 to make the aluminium and the connector block slightly
% larger. It will conseqently accommodate the chip more loosely prevenring
% its cracking
unix(sprintf('%s in Cb1.s arb8   -8   25.1 -0.1   -2.2 25.1 -0.1   -2.2 25.1 8   -8   25.1 8   -8   -0.1 -0.1   -2.2 -0.1 -0.1   -2.2 -0.1 8   -8   -0.1 8\n', C));
unix(sprintf('%s in Cb2.s arb8   -2.2 22.9 -0.1   -0   22.9 -0.1   -0   22.9 8   -2.2 22.9 8   -2.2  2.1 -0.1   -0    2.1 -0.1   -0    2.1 8   -2.2  2.1 8\n', C));
unix(sprintf('%s r Cb.r u Cb1.s u Cb2.s\n', C));

%% Draw the screws on the chip
unix(sprintf('%s in Cs1.s rcc   -8 22.5 2.3   -2 0 0   2.7\n', C));
unix(sprintf('%s in Cs2.s rcc   -8  2.5 2.3   -2 0 0   2.7\n', C));
unix(sprintf('%s r Cs.r u Cs1.s u Cs2.s\n', C));

%% Draw the metal clip on the chip
unix(sprintf('%s in Cm1.s arb8   -8.35 25  0     -8 25  0     -8 25  5    -8.35 25  5     -8.35 0  0     -8 0  0     -8 0  5     -8.35 0  5\n', C));
unix(sprintf('%s in Cm2.s arb8   -8.35 25  5     -8 25  5     -8 25  8    -8.55 25  8     -8.35 0  5     -8 0  5     -8 0  8     -8.55 0  8\n', C));
unix(sprintf('%s in Cm3.s arb8   -8.55 22  8     -8 22  8     -8 20 12.5  -8.85 20 12.5   -8.55 2  8     -8 2  8     -8 5 12.5   -8.85 5 12.5\n', C));
unix(sprintf('%s in Cm4.s arb8   -8.35 20 -0.5   -8 20 -0.5   -8 20  0    -8.35 20  0     -8.35 5 -0.5   -8 5 -0.5   -8 5  0     -8.35 5  0\n', C));
unix(sprintf('%s r Cm.r u Cm1.s u Cm2.s u Cm3.s u Cm4.s\n', C));

%% Draw the glass chip itself
unix(sprintf('%s in Cg1.s arb8   -8   20.5 -40.5   -5.8 20.5 -40.5   -5.8 20.5 0   -8   20.5 0   -8   4.5 -40.5   -5.8 4.5 -40.5   -5.8 4.5 0   -8   4.5 0\n', C));
unix(sprintf('%s in Cg2.s arb8   -5.8 20.5  -2.2   -3.8 20.5  -2.2   -3.8 20.5 0   -5.8 20.5 0   -5.8 4.5  -2.2   -3.8 4.5  -2.2   -3.8 4.5 0   -5.8 4.5 0\n', C));
unix(sprintf('%s r Cg.r u Cg1.s u Cg2.s\n', C));

%% Join aluminium parts into one combination and give them material properties
unix(sprintf('%s comb Calum.c u Cc.r u Cb.r\n', C));
unix(sprintf('%s mater Calum.c "plastic" 150 150 150 0\n', C));

%% Join metallic parts into one combination and give them material properties
unix(sprintf('%s comb Cmetal.c u Cs.r u Cm.r\n', C));
unix(sprintf('%s mater Cmetal.c "mirror" 150 150 150 0\n', C));

%% Give material to the glass
unix(sprintf('%s comb Cglass.c u Cg.r\n', C));
unix(sprintf('%s mater Cglass.c "glass" 150 150 150 0\n', C));

%% Draw the round edges of the connector
% updated 6.12.12 to make the aluminium and the connector block slightly
% larger. It will conseqently accommodate the chip more loosely prevenring
% its cracking
unix(sprintf('%s in Nc1.s rcc   -2.2  2.1 8   0 0 7.4   2.2\n', C));
unix(sprintf('%s in Nc2.s rcc   -2.2 22.9 8   0 0 7.4   2.2\n', C));
unix(sprintf('%s r Nc.r u Nc1.s u Nc2.s\n', C));

%% Draw the body of the connector
unix(sprintf('%s in Nb1.s arb8   -8   25.1 8   -2.2 25.1 8   -2.2 25.1 15.4   -8   25.1 15.4   -8   -0.1 8   -2.2 -0.1 8   -2.2 -0.1 15.4   -8   -0.1 15.4\n', C));
unix(sprintf('%s in Nb2.s arb8   -2.2 22.8 8   -0   22.9 8   -0   22.9 15.4   -2.2 22.9 15.4   -2.2  2.1 8   -0    2.1 8   -0    2.1 15.4   -2.2  2.1 15.4\n', C));
unix(sprintf('%s r Nb.r u Nb1.s u Nb2.s\n', C));

%% Draw the screws and fasteners on the connector
unix(sprintf('%s in Ns1.s rcc   -6.05  2.5 15.3   0 0 13.1   2.7\n', C));
unix(sprintf('%s in Ns2.s rcc   -6.05 22.5 15.3   0 0 13.1   2.7\n', C));
unix(sprintf('%s in Ns3.s rcc   -2.5   6   15.3   0 0  2     2.7\n', C));
unix(sprintf('%s in Ns4.s rcc   -2.5  19   15.3   0 0  2     2.7\n', C));
unix(sprintf('%s r Ns.r u Ns1.s u Ns2.s u Ns3.s u Ns4.s\n', C));

%% Draw the tubes and their supports
r = 60;
step = pi / 250;
d = step * r * 1.05;
u = 0;
bx = -12;
for i = 0 : step : pi / 6
    u = u + 1;
    v = 0;
    for y = 8 : 3 : 17
        v = v + 1;
        x = -6.05 - r + r * cos(i);
        z = 15.30 + r * sin(i);
        dx = -d * sin(i);
        dy = 0;
        dz = + d * cos(i);
        unix(sprintf('%s in t%g_%02.0f.s rcc %6.3f %6.3f %6.3f\t%6.3f %6.3f %6.3f\t1\n', C, v, u, x, y, z, dx, dy, dz));
    end
    unix(sprintf('%s in ls%02.0f.s arb8 -12 6 %6.3f\t-12 6 %6.3f\t%6.3f 6 %6.3f\t%6.3f 6 %6.3f\t-12 19 %6.3f\t-12 19 %6.3f\t%6.3f 19 %6.3f\t%6.3f 19 %6.3f\n', C, u, z + dz, z, x, z, x + dx, z + dz, z + dz, z, x, z, x + dx, z + dz));
    unix(sprintf('%s in us%02.0f.s arb8 -5.8 19 %6.3f\t-5.8 19 %6.3f\t%6.3f 19 %6.3f\t%6.3f 19 %6.3f\t-5.8 6 %6.3f\t-5.8 6 %6.3f\t%6.3f 6 %6.3f\t%6.3f 6 %6.3f\n', C, u, z + dz, z, x, z, x + dx, z + dz, z + dz, z, x, z, x + dx, z + dz));
end
for j = 1 : 4;
    u1 = sprintf('%s r t%g.r', C, j);
    u2 = sprintf(' u t%g_%02.0f.s', reshape([ones(1, u) * j; 1 : u], 1, 2 * u));
    u3 = sprintf('\n');
    unix([u1 u2 u3]);
end
u1 = sprintf('%s r ls.r', C);
u2 = sprintf(' u ls%02.0f.s', 1 : u);
u3 = sprintf('\n');
unix([u1 u2 u3]);
u1 = sprintf('%s r us.r', C);
u2 = sprintf(' u us%02.0f.s', 1 : u);
u3 = sprintf('\n');
unix([u1 u2 u3]);


%% Get the rest of the supports
% updated 6.12.12 to make the length of the holder shorter by 1 mm.
% Previously, it could not fit into slide holder.
unix(sprintf('%s in lS1.s arb8 -12 -13.5   0     -12   -13.5  30   -5.8 -13.5  30   -5.8 -13.5   0   -12 39.5   0   -12   39.5  30   -5.8 39.5  30   -5.8 39.5   0\n', C));
unix(sprintf('%s in lS2.s arb8 -12 -13.5 -50     -12   -13.5   0   -6.8 -13.5   0   -6.8 -13.5 -50   -12 39.5 -50   -12   39.5   0   -6.8 39.5   0   -6.8 39.5 -50\n', C));
unix(sprintf('%s in lS3.s arb8 -12 -13.5 -59     -12   -13.5 -50   -5.8 -13.5 -50   -5.8 -13.5 -59   -12 39.5 -59   -12   39.5 -50   -5.8 39.5 -50   -5.8 39.5 -59\n', C));
unix(sprintf('%s in lS4.s arb6 -12 -13.5  30     -12    39.5  30   -5.8  39.5  30   -5.8 -13.5  30   -12 13    38    -5.8 13    38\n', C));
unix(sprintf('%s in lS5.s arb6 -12  39.5 -59     -12   -13.5 -59   -5.8 -13.5 -59   -5.8  39.5 -59   -12 13   -67    -5.8 13   -67\n', C));

% little notches behind the connector
unix(sprintf('%s in lS6.s rcc   -12   1.5  36.5     6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS7.s rcc   -12  24.5  36.5     6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS8.s rcc   -12 -10    33       6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS9.s rcc   -12  36    33       6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS10.s arb8 -12   -0.35 36.5   -12     3.35 36.5   -5.8     3.35 36.5   -5.8  -0.35 36.5   -12  -0.35 30   -12     3.35 30   -5.8     3.35 30   -5.8  -0.35 30\n', C));
unix(sprintf('%s in lS11.s arb8 -12   22.65 36.5   -12    26.35 36.5   -5.8    26.35 36.5   -5.8  22.65 36.5   -12  22.65 30   -12    26.35 30   -5.8    26.35 30   -5.8  22.65 30\n', C));
unix(sprintf('%s in lS12.s arb8 -12  -11.85 33     -12    -8.15 33     -5.8    -8.15 33     -5.8 -11.85 33     -12 -11.85 30   -12    -8.15 30   -5.8    -8.15 30   -5.8 -11.85 30\n', C));
unix(sprintf('%s in lS13.s arb8 -12   34.15 33     -12    37.85 33     -5.8    37.85 33     -5.8  34.15 33     -12  34.15 30   -12    37.85 30   -5.8    37.85 30   -5.8  34.15 30\n', C));

% little notches behind the chip
unix(sprintf('%s in lS14.s rcc   -12   1.5 -65.5     6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS15.s rcc   -12  24.5 -65.5     6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS16.s rcc   -12 -10   -62       6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS17.s rcc   -12  36   -62       6.2   0     0    1.85\n', C));
unix(sprintf('%s in lS18.s arb8 -12   -0.35 -65.5   -12     3.35 -65.5   -5.8     3.35 -65.5   -5.8  -0.35 -65.5   -12  -0.35 -59   -12     3.35 -59   -5.8     3.35 -59   -5.8  -0.35 -59\n', C));
unix(sprintf('%s in lS19.s arb8 -12   22.65 -65.5   -12    26.35 -65.5   -5.8    26.35 -65.5   -5.8  22.65 -65.5   -12  22.65 -59   -12    26.35 -59   -5.8    26.35 -59   -5.8  22.65 -59\n', C));
unix(sprintf('%s in lS20.s arb8 -12  -11.85 -62     -12    -8.15 -62     -5.8    -8.15 -62     -5.8 -11.85 -62     -12 -11.85 -59   -12    -8.15 -59   -5.8    -8.15 -59   -5.8 -11.85 -59\n', C));
unix(sprintf('%s in lS21.s arb8 -12   34.15 -62     -12    37.85 -62     -5.8    37.85 -62     -5.8  34.15 -62     -12  34.15 -59   -12    37.85 -59   -5.8    37.85 -59   -5.8  34.15 -59\n', C));


unix(sprintf('%s r lS.r u lS1.s u lS2.s u lS3.s u lS4.s u lS5.s u lS6.s u lS7.s u lS8.s u lS9.s u lS10.s u lS11.s u lS12.s u lS13.s u lS14.s u lS15.s u lS16.s u lS17.s u lS18.s u lS19.s u lS20.s u lS21.s\n', C));


unix(sprintf('%s in uS1.s arb8 -14   -13.5   0   -14   -13.5  30   -4 -13.5  30   -4 -13.5   0   -14   39.5   0   -14   39.5 30   -4 39.5  30   -4 39.5   0\n', C));

unix(sprintf('%s in uS2a.s arb8  -6.8 -13.5 -50    -6.8 -13.5   0   -4 -13.5   0   -4 -13.5 -50    -6.8 39.5 -50    -6.8 39.5  0   -4 39.5   0   -4 39.5 -50\n', C));
unix(sprintf('%s in uS2b.s arb8   -5.85 19.5 0   -5.85 19.5 -39.5   -5.85 5.5 -39.5   -5.85 5.5 0   -3.95 22.5 0   -3.95 22.5 -42.5   -3.95 2.5 -42.5   -3.95 2.5 0   \n', C));
unix(sprintf('%s r uS2.r u uS2a.s - uS2b.s\n', C));

unix(sprintf('%s in uS3.s arb6 -14   -13.5  30   -14    39.5  30   -4  39.5  30   -4 -13.5  30   -14   13    38    -4   13   38\n', C));
unix(sprintf('%s r uS4.r u uS1.s u uS3.s\n', C));
unix(sprintf('%s comb uS5.c u us.r + uS4.r\n', C));
unix(sprintf('%s in uS6.s arb6 2 -1 1   -5.8 -4 1    -5.8 29 1    2 26 1    -5.8 2 -10   -5.8 23 -10\n', C));
unix(sprintf('%s in uS7.s arb6 2 -1 15  -5.8 -8 15   -5.8 33 15   2 26 15   -5.8 2  28   -5.8 23  28\n', C));
unix(sprintf('%s in uS8.s arb8 2 -1 15  -5.8 -8 15   -5.8 33 15   2 26 15   2 -1 1   -5.8 -4 1    -5.8 29 1    2 26 1\n', C));
unix(sprintf('%s in uS9.s arb8 -4 -13.5   0   -4 -13.5  28   -5.8 -13.5  28   -5.8 -13.5   0   -4 39.5   0   -4   39.5  28   -5.8 39.5  28   -5.8 39.5   0\n', C));
unix(sprintf('%s in uS10.s rcc -5.8 -5  -40   -4 0 0   4\n', C));
unix(sprintf('%s in uS11.s rcc -5.8  30 -40   -4 0 0   4\n', C));






unix(sprintf('%s comb uS.c u uS2.r u uS5.c u uS6.s u uS7.s u uS8.s u uS9.s u uS10.s u uS11.s u uS12.s u uS13.s\n', C));

%% Holes to tap in the upper support
% holes in the recessed cylinders
unix(sprintf('%s in udS1.s rcc -4.8 -5  -40   -5 0 0   1\n', C));
unix(sprintf('%s in udS2.s rcc -4.8  30 -40   -5 0 0   1\n', C));
% holes in the pyramid
unix(sprintf('%s in udS3.s rcc -2   -3   15   -5 0 0   1\n', C));
unix(sprintf('%s in udS4.s rcc -2    28  15   -5 0 0   1\n', C));

%% Holes for screws tap in the lower support
% holes in the recessed cylinders
unix(sprintf('%s in ldS1.s rcc -9.8 -5  -40   -3 0 0   1.5\n', C));
unix(sprintf('%s in ldS2.s rcc -9.8  30 -40   -3 0 0   1.5\n', C));
% holes in the pyramid
unix(sprintf('%s in ldS3.s rcc -5.8 -3   15   -7 0 0   1.5\n', C));
unix(sprintf('%s in ldS4.s rcc -5.8  28  15   -7 0 0   1.5\n', C));

%% Holes for the glass chip in the lower support
unix(sprintf('%s in ldS5.s arb8   -8 19.5 -5   -8 19.5 -34.5   -8 5.5 -34.5   -8 5.5 -5   -12 26.5 1   -12 26.5 -41.5   -12 -0.5 -41.5   -12 -0.5 1   \n', C));

%% little cutouts for connector screws in the upper support
unix(sprintf('%s in udS5.s arb8   -2.5  8.7 15.3   -2.5 3.3  15.3   -7  3.3 15.3   -7  8.7 15.3   -2.5  8.7 17.3   -2.5  3.3 17.3   -7  3.3 17.3   -7  8.7 17.3\n', C));
unix(sprintf('%s in udS6.s arb8   -2.5 21.7 15.3   -2.5 16.3 15.3   -7 16.3 15.3   -7 21.7 15.3   -2.5 21.7 17.3   -2.5 16.3 17.3   -7 16.3 17.3   -7 21.7 17.3\n', C));


%% Delete support


unix(sprintf('%s comb dLs.c u us.r u t1.r u t2.r u t3.r u t4.r u Ns.r u Nb.r u Nc.r u Cs.r u Cb.r u Cc.r u Cg.r u Cm.r u uS10.s u uS11.s u ldS1.s u ldS2.s u ldS3.s u ldS4.s u ldS5.s\n', C))
unix(sprintf('%s comb dUs.c u t1.r u t2.r u t3.r u t4.r u Ns.r u Nb.r u Nc.r u Cs.r u Cb.r u Cc.r u Cg.r u Cm.r u udS1.s u udS2.s u udS3.s u udS4.s u udS5.s u udS6.s\n', C))

%% Join plastic parts into one combination and give them material properties
unix(sprintf('%s comb Nplastic.c u Nc.r u Nb.r\n', C));
unix(sprintf('%s mater Nplastic.c "plastic" 210 150 100 0\n', C));

%% Join metallic parts into one combination and give them material properties
unix(sprintf('%s comb Nmetal.c u Ns.r\n', C));
unix(sprintf('%s mater Nmetal.c "mirror" 150 150 150 0\n', C));

%% Give material to the tubes
unix(sprintf('%s comb Ntubes.c u t1.r u t2.r u t3.r u t4.r\n', C));
unix(sprintf('%s mater Ntubes.c "plastic" 210 190 150 0\n', C));

%% Give material to the support
unix(sprintf('%s comb Lsupport.c u lS.r - dLs.c\n', C));
unix(sprintf('%s mater Lsupport.c "plastic" 150 190 210 0\n', C));
unix(sprintf('%s comb Usupport.c u uS.c - dUs.c\n', C));
unix(sprintf('%s mater Usupport.c "plastic" 150 210 190 0\n', C));

%% Join the chip and the connector and supports together
unix(sprintf('%s comb chip.c u Calum.c u Cmetal.c u Cglass.c\n', C));
unix(sprintf('%s comb connector.c u Nplastic.c u Nmetal.c u Ntubes.c\n', C));

%

% unix(sprintf('%s \n', C));
% unix(sprintf('%s \n', C));
% unix(sprintf('%s \n', C));
% unix(sprintf('%s \n', C));
% unix(sprintf('%s \n', C));
% unix(sprintf('%s \n', C));

%% Produce stl files
if ~exist('STL', 'dir')
    mkdir('STL');
else
    delete('STL/*')
end
unix('g-stl -a 0.05 -o STL/Lsupport.stl holder.g Lsupport.c');
unix('g-stl -a 0.05 -o STL/Usupport.stl holder.g Usupport.c');
unix('g-stl -a 0.05 -o STL/chip.stl holder.g chip.c');
unix('g-stl -a 0.05 -o STL/connector.stl holder.g connector.c');


%% Produce animation files
if ~exist('animation', 'dir')
    mkdir('animation');
else
    delete('animation/*')
end

for i = 0 : 3 : 359
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image1_%04g.png holder.g chip.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image1_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQchip.avi');
unix('cd animation/; mencoder mf://image1_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQchip.avi');

for i = 0 : 3 : 359
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image2_%04g.png holder.g chip.c connector.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image2_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQchip_connector.avi');
unix('cd animation/; mencoder mf://image2_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQchip_connector.avi');

for i = 0 : 3 : 359
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image3_%04g.png holder.g chip.c connector.c Lsupport.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image3_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQLsupport_chip_connector.avi');
unix('cd animation/; mencoder mf://image3_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQLsupport_chip_connector.avi');

for i = 0 : 3 : 359
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image4_%04g.png holder.g chip.c connector.c Usupport.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image4_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQUsupport_chip_connector.avi');
unix('cd animation/; mencoder mf://image4_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQUsupport_chip_connector.avi');

for i = 0 : 3 : 359
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image5_%04g.png holder.g Lsupport.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image5_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQLsupport.avi');
unix('cd animation/; mencoder mf://image5_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQLsupport.avi');

for i = 0 : 3 : 359
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image6_%04g.png holder.g Usupport.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image6_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQUsupport.avi');
unix('cd animation/; mencoder mf://image6_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQUsupport.avi');

for i = 0 : 3 : 719
    unix(sprintf('%srt -a %g -e 35 -w 480 -n 640 -C250/250/160 -o animation/image7_%04g.png holder.g chip.c connector.c Lsupport.c Usupport.c', folder, i, i));
end
unix('cd animation/; mencoder mf://image7_*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQLsupport_Usupport.avi');
unix('cd animation/; mencoder mf://image7_*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQLsupport_Usupport.avi');

% Generate the entire video
unix('cd animation/; mencoder mf://*.png -mf w=480:h=640:fps=25:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -oac copy -o SQmovie.avi');
unix('cd animation/; mencoder mf://*.png -mf w=480:h=640:fps=25:type=png -ovc copy -oac copy -o HQmovie.avi');

delete('animation/*.png')