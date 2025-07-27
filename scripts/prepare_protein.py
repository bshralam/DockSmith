# scripts/prepare_protein.py
from openbabel import pybel

input_file = "../data/mpro.pdb"
output_file = "../data/mpro_prepared.pdbqt"

mol = next(pybel.readfile("pdb", input_file))
mol.addh()
mol.write("pdbqt", output_file, overwrite=True)

