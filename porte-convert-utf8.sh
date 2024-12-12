#!/bin/bash

# Source and destination directories
SRC_DIR="./porte-org"
DST_DIR="./porte-utf8"

# Ensure destination directory exists
rm -fr "$DST_DIR"
mkdir -p "$DST_DIR"

# Convert the file to UTF-8 and save to the destination path
convert_file() {
    local src_path=$1
    local dst_path=$2

    # try UTF8 first, if there are no errors here, then it is extremely unlikely that it is SJIS
    if iconv -f UTF-8 -t UTF-8 -o "$dst_path" "$src_path" 2>/dev/null ; then
        echo "UTF8: $src_path"
        return 0
    fi

    # otherwise we hope that it is SJIS first
    if iconv -f SJIS-WIN -t UTF-8 -o "$dst_path" "$src_path" 2>/dev/null ; then
        sed -i -E -e 's/((encoding|charset)\s*=\s*.?)Shift_JIS/\1UTF-8/ig' "$dst_path"
        echo "SJIS: $src_path"
        return 0
    fi

    echo "Error Converting: $src_path"
    return 1
}

# Find and convert all .html files
shopt -s nocasematch
find "$SRC_DIR" -type f | while read -r src_path; do
    # Get the relative path
    rel_path="${src_path#$SRC_DIR/}"
    
    # Get the destination path
    dst_path="$DST_DIR/$rel_path"
    
    # Ensure the destination directory exists
    mkdir -p "$(dirname "$dst_path")"
   
    case "$src_path" in
        *.htm|*.html|*.txt|*.bat|*.js|*.css|*.xml|*.xsl)
            if ! convert_file "$src_path" "$dst_path"; then
                exit 1
            fi
            ;;
        *)
            cp "$src_path" "$dst_path"
            echo "COPY: $src_path"
            ;;
    esac
done
shopt -u nocasematch

echo "Conversion complete."
