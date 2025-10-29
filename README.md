# DockSmith: An Automated Pipeline for Molecular Docking 

1) Objective: This project is a Python-based workflow designed to automate the repetitive tasks of structure-based virtual screening.
The primary goal was to gain practical experience in building a robust, parallelized computational pipeline that handles all steps from ligand preparation to results aggregation.

2) Key Features:
- Ligand Preparation: Automatically processes a ligand library, converting SMILES to 3D structures, adding hydrogens, and generating pdbqt files using OpenBabel.
- Parallelized Docking: Leverages Python's multiprocessing library to run docking calculations (AutoDock Vina / Smina) in parallel, dramatically speeding up the screening of large libraries.
- Automated Results Parsing: Gathers docking scores and PDBQT poses from all completed jobs.
- Results Aggregation: Compiles all scores into a single, sorted .csv file for easy analysis and filtering.

3) Tools Used: Python, OpenBabel, AutoDock Vina,Py3Dmol. 
