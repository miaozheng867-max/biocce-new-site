$base = "E:\OneDrive\桌面\biocce-new-site"

function Update-SeoMeta {
    param($file, $title, $desc, $canonical)
    $c = Get-Content $file -Raw -Encoding UTF8
    $c = $c -replace '<title>[^<]+</title>', "<title>$title</title>"
    
    if ($c -match '<meta name="description"') {
        $c = $c -replace '<meta name="description"[^>]*>', '<meta name="description" content="' + $desc + '">'
    }
    
    if ($c -notmatch 'rel="canonical"') {
        $link = "<link rel=""canonical"" href=""https://www.biocce.com$canonical"">"
        $c = $c -replace '</title>', "</title>`n$link"
    }
    
    if ($c -notmatch 'property="og:type"') {
        $og = @"
<meta property="og:type" content="website">
<meta property="og:title" content="$title">
<meta property="og:description" content="$desc">
<meta property="og:url" content="https://www.biocce.com$canonical">
<meta property="og:image" content="https://www.biocce.com/images/about-factory.jpg">
<meta name="twitter:card" content="summary_large_image">
"@
        $c = $c -replace '</title>', "</title>`n$og"
    }
    
    Set-Content $file $c -Encoding UTF8
    Write-Host "  $file"
}

Write-Host "=== Updating SEO meta tags ==="

Update-SeoMeta "$base\products.html" "Industrial Floor Scrubbers and Cleaning Machines | BIOCCE" "Browse BIOCCE`s range of industrial floor scrubbers, ride-on scrubbers and cleaning machines for warehouses and factories. Factory-direct pricing. OEM/ODM available." "/products"
Update-SeoMeta "$base\about.html" "About BIOCCE - Industrial Cleaning Equipment Manufacturer Shanghai since 1994" "Learn about BIOCCE Supply Chain Co. Ltd., a trusted industrial cleaning equipment manufacturer in Shanghai China. 30+ years experience, ISO 9001, exporting to 50+ countries." "/about"
Update-SeoMeta "$base\services.html" "OEM ODM Cleaning Equipment Manufacturing Services | BIOCCE" "BIOCCE offers OEM and ODM manufacturing for industrial cleaning equipment. Custom specs, private labeling, quality assurance and global logistics. Partner with a factory-direct manufacturer." "/services"
Update-SeoMeta "$base\insights.html" "Floor Scrubber Buying Guide and Cleaning Equipment Insights | BIOCCE Blog" "Industry knowledge, product comparisons and guides for floor scrubbers, industrial vacuums, pressure washers and cleaning equipment from a trusted manufacturer since 1994." "/insights"
Update-SeoMeta "$base\contact.html" "Contact BIOCCE - Floor Scrubber Manufacturer and Cleaning Equipment Supplier" "Contact BIOCCE for product inquiries, OEM ODM cooperation or distribution partnerships. Email or WhatsApp. Respond within 2 hours during business hours." "/contact"
Update-SeoMeta "$base\404.html" "Page Not Found | BIOCCE Cleaning Equipment Manufacturer" "The page you are looking for does not exist. Browse BIOCCE full range of industrial floor scrubbers and cleaning equipment. Factory-direct since 1994." "/404"
Update-SeoMeta "$base\product-bc1250.html" "BC1250 Ride-On Floor Scrubber 1100mm | Industrial Cleaning Machine | BIOCCE" "BIOCCE BC1250 ride-on floor scrubber with 1100mm cleaning path 255L tank 6600m2h productivity. Ideal for warehouses factories and large facilities. Factory-direct OEM available." "/product-bc1250"
Update-SeoMeta "$base\product-bc1000.html" "BC1000 Ride-On Floor Scrubber 1000mm Lithium | Industrial Scrubber Dryer | BIOCCE" "BIOCCE BC1000 lithium-powered ride-on floor scrubber with 1000mm cleaning path 175L tank. Perfect for industrial facilities needing eco-friendly battery cleaning. Factory-direct." "/product-bc1000"
Update-SeoMeta "$base\product-bc600.html" "BC600 Compact Ride-On Floor Scrubber 560mm | Small Industrial Scrubber | BIOCCE" "BIOCCE BC600 compact ride-on floor scrubber with 560mm path. Ideal for tight spaces in warehouses retail and light industrial facilities. Factory-direct OEM available." "/product-bc600"
Update-SeoMeta "$base\product-bc500.html" "BC500 Walk-Behind Floor Scrubber 500mm | Commercial Scrubber Dryer | BIOCCE" "BIOCCE BC500 walk-behind floor scrubber dryer with 500mm cleaning path 55L tank. Perfect for commercial cleaning in retail hotels schools and small warehouses. Factory-direct China." "/product-bc500"

Write-Host "`nAll SEO meta tags updated!"
