$c = Get-Content "C:\Users\Michael\Desktop\biocce-new-site\cases.html" -Raw

$newCases = @'
            <div class="cs-card">
                <div class="cs-img"><img src="/images/product-bc1000.svg" alt="BC1000 in Indonesia Cold Storage"></div>
                <div class="cs-body">
                    <div class="cs-country">Indonesia</div>
                    <h3>Cold Storage Warehouse</h3>
                    <p>BC1000 ride-on scrubber for -18 degree C cold storage. Special low-temperature battery config. 10-hour continuous operation.</p>
                </div>
            </div>
            <div class="cs-card">
                <div class="cs-img"><img src="/images/product-bc600.svg" alt="BC600 in Uzbekistan Exhibition Center"></div>
                <div class="cs-body">
                    <div class="cs-country">Uzbekistan</div>
                    <h3>Exhibition Center Cleaning</h3>
                    <p>5 BC600 scrubbers supplied to Tashkent exhibition center. 20,000 sqm polished concrete floors cleaned nightly.</p>
                </div>
            </div>
            <div class="cs-card">
                <div class="cs-img"><img src="/images/product-bc500.svg" alt="BC500 in Kenya Supermarket Chain"></div>
                <div class="cs-body">
                    <div class="cs-country">Kenya</div>
                    <h3>Retail Expansion Project</h3>
                    <p>150 BC500 scrubbers for a major East African supermarket chain. Single largest BIOCCE order, delivered in 45 days.</p>
                </div>
            </div>
'@

$oldClose = @'
        </div>

    </div>

</section>



<!-- ===== CTA =====
'@

# Insert new cases before the close
$c = $c.Replace($oldClose, $newCases + "`n        </div>`n`n    </div>`n`n</section>`n`n`n`n<!-- ===== CTA =====")

$c | Set-Content "C:\Users\Michael\Desktop\biocce-new-site\cases.html" -Encoding utf8
Write-Output "Cases updated"
