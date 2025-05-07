# Gadgetron reconstruction
## Technical preparation
### Data preparation
* Download the 2D fully-sampled GRE example data from the `example_data` folder of this repository: click [here](https://github.com/pulseq/ISMRM-2025-Surfing-School-Hands-On-Open-Source-MR/tree/main/offline_open_source_data_reconstruction/tutorials/example_data). Place the GRE data in the this `gadgetron_recon` folder.
* Download the ISMRMRD software from [here](https://github.com/ismrmrd/ismrmrd) and add its folder and sub-folders to MATLAB's path.
* Run the `build_ismrmrd_data.m` script to convert the GRE data to ISMRMRD data.
### Gadgetron software installation (for more details, visit [here](https://gadgetron.readthedocs.io/en/latest/using.html))
* Download and install Docker software. You may need to install/update the Windows Subsystem for Linux (WSL) for the Docker installation.
* Open your terminal (Powershell with administrative privilege in Windows) and navigate to the folder you would like to map to the Gadgetron Docker container.
* Execute `docker run -t --name gt_latest --detach --volume ${pwd}:/opt/data ghcr.io/gadgetron/gadgetron/gadgetron_ubuntu_rt_nocuda:latest` to download Gadgetron software and map `\opt\data` folder to the current folder.
* If Docker is not recognized, set Docker to connect to `C:\Program Files\Docker\Docker\resources\bin` in the Environment Path in Windows. This will download and then launch the latest Gadgetron version in a Docker container. It will also mount your current folder as a data folder inside the container.
* Execute this command: `docker exec -ti gt_latest /bin/bash`. This will start up your Gadgetron container.
### Gadgetron reconstruction
* Place your GRE ISMRMRD data (`data.h5`) in the mounted folder.
Run the command `cd /opt/data` in Terminal to enter the mounted folder.
* Execute `gadgetron_ismrmrd_client -f data.h5 -c default_short.xml -o data_out.h5` to get the Gadgetron-reconstructed image (`data_out.h5`) in the mounted folder.
### Image visualization
* run `read_gadgetron_image.m` to visualize the Gadgetron-reconstructed image.
