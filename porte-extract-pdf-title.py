#!/usr/bin/python3

import sys, os
import pdfplumber

def extract_first_title(pdf_path):
    try:
        with pdfplumber.open(pdf_path) as pdf:
            first_page = pdf.pages[0]
            text = first_page.extract_text()

            if text:
                lines = text.split("\n")
                for line in lines:
                    if line.strip():
                        return line.strip()
            return ''
    except Exception as e:
        return ''

def extract_title_from_metadata(pdf_path):
    try:
        with pdfplumber.open(pdf_path) as pdf:
            metadata = pdf.metadata  # Get metadata
            title = metadata.get("Title", '')
            return title
    except Exception as e:
        return ''
        
        
        
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: python {sys.argv[0]} <pdf_file>")
        sys.exit(1)
        
    pdf_file = sys.argv[1]
    ftitle = os.path.splitext(os.path.basename(pdf_file))[0]
    mtitle = extract_title_from_metadata(pdf_file)
    btitle = extract_first_title(pdf_file)
        
    print(f'<li><a href="{pdf_file}">{ftitle}: {mtitle} {btitle}</a></li>')