import re
import base64
import os
from PIL import Image
from io import BytesIO

# Read the JS file - use raw Windows path
js_path = r"E:\OneDrive\桌面\biocce-new-site\product-images.js"
print(f"Reading: {js_path}")
with open(js_path, "r", encoding="utf-8") as f:
    content = f.read()
print(f"File size: {len(content)} chars")

# Find base64 data for each product
keys = ['bc1250', 'bc1000', 'bc600', 'bc500']
data_map = {}

for i, key in enumerate(keys):
    key_pattern = f"'{key}': "
    start_marker = "'data:image/png;base64,"
    
    key_pos = content.find(key_pattern)
    if key_pos == -1:
        print(f"Key {key} not found!")
        continue
    
    data_start = content.find(start_marker, key_pos)
    if data_start == -1:
        print(f"Data marker not found for {key}!")
        continue
    
    data_start += len(start_marker)
    
    if i < len(keys) - 1:
        next_key = f"'{keys[i+1]}': "
        data_end = content.find(next_key, data_start)
    else:
        data_end = content.find("};", data_start)
    
    if data_end == -1:
        data_end = len(content)
    
    raw_b64 = content[data_start:data_end].strip().rstrip(",\n\r ")
    len_b4 = len(raw_b64)
    
    padding_needed = 4 - (len_b4 % 4)
    if padding_needed != 4:
        raw_b64 += "=" * padding_needed
    
    data_map[key] = raw_b64
    print(f"{key}: {len(raw_b64)} chars of base64 data")

# Card background color (#f5f5f5)
CARD_BG = (245, 245, 245)

output_dir = r"E:\OneDrive\桌面\biocce-new-site\images"

for key, b64 in data_map.items():
    print(f"\n=== Processing {key} ===")
    try:
        img_data = base64.b64decode(b64)
        img = Image.open(BytesIO(img_data))
        print(f"  Size: {img.size}, Mode: {img.mode}")
        
        if img.mode != 'RGBA':
            img = img.convert('RGBA')
        
        pixels = img.load()
        w, h = img.size
        
        # Replace white (>230) background pixels with card background
        replaced = 0
        for x in range(w):
            for y in range(h):
                r, g, b, a = pixels[x, y]
                if a > 200 and r > 230 and g > 230 and b > 230:
                    pixels[x, y] = (CARD_BG[0], CARD_BG[1], CARD_BG[2], 255)
                    replaced += 1
        
        total = w * h
        print(f"  Replaced {replaced}/{total} pixels ({replaced/total*100:.1f}%)")
        
        out_path = os.path.join(output_dir, f"product-{key}.png")
        img.save(out_path, "PNG")
        fsize = os.path.getsize(out_path)
        print(f"  Saved: {out_path} ({fsize/1024:.1f} KB)")
        
    except Exception as e:
        import traceback
        print(f"  ERROR: {e}")
        traceback.print_exc()

print("\n=== Done ===")
