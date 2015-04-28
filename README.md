# pythonocc_oce_setup
This is a script to install OpenCASCADE Community Edition (OCE) coupled with PythonOCC on Ubuntu 14.04

Once you clone the repository, `cd` into the pythonocc_oce_setup directory and set the script to be executable.

```
$ chmod +x Ubuntu_14_04_OCE_PythonOCC_Setup.sh
```
Then run the script with superuser priveleges.
```
$ sudo ./Ubuntu_14_04_OCE_PythonOCC_Setup.sh
```

After the installation is complete, you should be able to run the following example and end up with a simple GUI window.

```
python /usr/lib/python2.7/dist-packages/OCC/Display/SimpleGui.py
```
