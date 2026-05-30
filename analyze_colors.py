from PIL import Image
from collections import Counter
import os

for key in ['bc1250', 'bc1000', 'bc600', 'bc500']:
    path = rf"E:\OneDrive\桌面\biocce-new-site\images\product-{key}.png"
    img = Image.open(path).convert('RGBA')
    pixels = list(img.getdata())
    
    # Count most common colors
    color_counts = Counter(pixels)
    top10 = color_counts.most_common(10)
    
    print(f"\n=== {key} ===")
    print(f"Total pixels: {len(pixels)}")
    print(f"Unique colors: {len(color_counts)}")
    print("Top 10 colors:")
    for color, count in top10:
        r, g, b, a = color
        hex_color = f"#{r:02x}{g:02x}{b:02x}"
        print(f"  ({r:3d},{g:3d},{b:3d},a={a:3d}) #{hex_color}: {count:6d} px ({count/len(pixels)*100:.2f}%)")
