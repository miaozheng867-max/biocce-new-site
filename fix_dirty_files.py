import os

# Read original files from disk and strip the "N|" prefix pattern
# The files are at: E:\OneDrive\桌面\biocce-new-site\
base = r"E:\OneDrive\桌面\biocce-new-site"
files = ["product-bc1250.html", "product-bc1000.html", "product-bc600.html", "product-bc500.html", "products.html"]
import re

for fname in files:
    fpath = os.path.join(base, fname)
    with open(fpath, "r", encoding="utf-8") as f:
        lines = f.readlines()
    
    # Remove the "    N|" or "    N|    N|" prefix pattern at start of each line
    # Pattern: optional spaces followed by digits followed by |, possibly repeated
    cleaned = []
    for line in lines:
        # Remove all "    N|" prefixes (one or more)
        # This regex matches: optional whitespace, then one or more groups of (digits followed by |)
        new_line = re.sub(r'^[ \t]*(\d+\|)+', '', line)
        # Also handle the case where there's no prefix but just regular content
        if new_line != line:
            pass  # was cleaned
        cleaned.append(new_line)
    
    cleaned_text = ''.join(cleaned)
    
    # Verify by looking at first few lines
    first_100 = cleaned_text[:100]
    print(f"=== {fname} ===")
    print(repr(first_100[:80]))
    
    # Write back
    with open(fpath, "w", encoding="utf-8") as f:
        f.write(cleaned_text)
    
    # Verify: count original tags
    if "<!DOCTYPE" in cleaned_text:
        print("  OK: has DOCTYPE")
    if "<html" in cleaned_text:
        print("  OK: has html tag")
    print()

print("Done!")
