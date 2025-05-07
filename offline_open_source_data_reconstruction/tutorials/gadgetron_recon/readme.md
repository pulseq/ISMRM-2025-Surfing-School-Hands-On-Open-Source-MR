
# Gadgetron reconstruction
Step 1: Gadgetron installation (for more details, visit here)

Download and install Docker software. You may need to install/update the Windows Sub Linux (WSL) system for the Docker installation.
Open your terminal (Power shell with administrative privilege in Windows) and navigate to the folder you would like to map to the Gadgetron Docker container.
Run: docker run -t --name gt_latest --detach --volume ${pwd}:/opt/data ghcr.io/gadgetron/gadgetron/gadgetron_ubuntu_rt_nocuda:latest. If docker is not recognized, set docker to connect to C:\Program Files\Docker\Docker\resources\bin in the Environment Path in Windows. This will download and then launch the latest Gadgetron version in a Docker container. It will also mount your current folder as a data folder inside the container.
Run this command: docker exec -ti gt_latest /bin/bash. This will execute your Gadgetron container.
Step 2: Data preparation

Place your SE/EPI .dat/.h5 data in the mounted folder.
Run the command in Terminal: cd /opt/data to enter the mounted folder.
Step 3: MRD conversion

For Siemens data, you can convert the .dat data to MRD data by using Gadgetron. If Gsdgetron doesn't work (e.g. for XA EPI data), you can then use the Matlab script siemens2mrd_epi.m.
The command for Siemens SE data conversion: siemens_to_ismrmrd -f meas_MID*.dat -z 2 -o se_data.h5.
The command for Siemens EPI data conversion: siemens_to_ismrmrd -f meas_MID*.dat -z 2 -m IsmrmrdParameterMap_Siemens.xml -x IsmrmrdParameterMap_Siemens_EPI.xsl -o epi_data.h5.
For GE data, you can convert the .mat raw data to MRD data by using the Matlab scripts with the corresponding .seq files. For SE conversion: use pulseq2mrd_se.m with QA_T1.seq. For EPI conversion: use pulseq2mrd_epi.m with QA_epi.seq.
Step 4: Gadgetron reconstruction

SE reconstruction: gadgetron_ismrmrd_client -f se_data.h5 -c default.xml -o se_out.h5.
EPI reconstruction: first, put qc_epi.xml to the mounted folder and then copy it to the Gadgetron container: cp /opt/data/qc_epi.xml /opt/conda/envs/gadgetron/share/gadgetron/config/. Then, run the reconstruction: gadgetron_ismrmrd_client -f epi_data.h5 -c qc_epi.xml -o epi_out.h5.
