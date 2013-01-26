* install/update libfprint. These instructions work for ubuntu 12.10 (from https://launchpad.net/~fingerprint/+archive/fprint)

    1. Add this PPA to your sources:
          sudo add-apt-repository ppa:fingerprint/fprint
          sudo apt-get update
          sudo apt-get upgrade
    2. Install the software:
         sudo apt-get install libfprint0 fprint-demo

* install potrace:
     sudo apt-get install potrace

* use fprint-demo to make a png of your fingerprint
    1. sudo fprint_demo (needs root to open device)
    2. go to the 'verify' tab and verify a finger
    3. click the 'save' button to export your fingerprint as a png
    4. copy the file to this directory

* use convert.sh to convert the png to a dxf (tweak settings for potrace and mkbitmap for your reader)
    ./convert.sh

* use openscad to render the fingerprint as a phonecase, export the stl and print it!
    1. openscad case.scad (may take a while 
    2. play with xshift, yshift and zoom to get the print looking good in the border
    3. comment out import_shape() and uncomment back() to slice the bit we want
    4. export the stl and print!