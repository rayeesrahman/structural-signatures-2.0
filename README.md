# structural-signatures-2.0
### Leaner, faster, better,

##  Structural signatures generator

To start, untar the tar.gz file in the database folder and run structural-signatures-2.0.sh.

Next export the `homed` variable to be the installation directory of structural signatures, add it to your `.bashrc`. 

If you are in the installation directory and want it automatically done, you can use the following command on linux systems (Ubuntu, WSL), not OSX. 

`$ pwd | sed -E "s/(.+)/export homed='\1'/gi"  >> ~/.bashrc`

Otherwise just export the installation directory, using the following command, changing the `/path/to/structural-signatures-2.0/` to your installation path: 

`export homed='/path/to/structural-signatures-2.0/'  >> ~/.bashrc`
## Dependancies
R >=3.0

Rscript

Perl >=5.22.8

Perl DBI

Perl Parrallel Fork Manager

sqlite >3.0
