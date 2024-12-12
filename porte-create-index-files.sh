#!/bin/bash

generate_index() {
    local dir="$1"
    echo "<html><head><title>Toyota Porte NNP10</title></head><body><ul>" > "$dir/index.html"
    
    # Process directories first
    for f in "$dir"/*; do
        [ -d "$f" ] && echo "<li><a href=\"$(basename "$f")/index.html\">$(basename "$f")/</a></li>" >> "$dir/index.html"
    done

    # Process files
    for f in "$dir"/*; do
        if [ -f "$f" ] && [ "$(basename "$f")" != "index.html" ]; then
            echo "<li><a href=\"$(basename "$f")\">$(basename "$f")</a></li>" >> "$dir/index.html"
        fi
    done

    echo "</ul></body></html>" >> "$dir/index.html"

    # Recurse into subdirectories
    for f in "$dir"/*; do
        [ -d "$f" ] && generate_index "$f"
    done
}

generate_index .