# DockSmith: Automated Structure-Based Docking Workflow for SARS-CoV-2 Mpro Inhibitor Discovery

1) Objective: This module implements a molecular docking pipeline for structure-based virtual screening of ligands based on SARS-CoV-2 Mpro binding affinity, using AutoDock Vina and Open Babel.

2) Key Features:
- Ligand and Receptor Preparation: Process a ligand library, convert SMILES to 3D structures, add hydrogens, and generate  PDBQT files for both protein receptor and ligands.
- Docking: Run docking calculations with AutoDock Vina.
- Results Parsing: Gather docking scores and binding poses from all completed jobs.
- Results Aggregation: Compile top scores into a .csv file.

3) Tools Used: Python, OpenBabel, AutoDock Vina,Py3Dmol.
