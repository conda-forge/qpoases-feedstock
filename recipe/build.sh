#!/bin/sh

mkdir build
cd build

cmake ${CMAKE_ARGS} -GNinja .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DQPOASES_AVOID_LA_NAMING_CONFLICTS:BOOL=ON \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DBUILD_TESTING:BOOL=ON ..

cmake --build . --config Release
cmake --build . --config Release --target install
ctest --output-on-failure -C Release
ls
ls bin

cd ../interfaces/python && python setup.py build_ext --inplace
cp qpoases.cpython-*.so $SP_DIR


# For tests
mkdir $RECIPE_DIR/bin
echo $SRC_DIR
ls $SRC_DIR/build
ls $SRC_DIR/build/bin

cp $SRC_DIR/build/bin/example1 $RECIPE_DIR/bin/example1
cp $SRC_DIR/build/bin/example1b $RECIPE_DIR/bin/example1b
cp $SRC_DIR/build/bin/example2 $RECIPE_DIR/bin/example2
cp ./tests/test_examples.py $RECIPE_DIR/test_examples.py 
