#!/bin/bash

receptor="../data/mpro_clean.pdbqt"
ligand_dir="../data/ligands_pdbqt"
output_dir="../results/best_poses_pocket2"
mkdir -p "$output_dir"

# Define center and size of docking box 

center_x=-10
center_y=15
center_z=30

size_x=22
size_y=22
size_z=22

echo "Ligand,Score" > ../results/docking_scores_pocket2.csv

for ligand in $ligand_dir/*.pdbqt; do
    base=$(basename "$ligand" .pdbqt)
    out_file="$output_dir/${base}_out.pdbqt"
    log_file="$output_dir/${base}_log.txt"

    vina --receptor "$receptor" \
         --ligand "$ligand" \
         --center_x "$center_x" --center_y "$center_y" --center_z "$center_z" \
         --size_x "$size_x" --size_y "$size_y" --size_z "$size_z" \
         --out "$out_file" \
         --log "$log_file"

    if [[ -f "$out_file" ]]; then
        score=$(grep "REMARK VINA RESULT" "$out_file" | head -n 1 | awk '{print $4}')
        echo "$base,$score" >> ../results/docking_scores_pocket2.csv
    else
        echo "$base,N/A" >> ../results/docking_scores_pocket2.csv
        echo "Warning: $out_file not found or docking failed."
    fi
done

