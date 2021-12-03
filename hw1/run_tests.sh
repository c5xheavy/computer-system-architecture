echo "Run test #1"
time code/cmake-build-debug/hw1 -f tests/test01.txt tests/out01_1.txt tests/out01_2.txt

echo "Run test #2"
time code/cmake-build-debug/hw1 -f tests/test02.txt tests/out02_1.txt tests/out02_2.txt

echo "Run test #3"
time code/cmake-build-debug/hw1 -f tests/test03.txt tests/out03_1.txt tests/out03_2.txt

echo "Run test #4"
time code/cmake-build-debug/hw1 -f tests/test04.txt tests/out04_1.txt tests/out04_2.txt

echo "Run test #5"
time code/cmake-build-debug/hw1 -f tests/test05.txt tests/out05_1.txt tests/out05_2.txt

echo "Run test #6 (random)"
time code/cmake-build-debug/hw1 -n 10000 tests/outrnd_1.txt tests/outrnd_2.txt
