from PIL import Image
import os

# Card background color (#f5f5f5) - light gray matching card .img-wrap background
CARD_BG = (245, 245, 245)
OUT_DIR = r"E:\OneDrive\桌面\biocce-new-site\images"
OUT_DIR2 = r"E:\OneDrive\桌面\biocce-new-site\images\detail"

os.makedirs(OUT_DIR2, exist_ok=True)

for key in ['bc1250', 'bc1000', 'bc600', 'bc500']:
    in_path = os.path.join(OUT_DIR, f"product-{key}.png")
    out_card_path = os.path.join(OUT_DIR, f"product-{key}.png")
    
    img = Image.open(in_path).convert('RGBA')
    pixels = img.load()
    w, h = img.size
    
    replaced = 0
    for x in range(w):
        for y in range(h):
            r, g, b, a = pixels[x, y]
            if a == 0:  # fully transparent
                pixels[x, y] = (CARD_BG[0], CARD_BG[1], CARD_BG[2], 255)
                replaced += 1
    
    total = w * h
    print(f"{key}: Filled {replaced}/{total} transparent pixels ({replaced/total*100:.1f}%)")
    img.save(out_card_path, "PNG")
    fsize = os.path.getsize(out_card_path)
    print(f"  Saved: {out_card_path} ({fsize/1024:.1f} KB)")

print("\n=== Done ===")
