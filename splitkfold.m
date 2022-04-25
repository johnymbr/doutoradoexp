clear all;
clc;

tic
k=10;
percentage=1/k;

folders = dir;
folders = folders([folders.isdir]);
folders = folders(~strncmpi('.', {folders.name}, 1));

fid = fopen('classorderskfold.txt','wt');

for i=1:numel(folders)
    cd(folders(i).name);
    files = [dir('*.jpg'); dir('*.png')];
    n_images = numel(files);
    fold = floor(n_images*percentage);
    disp(folders(i).name)
    shuffle = randperm(n_images);
    fprintf(fid,'\n%s\n',folders(i).name);
    fprintf(fid,'%f ',shuffle);
    for j=0:k-1
        mkdir(strcat('../../fold',num2str(j),'/','train/',folders(i).name));
        mkdir(strcat('../../fold',num2str(j),'/','val/',folders(i).name));
        for m=1:n_images
            if m>j*fold && m<=j*fold+fold
                copyfile(files(shuffle(m)).name,strcat('../../fold',num2str(j),'/val/',folders(i).name))
            else
                copyfile(files(shuffle(m)).name,strcat('../../fold',num2str(j),'/train/',folders(i).name))
            end
        end
    end
    cd('..')
end
fclose(fid);


% for i=1:k
%     for j=1:numel(folders)
%         mkdir(strcat('../fold',num2str(i),'/'),folders(j).name);
%         cd(folders(j).name);
%     end
% end
% 
% for i=1:numel(folders)
%     mkdir(strcat('../val/'),folders(i).name);
%     cd(folders(i).name);
%     files = [dir('*.jpg'); dir('*.png')];
%     n_images=numel(files);
%     samples=ceil(n_images*percentage);
%     shuffle = randperm(n_images);
%     for j=1:samples
%         filename=(strcat(folders(i).name,sprintf('%03d.jpg',shuffle(j))));
%         movefile(filename,strcat('../../val/'),folders(i).name);
%     end    
%     cd ..
% end

toc