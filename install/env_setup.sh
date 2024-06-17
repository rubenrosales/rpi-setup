cd ~/Documents/dev/
python -m venv venv
source venv/bin/activate

#install open3d
git clone https://github.com/isl-org/Open3D.git

#install dependencies
## required for open3d
apt install gfortran
sudo apt-get install -y ccache

./Open3D/util/install_deps_ubuntu.sh

# Build

cd Open3D && mkdir build && cd build
cmake -DBUILD_CUDA_MODULE=OFF -DBUILD_GUI=OFF ..

make -j$(nproc)
make install-pip-package -j$(nproc)

#test
python -c "import open3d; print(open3d.__version__)"
python -c "import open3d as o3d; c = o3d.geometry.TriangleMesh.create_box(); o3d.visualization.draw_geometries([c])"
python -c "import open3d as o3d; c = o3d.geometry.TriangleMesh.create_box(); o3d.visualization.draw(c)"