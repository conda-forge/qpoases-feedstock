#!/bin/sh
# Ensure the version is correct in the sources
echo "++++++++++++++++++++++++++++++ in build sh"

echo "++++++++++++++++++++++++++++++  calling make"
make

echo "++++++++++++++++++++++++++++++  build python"
cd interfaces/python && python setup.py build_ext --inplace
echo "running python -c import qpoases"
python -c "import qpoases"
echo "ldd qpoases.cpython-38-x86_64-linux-gnu.so"
ldd qpoases.cpython-38-x86_64-linux-gnu.so
cp qpoases.cpython-*.so $SP_DIR