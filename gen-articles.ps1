$base = "E:\OneDrive\桌面\biocce-new-site"
$aboutHtml = Get-Content (Join-Path $base "about.html") -Raw -Encoding UTF8

$navStart = $aboutHtml.IndexOf("<nav")
$navEnd = $aboutHtml.IndexOf("</nav>") + 6
$navHtml = $aboutHtml.Substring($navStart, $navEnd - $navStart)
$navHtml = $navHtml -replace 'class="active"', ''

$footStart = $aboutHtml.IndexOf("<footer")
$footEnd = $aboutHtml.IndexOf("</html>")
$footHtml = $aboutHtml.Substring($footStart, $footEnd - $footStart)

$waStart = $aboutHtml.IndexOf('<a href="https://wa.me')
$waEnd = $aboutHtml.IndexOf('</a>', $waStart) + 4
$waHtml = $aboutHtml.Substring($waStart, $waEnd - $waStart)

$articles = @(
    @{slug="how-to-choose-floor-scrubber"; title="How to Choose the Right Floor Scrubber for Your Facility"; metaTitle="How to Choose the Right Floor Scrubber - Buyer Guide | BIOCCE"; metaDesc="Complete guide comparing walk-behind and ride-on floor scrubbers for industrial facilities. Cleaning path, tank capacity, battery type and more."; h1="How to Choose the Right Floor Scrubber"; date="May 2026"; image="product-bc1250.png"; cat="Floor Scrubbers"; body=@"
<p>Choosing the right floor scrubber for your facility is a critical decision that impacts cleaning efficiency, labor costs, and long-term maintenance. Whether you manage a warehouse, factory, or commercial facility, this guide will help you make the right choice.</p>
<h2>Walk-Behind vs. Ride-On Floor Scrubbers</h2>
<p><strong>Walk-behind scrubbers</strong> like the BIOCCE BC500 are ideal for facilities under 5,000 m&sup2;. They are more maneuverable in tight spaces and cost less upfront. Applications include retail stores, restaurants, schools, and small workshops.</p>
<p><strong>Ride-on scrubbers</strong> like the BIOCCE BC1250 or BC1000 are designed for larger industrial facilities. They offer higher productivity up to 6,600 m&sup2;/h and reduce operator fatigue during long cleaning shifts.</p>
<h2>Key Specifications</h2>
<h3>Cleaning Path Width</h3>
<p>Small facilities: 500-600mm path (BC500 or BC600). Large warehouses: 1000-1100mm (BC1000 or BC1250) for maximum efficiency.</p>
<h3>Tank Capacity</h3>
<p>The BC1250 features a 255L solution tank for all-day cleaning. For smaller operations, the BC500 55L tank provides ample capacity for daily cleaning rounds.</p>
<h3>Battery Type</h3>
<p>Lithium batteries (BC1000) offer faster charging, longer lifespan, and maintenance-free operation - ideal for multi-shift facilities.</p>
<h2>Factory-Direct Advantage</h2>
<p>As an industrial floor scrubber manufacturer in Shanghai, BIOCCE offers factory-direct pricing, direct technical support, and OEM/ODM customization. Browse our full range of floor scrubbers.</p>
"@}
    @{slug="industrial-vacuum-buyers-guide"; title="Industrial Vacuum Buyer Guide"; metaTitle="Industrial Vacuum Buyer Guide - Types and Specs | BIOCCE"; metaDesc="Understanding suction power, tank capacity, filter types, and what to look for in industrial vacuum cleaners for warehouses, factories, and cleanrooms."; h1="Industrial Vacuum Buyer Guide"; date="May 2026"; image="capability-1.jpg"; cat="Industrial Vacuums"; body=@"
<p>Industrial vacuum cleaners are essential for maintaining clean, safe work environments in factories, warehouses, and cleanrooms. This guide covers everything you need when selecting an industrial vacuum.</p>
<h2>Types of Industrial Vacuums</h2>
<p>Wet/dry vacuums for liquid and debris pickup, explosion-proof for hazardous environments, central systems for large facilities, and portable units for flexible cleaning. Choose based on your specific application.</p>
<h2>Key Selection Criteria</h2>
<h3>Suction Power and Airflow</h3>
<p>Heavy-duty industrial cleaning requires both high suction (water lift) and high airflow (CFM) for efficient debris pickup.</p>
<h3>Filtration Systems</h3>
<p>HEPA filters are essential for pharmaceutical manufacturing and food processing. Multi-stage filtration extends motor life and improves air quality.</p>
<h3>Tank Capacity</h3>
<p>Stainless steel tanks resist corrosion for wet pickup. Larger tanks (50L+) reduce emptying frequency in high-volume applications.</p>
<p>Contact BIOCCE for industrial vacuum solutions and OEM/ODM options tailored to your requirements.</p>
"@}
    @{slug="biocce-factory-direct-difference"; title="The BIOCCE Difference - Factory-Direct Manufacturing"; metaTitle="Factory-Direct Cleaning Equipment - BIOCCE Manufacturing Advantage"; metaDesc="How buying directly from the BIOCCE factory in Shanghai gives you better pricing, quality control, and after-sales support for industrial cleaning equipment."; h1="The BIOCCE Difference"; date="Jun 2026"; image="about-factory.jpg"; cat="Manufacturing"; body=@"
<p>BIOCCE operates as a factory-direct manufacturer in Shanghai, China. We design, produce, and ship cleaning equipment directly to B2B partners worldwide - eliminating middlemen and reducing costs.</p>
<h2>Our Manufacturing Facility</h2>
<p>Our 15,000 m&sup2; facility houses advanced production lines for floor scrubbers, industrial vacuums, pressure washers, and wipes. Every machine undergoes strict quality control before shipping.</p>
<h2>OEM and ODM Services</h2>
<p>As a leading cleaning equipment manufacturer, we offer OEM and ODM services. Produce your own brand, customize existing designs, or develop new specifications with our R&D team.</p>
<h2>Quality Assurance</h2>
<p>ISO 9001 certified quality management guides every production stage. We provide comprehensive after-sales support and spare parts availability worldwide.</p>
<h2>Global Reach</h2>
<p>Exporting to over 50 countries, BIOCCE partners with distributors and OEM clients worldwide. Our logistics team handles shipping, documentation, and customs clearance.</p>
"@}
    @{slug="pressure-washer-maintenance-tips"; title="Pressure Washer Maintenance Tips"; metaTitle="Pressure Washer Maintenance Tips - Extend Equipment Life | BIOCCE"; metaDesc="Extend the life of your commercial pressure washer with essential maintenance practices. Pump care, nozzle cleaning, winter storage and more."; h1="Pressure Washer Maintenance Tips"; date="Jun 2026"; image="capability-2.jpg"; cat="Pressure Washers"; body=@"
<p>Proper maintenance extends the life of your commercial or industrial pressure washer. These tips help avoid costly repairs and downtime.</p>
<h2>1. Pump Care</h2>
<p>The pump is the heart of any pressure washer. Use non-detergent pump oil and change every 500 hours for commercial machines running daily.</p>
<h2>2. Nozzle Maintenance</h2>
<p>Clean nozzles regularly and replace when spray pattern becomes irregular. Keep spare nozzles on hand for quick changes during operation.</p>
<h2>3. Water Supply</h2>
<p>Use clean filtered water. Sediment is the leading cause of pump failure. Consider an in-line water filter for hard water areas.</p>
<h2>4. Winter Storage</h2>
<p>Drain all water from pump, hoses, and wand before freezing temperatures. Use RV antifreeze in the pump for unheated storage spaces.</p>
<h2>5. Regular Inspection</h2>
<p>Check hoses for cracks, inspect fittings for leaks, examine spray gun and wand for wear. Catch small issues early before they become major problems.</p>
<p>Contact BIOCCE for pressure washer spare parts and OEM replacement components.</p>
"@}
    @{slug="industrial-wipes-selection-guide"; title="Industrial Wipes Selection Guide"; metaTitle="Industrial Wipes Selection Guide - Cleanroom and Manufacturing | BIOCCE"; metaDesc="Choosing the right industrial wipes for cleanroom, manufacturing, and maintenance applications. Material types, absorbency, and application guide."; h1="Industrial Wipes Selection Guide"; date="Jul 2026"; image="capability-3.jpg"; cat="Industrial Wipes"; body=@"
<p>Industrial wipes are a critical consumable across manufacturing, cleanroom, pharmaceutical, and maintenance applications. Selecting the right wipe improves effectiveness, reduces waste, and controls costs.</p>
<h2>Wipe Materials</h2>
<h3>Non-Woven Polypropylene</h3>
<p>Ideal for general industrial cleaning, oil absorption, and surface preparation. Good absorbency at low cost for daily factory maintenance.</p>
<h3>Microfiber Wipes</h3>
<p>Excellent for cleanroom environments. Microfiber traps dust without scratching surfaces. Reusable with superior cleaning performance.</p>
<h3>Lint-Free Wipes</h3>
<p>Essential for pharmaceutical, electronics, and paint preparation where contamination control is critical.</p>
<h2>Choosing by Absorbency</h2>
<p>Consider liquid types and surface area. High-absorbency for oil/solvent cleanup, lighter wipes for dusting. Standard sizes from 25x30cm to 40x40cm.</p>
<h2>Bulk B2B Purchasing</h2>
<p>Buying industrial wipes in bulk from a factory-direct supplier like BIOCCE offers significant savings. Contact us for wholesale pricing and OEM packaging.</p>
"@}
)

foreach ($a in $articles) {
    $file = "$($a.slug).html"
    $path = Join-Path $base $file
    $imagePath = "images/$($a.image)"
    $url = "https://www.biocce.com/$($a.slug)"

$htmlContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$($a.metaTitle)</title>
<meta name="description" content="$($a.metaDesc)">
<link rel="canonical" href="$url">
<meta property="og:type" content="article">
<meta property="og:title" content="$($a.metaTitle)">
<meta property="og:description" content="$($a.metaDesc)">
<meta property="og:url" content="$url">
<meta property="og:image" content="https://www.biocce.com/$imagePath">
<meta name="twitter:card" content="summary_large_image">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="design-system.css">
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "$($a.h1)",
  "description": "$($a.metaDesc)",
  "author": { "@type": "Organization", "name": "BIOCCE" },
  "datePublished": "$($a.date) 2026",
  "publisher": { "@type": "Organization", "name": "Biocce Supply Chain Co., Ltd." },
  "mainEntityOfPage": { "@type": "WebPage", "@id": "$url" }
}
</script>
<style>
.article-body{max-width:800px;margin:0 auto;padding:32px 24px 48px}
.article-body h2{font-size:22px;font-weight:600;color:#1A3A4A;margin-top:32px;margin-bottom:12px;padding-bottom:8px;border-bottom:1px solid #e5e7eb}
.article-body h3{font-size:18px;font-weight:600;color:#1A1A1A;margin-top:24px;margin-bottom:8px}
.article-body p{font-size:16px;color:#444;line-height:1.8;margin-bottom:16px}
.article-body strong{color:#1A3A4A}
.article-meta{display:flex;gap:16px;align-items:center;font-size:14px;color:#999;margin-bottom:24px;flex-wrap:wrap}
.article-meta .cat{background:#1A3A4A;color:#fff;padding:3px 10px;border-radius:4px;font-size:12px;font-weight:600}
.article-meta .dot{color:#ccc}
.article-feat-img{width:100%;max-height:400px;object-fit:cover;border-radius:12px;margin-bottom:24px;box-shadow:0 4px 20px rgba(0,0,0,.06)}
.article-cta{background:#1A3A4A;color:#fff;text-align:center;padding:48px 24px;margin-top:32px;border-radius:12px}
.article-cta h2{font-size:22px;font-weight:600;margin-bottom:8px;color:#fff!important;border:none!important}
.article-cta p{color:rgba(255,255,255,.8);margin-bottom:20px}
.article-cta .btn{background:#fff;color:#1A3A4A;padding:12px 28px;border-radius:8px;font-weight:600;display:inline-flex;align-items:center;gap:8px}
.article-cta .btn:hover{transform:translateY(-2px)}
</style>
</head>
<body>

$navHtml

<section class="hero"><div class="hero-banner"><div class="hero-inner"><div class="hero-text"><p class="tagline">$($a.cat)</p><h1 style="margin-top:8px">$($a.h1)</h1></div></div></div></section>

<section class="section-light">
<div class="section-inner">
<div class="article-meta">
<span class="cat">$($a.cat)</span>
<span>$($a.date)</span>
<span class="dot">|</span>
<span>By $($a.author)</span>
</div>

<img src="$imagePath" alt="$($a.h1)" class="article-feat-img" loading="lazy">

<div class="article-body">
$($a.body)
<p style="text-align:center;color:#999;margin-top:40px;font-size:14px;border-top:1px solid #eee;padding-top:24px"><em>Article by BIOCCE - Professional Cleaning Equipment Manufacturer since 1994. Contact us for more information about our products and services.</em></p>
</div>

<div class="article-cta">
<h2>Interested in Our Products?</h2>
<p>Contact our sales team for quotes, samples, and OEM cooperation.</p>
<a href="/contact" class="btn">Get a Quote &rarr;</a>
</div>
</div>
</section>

$footHtml
</body>
</html>
"@

    [System.IO.File]::WriteAllText($path, $htmlContent)
    Write-Host "Created: $file"
}

Write-Host "`nAll 5 article pages created!"
