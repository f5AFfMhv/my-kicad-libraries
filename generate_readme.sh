#!/bin/bash

# Generate list of files

echo '# My KiCad libraries' > README.md

for item in symbols/*; do
    echo "## $item" >> README.md
    grep "on_board" $item | awk '{print $2}' | sed 's/"//g' | sed 's/^/- /g' >> README.md
done

for dir in footprints/*/; do
    # Check if it's a directory
    if [ -d "$dir" ]; then
        echo "## $dir" >> README.md
        # List files in the directory
        ls -1 "$dir" | sed 's/^/- /g' >> README.md
    fi
done

echo '## 3D models' >> README.md
ls -1 3dmodels | sed 's/^/- /g' >> README.md