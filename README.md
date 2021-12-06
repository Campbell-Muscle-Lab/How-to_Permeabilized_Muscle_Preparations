# How-to: Permeabilized Muscle Preparations
## Solutions
### - pCa Solutions
pCa solutions are sets of specialized solutions which are used during permeabilized muscle fiber experiments. The calcium concentration of these solutions often ranges from pCa 9.0 to 4.5 where pCa = -log([Ca<sup>2+</sup>]). These solutions require tight buffering of calcium and calculation of free ion concentrations while taking chelation and hydration complexes into account.

We use a program called [MaxChelator](https://somapp.ucdmc.ucdavis.edu/pharmacology/bers/maxchelator/) which takes into account complex binding rates, chelation, and hydration complex formation to calculate the total concentration of an ion needed to achieve a desired free ion concentration.
### - Relax
Relax has various ions, calcium chelators, and ATP to minimize contraction and keep the muscle viable for future experimentation. Relax solutions is used when working to isolate muscle bundles and fibers and forms the basis of the skinning solution and storage solution. An example recipe can be found and downloaded [here](https://github.com/Campbell-Muscle-Lab/How-to_Permeabilized_Muscle_Preparations/tree/main/Solutions/Relax).
### - Chemical Permeabilization
Chemical permeabilization, also called chemical skinning, uses Triton X-100 to permeabilize the muscle fiber and allows for tight control of the chemical constituents around the myofilaments within the muscle fiber. Our skinning solution is 3 mL 1% Triton X-100 in 30 mL Relax. An example procedure for preparation and skinning of skeletal muscle fibers can be found [here](https://github.com/Campbell-Muscle-Lab/How-to_Permeabilized_Muscle_Preparations/blob/main/Solutions/Chemical%20Skinning/Skeletal_Muscle_Bundle_Preparation.docx).

## SLControl

SLControl is a free software program designed to run muscle mechanics experiments. A detailed explanation of this software can be found in this [publication](https://journals.physiology.org/doi/full/10.1152/ajpheart.00295.2003?rfr_dat=cr_pub++0pubmed&url_ver=Z39.88-2003&rfr_id=ori%3Arid%3Acrossref.org). To download or view demos of this program, visit the [SLControl website](http://www.uky.edu/~kscamp3/SLControl/).

SLControl can run experiments in two broad categories: length control or tension control. In length control, preset length changes are imposed upon the muscle fiber and the tension recorded. In tension control, the muscle is allowed to shorten isotonically at constant preset tension while length is recorded. These modes allow for the creation of pCa-tension curves, force-velocity curves, and other muscle mechanic measurements to be made.
![test](SLControl/SLControl_GUI_examples/fiber_meta_data.png)


## SLControl Experiment Pipeline
