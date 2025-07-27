#!/bin/bash

receptor="../data/mpro_clean.pdbqt"
ligand_dir="../data/ligands_pdbqt"
output_dir="../results/best_poses"
mkdir -p "$output_dir"

# Define center and size of docking box (these are placeholders — replace with actual Mpro active site center)
center_x=-10
center_y=12.5
center_z=68.5
size_x=20
size_y=20
size_z=20

echo "Ligand,Score" > ../results/docking_scores.csv

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
        echo "$base,$score" >> ../results/docking_scores.csv
    else
        echo "$base,N/A" >> ../results/docking_scores.csv
        echo "Warning: $out_file not found or docking failed."
    fi
done

