# open3d in docker 

if open3d seg faults in venv then use docker as a workaround.

1. build image: `docker build -t open3d-headless .`
1. run image:   `docker run --rm -d -v PATH_TO_WHERE_YOUR_CODE_AND_DATASETS_EXIST_ON_RPI_DEVICE:/workdir open3d-headless sleep infinity`
1. attach to image:  
    1. `docker ps` and copy container id
    1. `docker exec -it container_id bash`
1. run code
    1. `cd /workdir`
    1. test if open3d works `python3 rpi-setup/tests/open3d_tests/icp.py`