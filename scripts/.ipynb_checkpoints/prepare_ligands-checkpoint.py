# scripts/prepare_ligands.py
from openbabel import pybel
import os

input_file = "../data/ligands.smi"
output_dir = "../data/ligands_pdbqt"
os.makedirs(output_dir, exist_ok=True)

for i, mol in enumerate(pybel.readfile("smi", input_file)):
    mol.make3D()
    mol.addh()
    mol.write("pdbqt", f"{output_dir}/ligand_{i}.pdbqt", overwrite=True)

