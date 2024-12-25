#!/bin/bash

# Directories and script
CNT_DIR="sample1/"
STY_DIR="watercolor/"
OUTPUT_DIR="results_path2/"
SCRIPT="run_styleid.py"

# Ensure output directory exists
mkdir -p $OUTPUT_DIR

# Parameter ranges
gamma_values=(8.0)
T_values=(1.5)

# Generate combinations and run
counter=1
for gamma in "${gamma_values[@]}"; do
    for T in "${T_values[@]}"; do
        output_file="${OUTPUT_DIR}result_gamma_${gamma}_T_${T}"
        echo "Running with gamma=${gamma}, T=${T}, saving to ${output_file}"
        python $SCRIPT --cnt $CNT_DIR --sty $STY_DIR --output_path $output_file --gamma $gamma --T $T
        ((counter++))
    done
done

echo "All runs completed! Check the results in $OUTPUT_DIR."
