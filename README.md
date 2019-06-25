# structural-signatures-2.0
### Leaner, faster, better,

## Structural Signatures Generator!

To start, untar the tar.gz file in the database folder and run structural-signatures-2.0.sh.

Next export the `homed` variable to be the installation directory of structural signatures, add it to your `.bashrc`. 

If you are in the installation directory and want it automatically done, you can use the following command on linux systems (Ubuntu, WSL), not OSX. 

`$ pwd | sed -E "s/(.+)/export homed='\1'/gi"  >> ~/.bashrc`

Otherwise just export the installation directory, using the following command, changing the `/path/to/structural-signatures-2.0/` to your installation path: 

`export homed='/path/to/structural-signatures-2.0/'  >> ~/.bashrc`

## Adding custom backgrounds to compare against 

Structural signatures generates a pvalues and fold changes by comparing the counted structures against the structure counts against the human proteome from SwissProt (~20,000 proteins)

You may want to compute structural enrichment against a background that is not the human proteome from SwissProt. 

To do this first you can run `structural-signatures-2.0.sh -t both` on the genelist you want to generate the background for. 

Next for each of the structral signature files (`*-enrichments.csv`) run the following command to get the structure counts: 

cut -f1,2 -d"," **filename**-**structure**-enrichment.csv > **name**.background.**[ipr/scop]**.**[domain/family/superfam/fold]**.csv

Where:

**filename** is the output file name from structural signatures. 

**structure** is the output structure type: *domain*, *fold*, *family*, *superfam* or *fold*

**name** is the name of the background you give 

**[ipr/scop]** if structure type is domain use *ipr* if fold, family, superfamily or fold use *scop* 

**[domain/family/superfam/fold]** assign for the specific input structure type you are working with 

Next make a directory here: `bin/files/backgrounds/**name**`  where **name** is the name of the backgrounds you assigned early (___everything must have the same name___)

Move all the files to that directory. 

To use the custom background just specify the `-r` option to `structural-signatures-2.0.sh` and input the **name** of the database. structural-signatures will verify if the counts are in the correct format. 

For examples of how you should format your custom background counts look at the `bin/files/backgrounds/human_proteome/` directory files. 


## Dependancies
R >=3.0

Rscript

Perl >=5.22.8

Perl DBI

Perl Parrallel Fork Manager

sqlite >3.0

## To Do: 
- [ ] Make an installation script 
- [ ] Backport `structural-signatures-1.0 features`(disordered regions, 2D protein feature enrichment, etc)
- [ ] Multiprocessing of protein structure extraction (currently runs one at a time) 
- [ ] Dockerize 
- [ ] Add various error tests 
