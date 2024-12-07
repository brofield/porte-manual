#!/usr/bin/python3

import os, sys
from googletrans import Translator
from bs4 import BeautifulSoup, Comment

# only process a specific subdir
sub_dir = ''

# Hardcoded source and destination directories
src_dir = './porte-utf8' + sub_dir
dst_dir = './porte-manual' + sub_dir
don_dir = './porte-done' + sub_dir

# Initialize the Google Translate API
translator = Translator()

# how many times have we restarted ourselves?
level = 1  
if len(sys.argv) > 1 and sys.argv[-1].isdigit():
    level = int(sys.argv[-1])
    
def get_text(element):
    if isinstance(element, Comment): 
        return ''
    if element.find_parent("noframes"): 
        return ''    
    return element.strip()
    
def translate_html_file_many(src_file, dst_file):
    with open(src_file, 'r', encoding='utf-8') as file:
        soup = BeautifulSoup(file, 'html5lib')

        org_text = []
        for element in soup.find_all(string=True):
            txt = get_text(element)
            if not txt: continue
            txt = txt.replace('\r', ' ').replace('\n', ' ')
            org_text.append(txt)

        if len(org_text) > 0:
            org_block = '\n\n'.join(org_text)
            txn_block = translator.translate(org_block, src='ja', dest='en').text
            txn_text = txn_block.replace("\n\n", "\n").splitlines()
            
            idx = 0
            for element in soup.find_all(string=True):
                txt = get_text(element)
                if not txt: continue
                element.string.replace_with(txn_text[idx])
                idx = idx + 1
                
    # Write the translated content to the destination file
    with open(dst_file, 'w', encoding='utf-8') as file:
        file.write(str(soup))

def translate_html_file_one(src_file, dst_file):
    idx = 0
    err = 0
    with open(src_file, 'r', encoding='utf-8') as file:
        soup = BeautifulSoup(file, 'html5lib')
        for element in soup.find_all(string=True):
            txt = get_text(element)
            if not txt: continue
            try:
                translated_text = translator.translate(txt, src='ja', dest='en').text
                element.string.replace_with(translated_text)
                print('.', end='', flush=True)
            except Exception as e:
                err = err + 1
                print(f'\nFailed ({idx}) |{txt}| e={e}')
                if err > 20: 
                    err = -1
                    break
            idx = idx + 1
    
    # if we've had too many translation errors, try again
    if err < 0:
        restart_program()
    
    # Write the translated content to the destination file
    with open(dst_file, 'w', encoding='utf-8') as file:
        file.write(str(soup))

def restart_program():
    print('', flush=True)
    try:
        args = [sys.executable] + [sys.argv[0]] + [str(level + 1)]
        #print(f"exec {sys.executable} {args}")
        os.execv(sys.executable, args)
    except Exception as e:
        print(f"Failed to restart the program: {e}")
        sys.exit(1)
        
def translate_directory(src_dir, dst_dir):
    count = 0
    for root, _, files in os.walk(src_dir):
        for file in files:
            if file.endswith(('.htm', '.html')):
                src_file = os.path.join(root, file)
                rel_path = os.path.relpath(src_file, src_dir)
                dst_file = os.path.join(dst_dir, rel_path)
                don_file = os.path.join(don_dir, rel_path)
                
                # Create destination directory if it doesn't exist
                os.makedirs(os.path.dirname(dst_file), exist_ok=True)
                os.makedirs(os.path.dirname(don_file), exist_ok=True)
                
                # Translate only if the file does not exist in the done directory
                if not os.path.exists(don_file):
                    print(f"Txn: {dst_file:<130} ", end='', flush=True)
                    try:
                        translate_html_file_many(src_file, dst_file)
                    except:
                        print('Bulk failed. Trying single ', flush=True)
                        translate_html_file_one(src_file, dst_file)
                    print('OK')
                    open(don_file, 'w').close()
                    
                    # translation API errors seem to occur more the longer we run
                    count = count + 1
                    if count >= 50:
                        restart_program()
                #else:
                #    print(f"Txn: {dst_file:<130} Done.")
                    

# Run the translation
print(f"Starting ... {level}")
translate_directory(src_dir, dst_dir)

