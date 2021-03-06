% Function for saving data in human-readable format files for LSTD(0)-Q learning problems.
%
% in: 
%    filename - filename
%    D        - data struct, containing
%     .T      - time
%     .X      - states
%     .U      - actions
%     .Y      - observed states
%     .Xn     - states after one time step
%     .Un     - actions after one time step (following policy)
%     .Yn     - observed states after one time step
%     .V      - value function at X 
%     .Q      - Q value function at X,U
%
function save_data_lstd0q(filename,D)

fid = fopen([filename,'.dat'],'wt');
fprintf(fid,'N = %d\n',D.N);
fprintf(fid,'dimX = %d\n',size(D.X,1));
fprintf(fid,'dimY = %d\n',size(D.Y,1));
fprintf(fid,'dimA1= %d\n',size(D.A,1));
for i=1:size(D.X,1),fprintf(fid,'X%d\t' ,i);end
for i=1:size(D.Y,1),fprintf(fid,'Y%d\t' ,i);end
for i=1:size(D.F,1),fprintf(fid,'F%d\t',i);end
for i=1:size(D.A,1),for j=1:size(D.A,2),fprintf(fid,'A%d%d\t',i,j);end;end
for i=1:size(D.P,1),for j=1:size(D.P,2),fprintf(fid,'P%d%d\t',i,j);end;end
fprintf(fid,'\n');
fclose(fid);
dlmwrite([filename,'.dat'],[D.X',D.Y',D.F',reshape(D.A,size(D.A,1)*size(D.A,2),size(D.A,3))',reshape(D.P,size(D.P,1)*size(D.P,2),size(D.P,3))'],'delimiter','\t','-append');

