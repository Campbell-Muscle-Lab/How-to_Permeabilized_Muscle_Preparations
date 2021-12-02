function mc_output=load_slcontrol_file(file_string)

% Open data file

input_file=fopen(file_string,'r');

% Scan the file until you find the data tag

counter=1;
test_string=fscanf(input_file,'%s',1);
while ((strcmp(test_string,'TMg2')~=1)&&(counter<=100))
    test_string=fscanf(input_file,'%s',1);
    counter=counter+1;
end

if (counter>100)
    display('No "TMg2" tag found in file');
    return
end

% Now read the data and store as structure elements

data=fscanf(input_file,'%g',[3,inf]);

mc_output.FCa2=(data(1,:))';
mc_output.TCa2=(data(2,:))';
mc_output.TMg2=(data(3,:))';
