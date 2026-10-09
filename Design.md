<!-- ZemenGo - Package Delivery Express -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = {"darkMode":"class","theme":{"extend":{"colors":{"secondary-fixed":"#c9e6ff","on-tertiary":"#ffffff","on-primary":"#ffffff","surface-bright":"#faf8ff","surface-container":"#eaedff","primary-fixed":"#dce1ff","on-primary-fixed-variant":"#0039b4","on-error-container":"#93000a","inverse-primary":"#b7c4ff","surface-tint":"#104ee5","primary-container":"#1852e8","on-tertiary-container":"#6af7b9","background":"#faf8ff","on-error":"#ffffff","tertiary":"#005539","tertiary-fixed-dim":"#4edea3","outline-variant":"#c3c5d8","on-secondary-fixed":"#001e2f","error":"#ba1a1a","on-secondary":"#ffffff","secondary-fixed-dim":"#89ceff","on-tertiary-fixed":"#002113","primary":"#003cbb","surface-dim":"#d2d9f4","tertiary-container":"#00704c","surface-container-lowest":"#ffffff","on-surface-variant":"#434655","inverse-on-surface":"#eef0ff","on-secondary-container":"#004666","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","on-primary-container":"#d6dcff","primary-fixed-dim":"#b7c4ff","surface-variant":"#dae2fd","surface-container-low":"#f2f3ff","on-primary-fixed":"#001551","inverse-surface":"#283044","surface-container-highest":"#dae2fd","error-container":"#ffdad6","on-background":"#131b2e","secondary":"#006591","secondary-container":"#39b8fd","tertiary-fixed":"#6ffbbe","on-surface":"#131b2e","surface":"#faf8ff","outline":"#747687","on-secondary-fixed-variant":"#004c6e"},"borderRadius":{"DEFAULT":"0.25rem","lg":"0.5rem","xl":"0.75rem","full":"9999px"},"spacing":{"space-lg":"1.25rem","space-sm":"0.75rem","gutter":"1rem","margin":"1rem","space-xs":"0.5rem","space-md":"1rem","space-2xl":"2rem","space-xl":"1.5rem","space-2xs":"0.25rem"},"fontFamily":{"headline-sm":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"display-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"]},"fontSize":{"headline-sm":["18px",{"lineHeight":"24px","fontWeight":"600"}],"body-md-medium":["14px",{"lineHeight":"20px","fontWeight":"600"}],"body-lg-medium":["16px",{"lineHeight":"24px","fontWeight":"500"}],"display-lg":["36px",{"lineHeight":"44px","letterSpacing":"-0.03em","fontWeight":"800"}],"label-md":["12px",{"lineHeight":"16px","letterSpacing":"0.02em","fontWeight":"600"}],"currency-display":["22px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"800"}],"display-lg-mobile":["28px",{"lineHeight":"34px","letterSpacing":"-0.02em","fontWeight":"800"}],"label-sm":["11px",{"lineHeight":"14px","letterSpacing":"0.04em","fontWeight":"700"}],"body-md":["14px",{"lineHeight":"20px","fontWeight":"400"}],"headline-md":["20px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"700"}],"headline-lg":["24px",{"lineHeight":"32px","letterSpacing":"-0.02em","fontWeight":"700"}],"body-lg":["16px",{"lineHeight":"24px","fontWeight":"400"}]}}}};</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen"><header class="fixed top-0 w-full z-50 pt-safe bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Go back" class="w-11 h-11 -ml-2 rounded-full flex items-center justify-center text-on-surface hover:bg-surface-container transition-colors" onclick="history.back()"><span class="material-symbols-outlined text-[24px]">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm text-on-surface tracking-tight">Ride Booking Flow</h1></div><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></header><main class="flex flex-col relative w-full pt-16 pb-safe bg-surface min-h-screen"><div class="flex flex-col w-full">
<!-- Interactive Courier State Container -->
<div class="flex flex-col gap-space-lg px-margin pb-space-2xl">
<!-- Value Prop Card / Ambient Announcement -->
<div class="relative overflow-hidden bg-primary-container text-on-primary rounded-xl p-space-lg shadow-md">
<div class="absolute -right-6 -bottom-6 w-32 h-32 bg-primary/30 rounded-full blur-2xl pointer-events-none"></div>
<div class="relative z-10 flex items-start gap-space-sm">
<div class="w-10 h-10 rounded-full bg-surface-container-lowest/15 flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[24px] text-on-primary" style="font-variation-settings: 'FILL' 1;">electric_bolt</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-space-2xs mb-1">
<span class="font-label-sm text-label-sm uppercase tracking-wider bg-surface-container-lowest/20 px-2 py-0.5 rounded-full text-on-primary">Superfast Dispatch</span>
<span class="w-1.5 h-1.5 rounded-full bg-tertiary-fixed animate-ping"></span>
</div>
<p class="font-body-md-medium text-body-md-medium text-on-primary leading-snug">
            Send parcels, documents, or keys anywhere in Addis Ababa within 45 mins.
          </p>
</div>
</div>
</div>
<!-- Live Route Static Mini-Map Viewport -->
<div class="relative w-full h-36 rounded-xl overflow-hidden shadow-sm bg-surface-container">
<div class="w-full h-full bg-cover bg-center" data-location="Bole to Piassa, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBThaRBJcwTrq5U84oqdRVIF_ivImF1Oeh26bvB7XPwVnXfZGNgEGbSCIaQVAHlDOLOuchGeA3ICcIV9n6btWT7PGKGpxvzv9sW8Zu9eb2VXwfbPjDbeX2KUAchKDekBBpN0GfIcCsRrjFsEZ3UH1HpKxX4klMo5AADmDbucBgk045MhZZZHUQXjjOi8-iCLxwT5bknHzOY9vobQ5c90L47otmLv7hrAshViChPT4yYtr3lt0A-vPKCnA')"></div>
<div class="absolute inset-0 bg-gradient-to-t from-inverse-surface/60 via-transparent to-transparent"></div>
<div class="absolute bottom-3 left-3 right-3 flex items-center justify-between text-on-primary">
<div class="flex items-center gap-1.5 bg-inverse-surface/80 backdrop-blur-md px-2.5 py-1 rounded-full">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed">route</span>
<span class="font-label-sm text-label-sm">8.2 km via Meskel Square</span>
</div>
<div class="flex items-center gap-1 bg-primary/90 px-2 py-1 rounded-full font-label-sm text-label-sm">
<span class="material-symbols-outlined text-[14px]">timer</span>
<span>~28 mins</span>
</div>
</div>
</div>
<!-- Service Type Selector Tabs -->
<div class="flex flex-col gap-space-xs">
<span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">Select Dispatch Mode</span>
<div class="grid grid-cols-2 gap-space-sm" id="service-tabs">
<!-- Moto Tab (Active) -->
<button class="flex flex-col text-left p-space-sm rounded-xl transition-all duration-200 bg-primary text-on-primary shadow-md" id="tab-moto" onclick="selectService('moto')">
<div class="flex items-center justify-between w-full mb-1.5">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest/20 flex items-center justify-center">
<span class="material-symbols-outlined text-[22px]">two_wheeler</span>
</div>
<span class="font-label-sm text-label-sm px-2 py-0.5 rounded-full bg-tertiary text-on-tertiary">FASTEST</span>
</div>
<h3 class="font-headline-sm text-headline-sm leading-tight">Moto Courier</h3>
<p class="font-label-md text-label-md opacity-90 mt-1">Up to 5kg • Keys, docs, food</p>
</button>
<!-- Cargo Van Tab (Inactive) -->
<button class="flex flex-col text-left p-space-sm rounded-xl transition-all duration-200 bg-surface-container text-on-surface hover:bg-surface-container-high shadow-sm" id="tab-cargo" onclick="selectService('cargo')">
<div class="flex items-center justify-between w-full mb-1.5">
<div class="w-9 h-9 rounded-lg bg-surface-variant flex items-center justify-center text-on-surface-variant">
<span class="material-symbols-outlined text-[22px]">local_shipping</span>
</div>
<span class="font-label-sm text-label-sm px-2 py-0.5 rounded-full bg-surface-container-highest text-on-surface-variant">HEAVY</span>
</div>
<h3 class="font-headline-sm text-headline-sm leading-tight">Cargo Van</h3>
<p class="font-label-md text-label-md text-on-surface-variant mt-1">Up to 300kg • Crates, bulky</p>
</button>
</div>
</div>
<!-- Location Waypoint Form -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm flex flex-col gap-space-sm">
<div class="flex items-start gap-3 relative">
<!-- Connecting indicator graphics -->
<div class="flex flex-col items-center self-stretch py-1.5">
<div class="w-3.5 h-3.5 rounded-full bg-tertiary flex items-center justify-center ring-4 ring-tertiary-fixed/30">
<div class="w-1.5 h-1.5 rounded-full bg-surface-container-lowest"></div>
</div>
<div class="w-0.5 grow my-1 bg-outline-variant"></div>
<div class="w-3.5 h-3.5 rounded bg-primary flex items-center justify-center">
<div class="w-1.5 h-1.5 rounded-xs bg-surface-container-lowest"></div>
</div>
</div>
<!-- Waypoint Inputs -->
<div class="flex flex-col grow gap-space-sm">
<!-- Pickup -->
<div class="flex flex-col">
<div class="flex items-center justify-between">
<label class="font-label-sm text-label-sm text-tertiary uppercase tracking-wider font-semibold">Pickup point</label>
<span class="font-label-sm text-label-sm text-primary">GPS Accurate</span>
</div>
<div class="flex items-center justify-between mt-1 p-2.5 rounded-lg bg-surface-container-low">
<div class="flex flex-col min-w-0 pr-2">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Bole Bulbula, St. George Bldg</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Gate 2 • Addis Ababa</span>
</div>
<button aria-label="Edit pickup" class="w-7 h-7 rounded-full bg-surface flex items-center justify-center text-on-surface-variant shrink-0" type="button">
<span class="material-symbols-outlined text-[18px]">edit</span>
</button>
</div>
</div>
<!-- Destination -->
<div class="flex flex-col">
<div class="flex items-center justify-between">
<label class="font-label-sm text-label-sm text-primary uppercase tracking-wider font-semibold">Drop-off destination</label>
<span class="font-label-sm text-label-sm text-on-surface-variant">Zone 1</span>
</div>
<div class="flex items-center justify-between mt-1 p-2.5 rounded-lg bg-surface-container-low">
<div class="flex flex-col min-w-0 pr-2">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Piassa, Churchill Avenue, Office 402</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">4th Floor • Near Post Office</span>
</div>
<button aria-label="Edit destination" class="w-7 h-7 rounded-full bg-surface flex items-center justify-center text-on-surface-variant shrink-0" type="button">
<span class="material-symbols-outlined text-[18px]">search</span>
</button>
</div>
</div>
</div>
</div>
</div>
<!-- Recipient Information Card -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm flex flex-col gap-space-xs">
<div class="flex items-center justify-between">
<div class="flex items-center gap-space-xs">
<span class="material-symbols-outlined text-primary text-[20px]">person_pin</span>
<h2 class="font-headline-sm text-headline-sm text-on-surface">Recipient Details</h2>
</div>
<span class="font-label-sm text-label-sm px-2 py-0.5 bg-surface-container text-on-surface-variant rounded-full">Contact on Arrival</span>
</div>
<div class="flex items-center justify-between mt-2 pt-2 bg-surface-container-low p-space-sm rounded-lg">
<div class="flex items-center gap-space-sm">
<div class="w-10 h-10 rounded-full bg-secondary-fixed text-on-secondary-fixed flex items-center justify-center font-bold text-headline-sm">
            AK
          </div>
<div class="flex flex-col">
<span class="font-body-md-medium text-body-md-medium text-on-surface">Almaz Kebede</span>
<span class="font-label-md text-label-md text-on-surface-variant">+251 91 123 4567</span>
</div>
</div>
<button aria-label="Call contact" class="w-9 h-9 rounded-full bg-surface-container text-primary flex items-center justify-center">
<span class="material-symbols-outlined text-[18px]">call</span>
</button>
</div>
<!-- Delivery Instruction Note -->
<div class="flex items-start gap-2 bg-surface-container-low px-3 py-2.5 rounded-lg mt-1">
<span class="material-symbols-outlined text-secondary text-[18px] shrink-0 mt-0.5">sticky_note_2</span>
<div class="flex flex-col">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase font-semibold">Special Delivery Note</span>
<p class="font-body-md text-body-md text-on-surface">Call when arriving at Churchill building gate</p>
</div>
</div>
</div>
<!-- Package Details & Category Picker -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm flex flex-col gap-space-sm">
<div class="flex items-center justify-between">
<div class="flex items-center gap-space-xs">
<span class="material-symbols-outlined text-primary text-[20px]">inventory_2</span>
<h2 class="font-headline-sm text-headline-sm text-on-surface">Package Category</h2>
</div>
<span class="font-label-sm text-label-sm font-semibold text-tertiary bg-tertiary-fixed-dim/30 px-2 py-0.5 rounded-full">&lt; 2 kg</span>
</div>
<!-- Category Pills -->
<div class="flex flex-wrap gap-2 pt-1" id="category-chips">
<button class="category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-primary text-on-primary shadow-sm transition-colors" onclick="setCategory(this, 'Docs')">
<span class="material-symbols-outlined text-[16px]">description</span>
<span>Documents &amp; Paperwork</span>
</button>
<button class="category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-surface-container text-on-surface hover:bg-surface-variant transition-colors" onclick="setCategory(this, 'Fragile')">
<span class="material-symbols-outlined text-[16px]">egg</span>
<span>Fragile</span>
</button>
<button class="category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-surface-container text-on-surface hover:bg-surface-variant transition-colors" onclick="setCategory(this, 'Electronics')">
<span class="material-symbols-outlined text-[16px]">devices</span>
<span>Electronics</span>
</button>
<button class="category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-surface-container text-on-surface hover:bg-surface-variant transition-colors" onclick="setCategory(this, 'Clothes')">
<span class="material-symbols-outlined text-[16px]">apparel</span>
<span>Clothes</span>
</button>
<button class="category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-surface-container text-on-surface hover:bg-surface-variant transition-colors" onclick="setCategory(this, 'Food')">
<span class="material-symbols-outlined text-[16px]">restaurant</span>
<span>Food items</span>
</button>
</div>
<!-- Weight Guarantee Pill -->
<div class="flex items-center gap-2 mt-1 px-3 py-2 bg-surface-container-high rounded-lg">
<span class="material-symbols-outlined text-on-surface-variant text-[18px]">scale</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Driver will carry water-resistant seal envelope for your paperwork.</span>
</div>
</div>
<!-- Price Calculation & Payment Summary Card -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-md flex flex-col gap-space-sm">
<div class="flex items-center justify-between pb-2">
<span class="font-headline-sm text-headline-sm text-on-surface">Fare Estimate</span>
<div class="flex items-baseline gap-1 text-primary">
<span class="font-currency-display text-currency-display" id="fare-amount">165</span>
<span class="font-label-md text-label-md uppercase font-bold">ETB</span>
</div>
</div>
<!-- Split Specs Bento -->
<div class="grid grid-cols-3 gap-2 py-2">
<div class="flex flex-col items-center justify-center p-2 rounded-lg bg-surface-container-low text-center">
<span class="font-label-sm text-label-sm text-on-surface-variant">Distance</span>
<span class="font-body-md-medium text-body-md-medium text-on-surface mt-0.5">8.2 km</span>
</div>
<div class="flex flex-col items-center justify-center p-2 rounded-lg bg-surface-container-low text-center">
<span class="font-label-sm text-label-sm text-on-surface-variant">Est. Arrival</span>
<span class="font-body-md-medium text-body-md-medium text-tertiary mt-0.5">28 min</span>
</div>
<div class="flex flex-col items-center justify-center p-2 rounded-lg bg-surface-container-low text-center">
<span class="font-label-sm text-label-sm text-on-surface-variant">Insurance</span>
<span class="font-body-md-medium text-body-md-medium text-secondary mt-0.5">Included</span>
</div>
</div>
<!-- Payment Method Toggle -->
<div class="flex flex-col gap-1.5 pt-1">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase font-semibold">Payment Choice</span>
<div class="grid grid-cols-2 gap-2" id="payment-options">
<!-- Telebirr Selected -->
<button class="payment-btn flex items-center justify-between p-2.5 rounded-xl bg-secondary-fixed text-on-secondary-fixed shadow-sm transition-all" onclick="setPayment(this, 'telebirr')" type="button">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[20px] text-secondary">account_balance_wallet</span>
<span class="font-body-md-medium text-body-md-medium">Telebirr</span>
</div>
<span class="material-symbols-outlined text-[18px] text-secondary">check_circle</span>
</button>
<!-- Cash On Pickup -->
<button class="payment-btn flex items-center justify-between p-2.5 rounded-xl bg-surface-container text-on-surface transition-all" onclick="setPayment(this, 'cash')" type="button">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[20px] text-on-surface-variant">payments</span>
<span class="font-body-md-medium text-body-md-medium">Cash on Pick</span>
</div>
<span class="material-symbols-outlined text-[18px] opacity-0 text-primary">check_circle</span>
</button>
</div>
</div>
</div>
<!-- Dispatch Action Button CTA -->
<div class="flex flex-col gap-2 pt-1">
<button class="relative overflow-hidden w-full h-[52px] bg-primary text-on-primary rounded-xl font-headline-sm text-headline-sm flex items-center justify-center gap-2 shadow-lg shadow-primary/25 active:scale-[0.98] transition-all" id="cta-btn" onclick="triggerDispatch()">
<span class="material-symbols-outlined text-[22px]">rocket_launch</span>
<span id="cta-text">Request Express Courier (165 ETB)</span>
</button>
<div class="flex items-center justify-center gap-1.5 text-on-surface-variant text-center">
<span class="material-symbols-outlined text-[14px] text-tertiary">verified_user</span>
<span class="font-label-sm text-label-sm">Protected by ZemenGo Cargo Shield • Addis Ababa</span>
</div>
</div>
</div>
</div>
<script>
  let currentMode = 'moto';
  let currentFare = 165;

function selectService(mode) {
currentMode = mode;
const motoBtn = document.getElementById('tab-moto');
const cargoBtn = document.getElementById('tab-cargo');
const fareEl = document.getElementById('fare-amount');
const ctaText = document.getElementById('cta-text');

    if (mode === 'moto') {
      currentFare = 165;
      motoBtn.className = "flex flex-col text-left p-space-sm rounded-xl transition-all duration-200 bg-primary text-on-primary shadow-md";
      cargoBtn.className = "flex flex-col text-left p-space-sm rounded-xl transition-all duration-200 bg-surface-container text-on-surface hover:bg-surface-container-high shadow-sm";
    } else {
      currentFare = 450;
      cargoBtn.className = "flex flex-col text-left p-space-sm rounded-xl transition-all duration-200 bg-primary text-on-primary shadow-md";
      motoBtn.className = "flex flex-col text-left p-space-sm rounded-xl transition-all duration-200 bg-surface-container text-on-surface hover:bg-surface-container-high shadow-sm";
    }

    fareEl.textContent = currentFare;
    ctaText.textContent = `Request Express Courier (${currentFare} ETB)`;

}

function setCategory(targetBtn, name) {
const chips = document.querySelectorAll('.category-chip');
chips.forEach(btn => {
btn.className = "category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-surface-container text-on-surface hover:bg-surface-variant transition-colors";
});
targetBtn.className = "category-chip px-3 py-1.5 rounded-full font-label-md text-label-md flex items-center gap-1.5 bg-primary text-on-primary shadow-sm transition-colors";
}

function setPayment(targetBtn, type) {
const btns = document.querySelectorAll('.payment-btn');
btns.forEach(btn => {
btn.className = "payment-btn flex items-center justify-between p-2.5 rounded-xl bg-surface-container text-on-surface transition-all";
const icon = btn.querySelector('.material-symbols-outlined:last-child');
if (icon) icon.classList.add('opacity-0');
});

    if (type === 'telebirr') {
      targetBtn.className = "payment-btn flex items-center justify-between p-2.5 rounded-xl bg-secondary-fixed text-on-secondary-fixed shadow-sm transition-all";
    } else {
      targetBtn.className = "payment-btn flex items-center justify-between p-2.5 rounded-xl bg-primary-fixed text-on-primary-fixed shadow-sm transition-all";
    }

    const checkIcon = targetBtn.querySelector('.material-symbols-outlined:last-child');
    if (checkIcon) checkIcon.classList.remove('opacity-0');

}

function triggerDispatch() {
const cta = document.getElementById('cta-btn');
const ctaText = document.getElementById('cta-text');
cta.disabled = true;
cta.classList.add('opacity-80');
ctaText.textContent = 'Searching Nearby Rider in Bole...';

    setTimeout(() => {
      ctaText.textContent = 'Rider Assigned! (4 mins away)';
      cta.className = 'relative overflow-hidden w-full h-[52px] bg-tertiary text-on-tertiary rounded-xl font-headline-sm text-headline-sm flex items-center justify-center gap-2 shadow-lg transition-all';
    }, 1500);

}
</script></main></body></html>

<!-- ZemenGo - Food Delivery & Restaurants -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_tab" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = {"darkMode":"class","theme":{"extend":{"colors":{"secondary-fixed":"#c9e6ff","on-tertiary":"#ffffff","on-primary":"#ffffff","surface-bright":"#faf8ff","surface-container":"#eaedff","primary-fixed":"#dce1ff","on-primary-fixed-variant":"#0039b4","on-error-container":"#93000a","inverse-primary":"#b7c4ff","surface-tint":"#104ee5","primary-container":"#1852e8","on-tertiary-container":"#6af7b9","background":"#faf8ff","on-error":"#ffffff","tertiary":"#005539","tertiary-fixed-dim":"#4edea3","outline-variant":"#c3c5d8","on-secondary-fixed":"#001e2f","error":"#ba1a1a","on-secondary":"#ffffff","secondary-fixed-dim":"#89ceff","on-tertiary-fixed":"#002113","primary":"#003cbb","surface-dim":"#d2d9f4","tertiary-container":"#00704c","surface-container-lowest":"#ffffff","on-surface-variant":"#434655","inverse-on-surface":"#eef0ff","on-secondary-container":"#004666","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","on-primary-container":"#d6dcff","primary-fixed-dim":"#b7c4ff","surface-variant":"#dae2fd","surface-container-low":"#f2f3ff","on-primary-fixed":"#001551","inverse-surface":"#283044","surface-container-highest":"#dae2fd","error-container":"#ffdad6","on-background":"#131b2e","secondary":"#006591","secondary-container":"#39b8fd","tertiary-fixed":"#6ffbbe","on-surface":"#131b2e","surface":"#faf8ff","outline":"#747687","on-secondary-fixed-variant":"#004c6e"},"borderRadius":{"DEFAULT":"0.25rem","lg":"0.5rem","xl":"0.75rem","full":"9999px"},"spacing":{"space-lg":"1.25rem","space-sm":"0.75rem","gutter":"1rem","margin":"1rem","space-xs":"0.5rem","space-md":"1rem","space-2xl":"2rem","space-xl":"1.5rem","space-2xs":"0.25rem"},"fontFamily":{"headline-sm":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"display-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"]},"fontSize":{"headline-sm":["18px",{"lineHeight":"24px","fontWeight":"600"}],"body-md-medium":["14px",{"lineHeight":"20px","fontWeight":"600"}],"body-lg-medium":["16px",{"lineHeight":"24px","fontWeight":"500"}],"display-lg":["36px",{"lineHeight":"44px","letterSpacing":"-0.03em","fontWeight":"800"}],"label-md":["12px",{"lineHeight":"16px","letterSpacing":"0.02em","fontWeight":"600"}],"currency-display":["22px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"800"}],"display-lg-mobile":["28px",{"lineHeight":"34px","letterSpacing":"-0.02em","fontWeight":"800"}],"label-sm":["11px",{"lineHeight":"14px","letterSpacing":"0.04em","fontWeight":"700"}],"body-md":["14px",{"lineHeight":"20px","fontWeight":"400"}],"headline-md":["20px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"700"}],"headline-lg":["24px",{"lineHeight":"32px","letterSpacing":"-0.02em","fontWeight":"700"}],"body-lg":["16px",{"lineHeight":"24px","fontWeight":"400"}]}}}};</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen"><header class="fixed top-0 w-full z-50 pt-safe bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><div class="w-9 h-9 rounded-xl bg-primary-container flex items-center justify-center text-on-primary font-headline-md text-headline-md tracking-tight shadow-sm">Z</div><span class="font-headline-md text-headline-md text-on-surface tracking-tight">Zemen<span class="text-primary-container">Go</span></span></div><div class="flex items-center gap-space-xs"><button class="h-9 px-space-sm rounded-full bg-surface-container hover:bg-surface-variant flex items-center justify-center text-on-surface-variant font-label-md text-label-md transition-colors"><span class="text-primary-container font-headline-sm">EN</span><span class="mx-1 text-outline-variant">|</span><span>አማ</span></button><button aria-label="Notifications" class="w-11 h-11 rounded-full flex items-center justify-center text-on-surface hover:bg-surface-container transition-colors relative"><span class="material-symbols-outlined text-[24px]">notifications</span><span class="absolute top-2.5 right-2.5 w-2 h-2 rounded-full bg-primary-container ring-2 ring-surface"></span></button><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center ml-space-2xs"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></div></header><main class="flex flex-col relative w-full pt-16 pb-24 bg-surface min-h-screen"><div class="flex flex-col w-full pb-8">
<!-- Live Delivery Availability Banner -->
<div class="px-margin pt-space-xs">
<div class="w-full bg-secondary-fixed text-on-secondary-fixed rounded-xl px-space-md py-space-xs flex items-center justify-between shadow-sm">
<div class="flex items-center gap-space-xs min-w-0">
<span class="flex h-2.5 w-2.5 relative flex-shrink-0">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-secondary"></span>
</span>
<span class="material-symbols-outlined text-[18px] text-secondary flex-shrink-0">two_wheeler</span>
<span class="font-label-md text-label-md truncate">Fast moto-courier tracking available across Addis</span>
</div>
<span class="material-symbols-outlined text-[16px] text-secondary flex-shrink-0 ml-1">chevron_right</span>
</div>
</div>
<!-- Search & Filter Bar -->
<div class="px-margin mt-space-sm">
<div class="flex items-center gap-space-xs">
<div class="flex-1 bg-surface-container-low rounded-xl px-space-md py-3 flex items-center gap-space-xs shadow-sm">
<span class="material-symbols-outlined text-outline text-[20px] flex-shrink-0">search</span>
<input class="bg-transparent border-0 outline-none w-full text-on-surface font-body-md text-body-md placeholder:text-outline-variant" placeholder="Search injera, tibs, burgers, coffee..." type="text"/>
</div>
<button aria-label="Filter restaurants" class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-on-surface-variant hover:bg-surface-container-high active:scale-95 transition-all shadow-sm flex-shrink-0">
<span class="material-symbols-outlined text-[20px]">tune</span>
</button>
</div>
</div>
<!-- Cuisine & Category Carousel -->
<div class="mt-space-md">
<div class="px-margin flex items-center justify-between mb-space-xs">
<h2 class="font-headline-sm text-headline-sm text-on-surface">Explore Cuisines</h2>
<span class="font-label-md text-label-md text-primary-container font-headline-sm">See All</span>
</div>
<div class="flex gap-space-xs overflow-x-auto px-margin no-scrollbar py-1">
<!-- Traditional -->
<button class="flex flex-col items-center gap-1.5 flex-shrink-0 group">
<div class="w-16 h-16 rounded-full bg-primary-container text-on-primary flex items-center justify-center shadow-sm group-active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[26px]">restaurant</span>
</div>
<span class="font-label-sm text-label-sm text-primary font-headline-sm text-center w-20 leading-tight">Habesha</span>
</button>
<!-- Burgers -->
<button class="flex flex-col items-center gap-1.5 flex-shrink-0 group">
<div class="w-16 h-16 rounded-full bg-surface-container text-on-surface-variant flex items-center justify-center shadow-sm group-hover:bg-surface-variant group-active:scale-95 transition-all">
<span class="material-symbols-outlined text-[26px]">lunch_dining</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant text-center w-20 leading-tight">Burgers</span>
</button>
<!-- Coffee & Roastery -->
<button class="flex flex-col items-center gap-1.5 flex-shrink-0 group">
<div class="w-16 h-16 rounded-full bg-surface-container text-on-surface-variant flex items-center justify-center shadow-sm group-hover:bg-surface-variant group-active:scale-95 transition-all">
<span class="material-symbols-outlined text-[26px]">coffee</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant text-center w-20 leading-tight">Coffee &amp; Cafe</span>
</button>
<!-- Pizza & Pasta -->
<button class="flex flex-col items-center gap-1.5 flex-shrink-0 group">
<div class="w-16 h-16 rounded-full bg-surface-container text-on-surface-variant flex items-center justify-center shadow-sm group-hover:bg-surface-variant group-active:scale-95 transition-all">
<span class="material-symbols-outlined text-[26px]">local_pizza</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant text-center w-20 leading-tight">Pizza &amp; Pasta</span>
</button>
<!-- Healthy & Juices -->
<button class="flex flex-col items-center gap-1.5 flex-shrink-0 group">
<div class="w-16 h-16 rounded-full bg-surface-container text-on-surface-variant flex items-center justify-center shadow-sm group-hover:bg-surface-variant group-active:scale-95 transition-all">
<span class="material-symbols-outlined text-[26px]">nutrition</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant text-center w-20 leading-tight">Fresh Juices</span>
</button>
<!-- Bakery -->
<button class="flex flex-col items-center gap-1.5 flex-shrink-0 group">
<div class="w-16 h-16 rounded-full bg-surface-container text-on-surface-variant flex items-center justify-center shadow-sm group-hover:bg-surface-variant group-active:scale-95 transition-all">
<span class="material-symbols-outlined text-[26px]">bakery_dining</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant text-center w-20 leading-tight">Bakery</span>
</button>
</div>
</div>
<!-- Promo Banner -->
<div class="px-margin mt-space-md">
<div class="relative overflow-hidden rounded-2xl bg-gradient-to-r from-primary via-primary-container to-secondary p-space-md text-on-primary shadow-md">
<div class="relative z-10 flex flex-col gap-1 max-w-[75%]">
<div class="flex items-center gap-space-2xs">
<span class="px-2 py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed font-label-sm text-label-sm uppercase tracking-wide">
            Taste of Addis
          </span>
<span class="font-label-sm text-label-sm text-on-primary-container opacity-90">Telebirr Special</span>
</div>
<h3 class="font-headline-md text-headline-md tracking-tight leading-tight mt-0.5">
          20% OFF in Bole
        </h3>
<p class="font-body-md text-body-md text-on-primary-container leading-snug">
          Enjoy signature dining at top Bole locations.
        </p>
<div class="mt-space-2xs inline-flex items-center gap-2">
<div class="px-2.5 py-1 rounded-lg bg-surface-container-lowest/20 backdrop-blur-md text-on-primary font-headline-sm text-headline-sm tracking-wider">
            TASTEET
          </div>
<span class="font-label-sm text-label-sm text-on-primary opacity-80">Copy Code</span>
</div>
</div>
<div class="absolute -right-6 -bottom-6 w-36 h-36 rounded-full bg-surface-container-lowest/10 backdrop-blur-sm pointer-events-none flex items-center justify-center">
<span class="material-symbols-outlined text-[80px] text-on-primary opacity-20">local_fire_department</span>
</div>
</div>
</div>
<!-- Popular Restaurants List -->
<div class="px-margin mt-space-lg flex flex-col gap-space-sm">
<div class="flex items-center justify-between">
<div>
<h2 class="font-headline-md text-headline-md text-on-surface">Popular Restaurants</h2>
<p class="font-body-md text-body-md text-on-surface-variant">Beloved culinary spots in Addis Ababa</p>
</div>
<button class="w-8 h-8 rounded-full bg-surface-container flex items-center justify-center text-primary-container">
<span class="material-symbols-outlined text-[20px]">sort</span>
</button>
</div>
<!-- Restaurant Card 1: Kategna -->
<div class="w-full bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm flex flex-col group active:scale-[0.99] transition-transform">
<div class="relative h-44 w-full overflow-hidden">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" data-alt="A lavish Ethiopian feast featuring a wide messob lined with injera, decorated with colorful mounds of doro wat, special beyaynetu vegan stews, and sizzling sega tibs with rosemary, warm ambient lighting in an upscale Addis Ababa restaurant setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC37VnB9kR6Yfb3i-dTlQZcpJYNQ-YtFZ8XT4-vx9okmn9i3g2hM_TG57uuQq-QMn1qzB3ktttW-rZ9ItJmOo78OF7pRpKN2Pm7XYGu9yW0QE7x2zvhcu4-CQjst3Gs_qkBLtBAU9f_Y_3_s3-xwOY_wximrsaXrsYbjwBaphjDFv0zcGOS2nm4H_gpEe1RfSfx7LdMOdM4hPAyTTsWHlEZ5r13lcbLjb-GxiLtZXKsVHSjICla6xfdCA"/>
<div class="absolute inset-0 bg-gradient-to-t from-inverse-surface/70 via-transparent to-black/20 pointer-events-none"></div>
<div class="absolute top-space-xs left-space-xs flex flex-wrap gap-1">
<span class="px-2.5 py-0.5 rounded-full bg-primary-container text-on-primary font-label-sm text-label-sm flex items-center gap-1 shadow-sm">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">star</span>
            Top Rated
          </span>
<span class="px-2.5 py-0.5 rounded-full bg-tertiary-fixed text-on-tertiary-fixed font-label-sm text-label-sm shadow-sm">
            Free delivery &gt; 500 ETB
          </span>
</div>
<button aria-label="Favorite" class="absolute top-space-xs right-space-xs w-8 h-8 rounded-full bg-surface-container-lowest/80 backdrop-blur-md flex items-center justify-center text-error shadow-sm">
<span class="material-symbols-outlined text-[18px]" style="font-variation-settings: 'FILL' 1;">favorite</span>
</button>
<div class="absolute bottom-space-xs left-space-xs right-space-xs flex justify-between items-end text-on-primary">
<div class="flex items-center gap-1.5 bg-inverse-surface/80 backdrop-blur-md px-2 py-0.5 rounded-md">
<span class="material-symbols-outlined text-[15px] text-tertiary-fixed">schedule</span>
<span class="font-label-md text-label-md">25-35 min</span>
</div>
<div class="flex items-center gap-1 bg-inverse-surface/80 backdrop-blur-md px-2 py-0.5 rounded-md">
<span class="material-symbols-outlined text-[15px] text-secondary-container">moped</span>
<span class="font-label-md text-label-md">65 ETB</span>
</div>
</div>
</div>
<div class="p-space-sm flex flex-col gap-1">
<div class="flex items-center justify-between">
<h3 class="font-headline-sm text-headline-sm text-on-surface truncate">Kategna Restaurant</h3>
<div class="flex items-center gap-0.5 bg-surface-container px-2 py-0.5 rounded-full">
<span class="material-symbols-outlined text-[15px] text-primary" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-md text-label-md text-on-surface">4.8</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">(850+)</span>
</div>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">
          Traditional Ethiopian • Special Beyaynetu • Tibs
        </p>
<div class="flex items-center gap-1 text-outline text-[12px] mt-0.5">
<span class="material-symbols-outlined text-[14px]">location_on</span>
<span class="font-label-sm text-label-sm">Bole Atlas, Addis Ababa</span>
</div>
</div>
</div>
<!-- Restaurant Card 2: Tomoca Coffee -->
<div class="w-full bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm flex flex-col group active:scale-[0.99] transition-transform">
<div class="relative h-44 w-full overflow-hidden">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" data-alt="Artisanal Ethiopian espresso pouring into a ceramic cup at a busy vintage coffee roastery in Addis Ababa, golden crema on dark roasted Harar coffee, fresh croissants and pastries arranged nearby in morning natural lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDiWNjznSy6CIXlv5BtVPb7-O6emHV-DAUA-sHiKKZWgtRKjk7b01t9D-bGEl_zeDJOirdz_kRj-x_u-7-445-U4JInz4U7gffS3hp8KeGuMIMd5MsuXTaJybUVvUWyu4N0cSyV7AgYRNcLRYnLsJBHlH4HIZVZZ15PmGfZQ3VzZeJCxS-Oe3RJ-d200kyN7PMfPglKNNF5H69PNF23UpafhDZx1FB-6BgrrOx6TlcCVvWyl-nVFe-KJQ"/>
<div class="absolute inset-0 bg-gradient-to-t from-inverse-surface/70 via-transparent to-black/20 pointer-events-none"></div>
<div class="absolute top-space-xs left-space-xs flex flex-wrap gap-1">
<span class="px-2.5 py-0.5 rounded-full bg-secondary text-on-secondary font-label-sm text-label-sm flex items-center gap-1 shadow-sm">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">bolt</span>
            Lightning Fast
          </span>
</div>
<button aria-label="Favorite" class="absolute top-space-xs right-space-xs w-8 h-8 rounded-full bg-surface-container-lowest/80 backdrop-blur-md flex items-center justify-center text-outline shadow-sm hover:text-error">
<span class="material-symbols-outlined text-[18px]">favorite</span>
</button>
<div class="absolute bottom-space-xs left-space-xs right-space-xs flex justify-between items-end text-on-primary">
<div class="flex items-center gap-1.5 bg-inverse-surface/80 backdrop-blur-md px-2 py-0.5 rounded-md">
<span class="material-symbols-outlined text-[15px] text-tertiary-fixed">schedule</span>
<span class="font-label-md text-label-md">15-20 min</span>
</div>
<div class="flex items-center gap-1 bg-inverse-surface/80 backdrop-blur-md px-2 py-0.5 rounded-md">
<span class="material-symbols-outlined text-[15px] text-secondary-container">moped</span>
<span class="font-label-md text-label-md">50 ETB</span>
</div>
</div>
</div>
<div class="p-space-sm flex flex-col gap-1">
<div class="flex items-center justify-between">
<h3 class="font-headline-sm text-headline-sm text-on-surface truncate">Tomoca Coffee Roastery</h3>
<div class="flex items-center gap-0.5 bg-surface-container px-2 py-0.5 rounded-full">
<span class="material-symbols-outlined text-[15px] text-primary" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-md text-label-md text-on-surface">4.9</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">(1.4k)</span>
</div>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">
          Specialty Ethiopian Coffee • Pastries
        </p>
<div class="flex items-center gap-1 text-outline text-[12px] mt-0.5">
<span class="material-symbols-outlined text-[14px]">location_on</span>
<span class="font-label-sm text-label-sm">Sarbet, Addis Ababa</span>
</div>
</div>
</div>
<!-- Restaurant Card 3: Savor Addis -->
<div class="w-full bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm flex flex-col group active:scale-[0.99] transition-transform">
<div class="relative h-44 w-full overflow-hidden">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" data-alt="Rustic wood-fired pizza with blistered crust, melted fresh mozzarella, and aromatic basil leaves served alongside a prime seared steak on a dark slate board inside an elegant modern restaurant in Bole Rwanda Addis Ababa" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBGvIxCaNDJn-EqVc5fC146hMs0lHVEVSmD38R6hbM8F-OxZVSb5EbIQsZUPbSQxCOiUgxW9rSz-jX85dWXqr2wTRjyvElmPItSIrN2C_Wm9idqfi3aXAoXDPdmmylS75DOmtc_z9kM7f0t044wwM5PfbUE-VJCoOl-t4ssiVL2bjZZfKld5lNtafmFVjcet94FpRmy37AKkEJ2Ls5nnNnoaw-loRffYsKgKkLvwB0i4456_1PQUREBRg"/>
<div class="absolute inset-0 bg-gradient-to-t from-inverse-surface/70 via-transparent to-black/20 pointer-events-none"></div>
<button aria-label="Favorite" class="absolute top-space-xs right-space-xs w-8 h-8 rounded-full bg-surface-container-lowest/80 backdrop-blur-md flex items-center justify-center text-outline shadow-sm hover:text-error">
<span class="material-symbols-outlined text-[18px]">favorite</span>
</button>
<div class="absolute bottom-space-xs left-space-xs right-space-xs flex justify-between items-end text-on-primary">
<div class="flex items-center gap-1.5 bg-inverse-surface/80 backdrop-blur-md px-2 py-0.5 rounded-md">
<span class="material-symbols-outlined text-[15px] text-tertiary-fixed">schedule</span>
<span class="font-label-md text-label-md">30-45 min</span>
</div>
<div class="flex items-center gap-1 bg-inverse-surface/80 backdrop-blur-md px-2 py-0.5 rounded-md">
<span class="material-symbols-outlined text-[15px] text-secondary-container">moped</span>
<span class="font-label-md text-label-md">80 ETB</span>
</div>
</div>
</div>
<div class="p-space-sm flex flex-col gap-1">
<div class="flex items-center justify-between">
<h3 class="font-headline-sm text-headline-sm text-on-surface truncate">Savor Addis</h3>
<div class="flex items-center gap-0.5 bg-surface-container px-2 py-0.5 rounded-full">
<span class="material-symbols-outlined text-[15px] text-primary" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-md text-label-md text-on-surface">4.7</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">(520)</span>
</div>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">
          Continental • Wood-fired Pizza • Steak
        </p>
<div class="flex items-center gap-1 text-outline text-[12px] mt-0.5">
<span class="material-symbols-outlined text-[14px]">location_on</span>
<span class="font-label-sm text-label-sm">Bole Rwanda, Addis Ababa</span>
</div>
</div>
</div>
</div>
</div></main><nav class="fixed bottom-0 w-full z-50 pb-safe bg-surface-container-lowest/80 backdrop-blur-xl shadow-[0_-4px_16px_rgba(0,0,0,0.04)]" data-active-classes="text-primary-container font-headline-sm"><div class="flex justify-around items-center h-16 px-gutter"><a aria-current="page" class="flex flex-col items-center justify-center w-16 h-14 transition-colors gap-1 text-primary-container font-headline-sm" data-path="home" href="#"><span class="material-symbols-outlined text-[24px]">home</span><span class="font-label-sm text-label-sm tracking-wide">Home</span></a><a class="flex flex-col items-center justify-center w-16 h-14 text-on-surface-variant hover:text-on-surface transition-colors gap-1" data-path="trips-and-orders" href="#"><span class="material-symbols-outlined text-[24px]">receipt_long</span><span class="font-label-sm text-label-sm tracking-wide">Trips</span></a><a class="flex flex-col items-center justify-center w-16 h-14 text-on-surface-variant hover:text-on-surface transition-colors gap-1" data-path="wallet" href="#"><span class="material-symbols-outlined text-[24px]">account_balance_wallet</span><span class="font-label-sm text-label-sm tracking-wide">Wallet</span></a><a class="flex flex-col items-center justify-center w-16 h-14 text-on-surface-variant hover:text-on-surface transition-colors gap-1" data-path="profile" href="#"><span class="material-symbols-outlined text-[24px]">person</span><span class="font-label-sm text-label-sm tracking-wide">Profile</span></a></div></nav></body></html>

<!-- ZemenGo - Driver Partner Live HUD -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = {"darkMode":"class","theme":{"extend":{"colors":{"secondary-fixed":"#c9e6ff","on-tertiary":"#ffffff","on-primary":"#ffffff","surface-bright":"#faf8ff","surface-container":"#eaedff","primary-fixed":"#dce1ff","on-primary-fixed-variant":"#0039b4","on-error-container":"#93000a","inverse-primary":"#b7c4ff","surface-tint":"#104ee5","primary-container":"#1852e8","on-tertiary-container":"#6af7b9","background":"#faf8ff","on-error":"#ffffff","tertiary":"#005539","tertiary-fixed-dim":"#4edea3","outline-variant":"#c3c5d8","on-secondary-fixed":"#001e2f","error":"#ba1a1a","on-secondary":"#ffffff","secondary-fixed-dim":"#89ceff","on-tertiary-fixed":"#002113","primary":"#003cbb","surface-dim":"#d2d9f4","tertiary-container":"#00704c","surface-container-lowest":"#ffffff","on-surface-variant":"#434655","inverse-on-surface":"#eef0ff","on-secondary-container":"#004666","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","on-primary-container":"#d6dcff","primary-fixed-dim":"#b7c4ff","surface-variant":"#dae2fd","surface-container-low":"#f2f3ff","on-primary-fixed":"#001551","inverse-surface":"#283044","surface-container-highest":"#dae2fd","error-container":"#ffdad6","on-background":"#131b2e","secondary":"#006591","secondary-container":"#39b8fd","tertiary-fixed":"#6ffbbe","on-surface":"#131b2e","surface":"#faf8ff","outline":"#747687","on-secondary-fixed-variant":"#004c6e"},"borderRadius":{"DEFAULT":"0.25rem","lg":"0.5rem","xl":"0.75rem","full":"9999px"},"spacing":{"space-lg":"1.25rem","space-sm":"0.75rem","gutter":"1rem","margin":"1rem","space-xs":"0.5rem","space-md":"1rem","space-2xl":"2rem","space-xl":"1.5rem","space-2xs":"0.25rem"},"fontFamily":{"headline-sm":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"display-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"]},"fontSize":{"headline-sm":["18px",{"lineHeight":"24px","fontWeight":"600"}],"body-md-medium":["14px",{"lineHeight":"20px","fontWeight":"600"}],"body-lg-medium":["16px",{"lineHeight":"24px","fontWeight":"500"}],"display-lg":["36px",{"lineHeight":"44px","letterSpacing":"-0.03em","fontWeight":"800"}],"label-md":["12px",{"lineHeight":"16px","letterSpacing":"0.02em","fontWeight":"600"}],"currency-display":["22px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"800"}],"display-lg-mobile":["28px",{"lineHeight":"34px","letterSpacing":"-0.02em","fontWeight":"800"}],"label-sm":["11px",{"lineHeight":"14px","letterSpacing":"0.04em","fontWeight":"700"}],"body-md":["14px",{"lineHeight":"20px","fontWeight":"400"}],"headline-md":["20px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"700"}],"headline-lg":["24px",{"lineHeight":"32px","letterSpacing":"-0.02em","fontWeight":"700"}],"body-lg":["16px",{"lineHeight":"24px","fontWeight":"400"}]}}}};</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen"><header class="fixed top-0 w-full z-50 pt-safe bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Go back" class="w-11 h-11 -ml-2 rounded-full flex items-center justify-center text-on-surface hover:bg-surface-container transition-colors" onclick="history.back()"><span class="material-symbols-outlined text-[24px]">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm text-on-surface tracking-tight">Active Driver Hud</h1></div><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></header><main class="flex flex-col relative w-full pt-16 pb-safe bg-surface min-h-screen"><div class="flex flex-col w-full relative">
<!-- Top Driver Status HUD Floating Bar -->
<div class="px-margin pt-space-xs pb-space-sm w-full z-20 flex flex-col gap-space-xs">
<!-- Row 1: Profile & Online Toggle & Quick Metrics -->
<div class="bg-surface-container-lowest/95 backdrop-blur-md rounded-xl p-space-sm shadow-md flex items-center justify-between">
<!-- Status Toggle & Driver Info -->
<div class="flex items-center gap-space-sm min-w-0">
<div class="relative flex items-center justify-center">
<span class="absolute w-3.5 h-3.5 rounded-full bg-tertiary-fixed-dim animate-ping opacity-75"></span>
<span class="relative w-3 h-3 rounded-full bg-tertiary"></span>
</div>
<div class="flex flex-col min-w-0">
<div class="flex items-center gap-space-2xs">
<span class="font-headline-sm text-headline-sm text-tertiary tracking-tight">ONLINE</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">• Meskel Sq</span>
</div>
<div class="flex items-center gap-space-2xs text-on-surface-variant truncate">
<span class="material-symbols-outlined text-[14px] text-amber-500" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-md text-label-md text-on-surface font-semibold">4.92</span>
<span class="font-label-md text-label-md text-on-surface-variant truncate">Dawit T.</span>
</div>
</div>
</div>
<!-- Today's Earnings Snapshot Pill -->
<div class="flex flex-col items-end bg-surface-container-low px-space-sm py-1.5 rounded-lg shadow-sm">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Today's Net</span>
<div class="flex items-baseline gap-space-2xs">
<span class="font-currency-display text-currency-display text-primary leading-none">1,840</span>
<span class="font-label-sm text-label-sm text-primary font-bold">ETB</span>
</div>
<span class="font-label-sm text-label-sm text-tertiary font-medium">8 Completed</span>
</div>
</div>
<!-- Surge Zone Pill Ticker -->
<div class="flex items-center gap-space-xs overflow-x-auto no-scrollbar py-0.5">
<div class="flex items-center gap-1.5 bg-primary px-space-sm py-1 rounded-full text-on-primary shadow-sm shrink-0">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed animate-pulse">local_fire_department</span>
<span class="font-label-md text-label-md font-bold">Bole +30 ETB Surge</span>
</div>
<div class="flex items-center gap-1.5 bg-surface-container-lowest/90 backdrop-blur-md px-space-sm py-1 rounded-full text-on-surface shadow-sm shrink-0">
<span class="w-2 h-2 rounded-full bg-amber-500"></span>
<span class="font-label-md text-label-md font-medium">Kazanchis: High Demand</span>
</div>
<div class="flex items-center gap-1.5 bg-surface-container-lowest/90 backdrop-blur-md px-space-sm py-1 rounded-full text-on-surface shadow-sm shrink-0">
<span class="w-2 h-2 rounded-full bg-secondary"></span>
<span class="font-label-md text-label-md font-medium">Piazza: Steady</span>
</div>
</div>
</div>
<!-- Addis Ababa Interactive Simulated Map Stage -->
<div class="relative w-full h-[360px] overflow-hidden bg-surface-dim">
<!-- Map Canvas Provider -->
<div class="w-full h-full bg-cover bg-center" data-location="Meskel Square, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBk2lQSk2Fg7Tl_ox98gN4_2MTYNUnE_Y1QqJ_26_7rMfu_t3RH4-487dgBRGi2iUEarhkKapL0bSPjLocKHZES_dfY8XqVA3BPxvP3MPGIYT8nLRqRfC1b4Qrc2KFlStGMrE3dcENrG3flk_JessJRtd68w1wYYwebi9djpDPZ7HnaqWiGzDANInaB9_pwXbq0cZ0s1dEtubTGnGCsqYuUBBzdEg9SDps1aEMwqK0zyXi3Kn2PTq4WNw')"></div>
<!-- Live Heatmap & Route Overlays SVG Layer -->
<div class="absolute inset-0 pointer-events-none">
<svg class="w-full h-full" xmlns="http://www.w3.org/2000/svg">
<defs>
<radialgradient cx="75%" cy="35%" id="surgeBole" r="35%">
<stop offset="0%" stop-color="#1852e8" stop-opacity="0.45"></stop>
<stop offset="60%" stop-color="#39b8fd" stop-opacity="0.25"></stop>
<stop offset="100%" stop-color="#1852e8" stop-opacity="0"></stop>
</radialgradient>
<radialgradient cx="30%" cy="60%" id="surgeKazanchis" r="30%">
<stop offset="0%" stop-color="#00704c" stop-opacity="0.35"></stop>
<stop offset="80%" stop-color="#6af7b9" stop-opacity="0"></stop>
</radialgradient>
<lineargradient id="routeGrad" x1="0%" x2="80%" y1="100%" y2="20%">
<stop offset="0%" stop-color="#1852e8"></stop>
<stop offset="100%" stop-color="#39b8fd"></stop>
</lineargradient>
</defs>
<!-- Demand Hotspot Clouds -->
<circle cx="75%" cy="32%" fill="url(#surgeBole)" r="90"></circle>
<circle cx="32%" cy="65%" fill="url(#surgeKazanchis)" r="70"></circle>
<!-- Live Dispatch Projected Route Line -->
<path class="animate-pulse" d="M 195 210 Q 230 160 280 120 T 320 85" fill="none" stroke="url(#routeGrad)" stroke-dasharray="8 6" stroke-linecap="round" stroke-width="6"></path>
</svg>
</div>
<!-- Floating Vehicle Marker (Meskel Square) -->
<div class="absolute top-[52%] left-[46%] -translate-x-1/2 -translate-y-1/2 z-10 flex flex-col items-center">
<div class="bg-primary text-on-primary px-2 py-0.5 rounded-full shadow-md text-[10px] font-bold tracking-tight mb-1 whitespace-nowrap">
        Meskel Sq • Dawit
      </div>
<div class="relative flex items-center justify-center">
<div class="w-12 h-12 rounded-full bg-primary/20 animate-ping absolute"></div>
<div class="w-9 h-9 rounded-full bg-primary flex items-center justify-center text-on-primary shadow-lg">
<span class="material-symbols-outlined text-[20px]">navigation</span>
</div>
</div>
</div>
<!-- Map Floating Tool Controls (Right edge) -->
<div class="absolute right-4 top-4 flex flex-col gap-2 z-10">
<button aria-label="Recenter" class="w-11 h-11 rounded-full bg-surface-container-lowest/90 backdrop-blur-md text-on-surface shadow-md flex items-center justify-center active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[22px]">my_location</span>
</button>
<button aria-label="Layers" class="w-11 h-11 rounded-full bg-surface-container-lowest/90 backdrop-blur-md text-on-surface shadow-md flex items-center justify-center active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[22px]">layers</span>
</button>
<button aria-label="Emergency SOS" class="w-11 h-11 rounded-full bg-error-container text-on-error-container shadow-md flex items-center justify-center active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[20px]">sos</span>
</button>
</div>
<!-- Pickup Pin Marker on Map -->
<div class="absolute top-[20%] right-[18%] z-10 flex items-center gap-1.5 bg-surface-container-lowest px-2 py-1 rounded-full shadow-lg">
<div class="w-3 h-3 rounded-full bg-tertiary"></div>
<span class="font-label-sm text-label-sm font-bold text-on-surface">Medhanealem (1.2 km)</span>
</div>
</div>
<!-- Incoming Job Offer Bottom Sheet / Modal (Persistent Driver Alert) -->
<div class="w-full bg-surface-container-lowest rounded-t-3xl shadow-[0_-8px_32px_rgba(15,23,42,0.15)] p-space-margin -mt-6 z-30 flex flex-col gap-space-sm relative">
<!-- Drag indicator / Top Handle -->
<div class="w-12 h-1.5 bg-surface-container-high rounded-full self-center mb-1"></div>
<!-- Header Row: Service Badge, Timer Ring & Gross Fare -->
<div class="flex items-center justify-between gap-space-sm">
<div class="flex flex-col gap-1 min-w-0">
<div class="flex items-center gap-space-xs">
<span class="bg-primary-container text-on-primary px-space-xs py-0.5 rounded-full font-label-sm text-label-sm uppercase tracking-wider font-bold">
            RIDE REQUEST • ECONOMY
          </span>
</div>
<div class="flex items-baseline gap-space-xs">
<span class="font-display-lg-mobile text-display-lg-mobile text-on-surface font-extrabold tracking-tight">240</span>
<span class="font-headline-sm text-headline-sm text-primary font-bold">ETB</span>
<span class="font-label-md text-label-md text-on-surface-variant font-medium">(Net ~204 ETB)</span>
</div>
</div>
<!-- Circular Countdown Timer Component -->
<div class="relative flex items-center justify-center shrink-0 w-14 h-14" id="timer-box">
<svg class="w-14 h-14 transform -rotate-90" viewbox="0 0 48 48">
<circle class="text-surface-container-high fill-none" cx="24" cy="24" r="20" stroke="currentColor" stroke-width="4"></circle>
<circle class="text-primary-container fill-none transition-all duration-1000 ease-linear" cx="24" cy="24" id="countdown-circle" r="20" stroke="currentColor" stroke-dasharray="125.6" stroke-dashoffset="0" stroke-linecap="round" stroke-width="4"></circle>
</svg>
<div class="absolute flex flex-col items-center justify-center leading-none">
<span class="font-headline-sm text-headline-sm text-on-surface font-extrabold" id="countdown-val">14</span>
<span class="text-[9px] text-on-surface-variant font-medium">sec</span>
</div>
</div>
</div>
<!-- Route Overview Card -->
<div class="bg-surface-container-low rounded-xl p-space-sm flex flex-col gap-space-sm">
<!-- Pickup Point -->
<div class="flex items-start gap-space-sm">
<div class="flex flex-col items-center mt-1">
<div class="w-3.5 h-3.5 rounded-full bg-tertiary flex items-center justify-center">
<div class="w-1.5 h-1.5 rounded-full bg-surface-container-lowest"></div>
</div>
<div class="w-0.5 h-8 bg-outline-variant my-1"></div>
<div class="w-3.5 h-3.5 rounded-sm bg-primary"></div>
</div>
<div class="flex flex-col flex-1 min-w-0 justify-between gap-space-xs">
<!-- Pickup details -->
<div class="flex flex-col">
<div class="flex items-center justify-between">
<span class="font-label-sm text-label-sm text-tertiary font-bold tracking-wider uppercase">PICKUP • 4 MIN AWAY</span>
<span class="font-label-md text-label-md text-on-surface-variant">1.2 km</span>
</div>
<span class="font-body-lg-medium text-body-lg-medium text-on-surface truncate">Bole Medhanealem</span>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Near Edna Mall taxi stand</span>
</div>
<!-- Dropoff details -->
<div class="flex flex-col pt-1">
<div class="flex items-center justify-between">
<span class="font-label-sm text-label-sm text-primary font-bold tracking-wider uppercase">DROPOFF • 16 MIN TRIP</span>
<span class="font-label-md text-label-md text-on-surface-variant">5.8 km</span>
</div>
<span class="font-body-lg-medium text-body-lg-medium text-on-surface truncate">Kazanchis, UNECA Gate 2</span>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Menelik II Avenue</span>
</div>
</div>
</div>
</div>
<!-- Passenger Info & Payment Method Tile -->
<div class="grid grid-cols-2 gap-space-xs">
<!-- Passenger Card -->
<div class="bg-surface-container rounded-lg p-space-xs flex items-center gap-space-xs">
<div class="w-10 h-10 rounded-full overflow-hidden shrink-0 bg-surface-dim">
<img class="w-full h-full object-cover" data-alt="Portrait photo of Ethiopian passenger Selamawit smiling warmly outdoors with soft natural sunlight wearing a cream linen top." src="https://lh3.googleusercontent.com/aida-public/AB6AXuBGNKffauvamWKs-GerJvA88L7Z27JVKubsuICMs_S4kcOHmOzUaWHOWr0bZPecHfUjDoANJCFnoakWrIRUfXs-IF3B_gaTNAlIdoySncYa_jUSqRd-zgGe0eYcPxB05JOG0XptpHL313xMNM5E66m8McVkpB9DPsxGur8G0MOMCRTOr4uOhx5ArcirglNexZf-aYE7F9piU0LYNsqfkAqQiooPoA9aOdYYdrSwQuPs_dHmljGKEyD18A"/>
</div>
<div class="flex flex-col min-w-0">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Selamawit B.</span>
<div class="flex items-center gap-1">
<span class="material-symbols-outlined text-[14px] text-amber-500" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-md text-label-md text-on-surface-variant font-semibold">4.95</span>
</div>
</div>
</div>
<!-- Payment & Security Card -->
<div class="bg-surface-container rounded-lg p-space-xs flex flex-col justify-center">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase">Payment Provider</span>
<div class="flex items-center gap-1.5 mt-0.5">
<span class="bg-secondary-fixed text-on-secondary-fixed font-label-sm text-label-sm px-2 py-0.5 rounded-full font-bold">
            telebirr
          </span>
<span class="font-label-sm text-label-sm text-tertiary font-bold flex items-center">
<span class="material-symbols-outlined text-[13px] mr-0.5">verified</span>Auto-Paid
          </span>
</div>
</div>
</div>
<!-- Quick Driver Safety & Comfort Chips -->
<div class="flex items-center justify-between text-on-surface-variant px-1">
<div class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px] text-tertiary">luggage</span>
<span class="font-label-md text-label-md">1 Small Bag</span>
</div>
<div class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px] text-primary">groups</span>
<span class="font-label-md text-label-md">1 Passenger</span>
</div>
<div class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px] text-amber-600">navigation</span>
<span class="font-label-md text-label-md">In-App Voice Nav</span>
</div>
</div>
<!-- Dual Actions (Reject & Large Affirmative Accept CTA) -->
<div class="flex items-center gap-space-sm pt-space-xs pb-space-xs">
<!-- Reject Button -->
<button class="h-14 px-space-lg rounded-xl bg-surface-container-high text-error font-headline-sm text-headline-sm flex items-center justify-center shrink-0 active:scale-95 transition-transform" id="btn-reject">
<span class="material-symbols-outlined mr-1 text-[20px]">close</span>
        Decline
      </button>
<!-- Glowing High-Contrast Accept Button -->
<button class="h-14 flex-1 rounded-xl bg-primary-container text-on-primary font-headline-sm text-headline-sm flex items-center justify-center gap-space-xs shadow-[0_4px_20px_rgba(24,82,232,0.4)] active:scale-[0.98] transition-transform" id="btn-accept">
<span class="material-symbols-outlined text-[24px]">electric_bolt</span>
<span>ACCEPT TRIP (240 ETB)</span>
</button>
</div>
</div>
</div>
<script>
  (function() {
    let timeLeft = 14;
    const totalTime = 14;
    const fullCircumference = 125.6; // 2 * pi * 20
    const timerElem = document.getElementById('countdown-val');
    const circleElem = document.getElementById('countdown-circle');
    const acceptBtn = document.getElementById('btn-accept');
    const rejectBtn = document.getElementById('btn-reject');

    const countdownInterval = setInterval(() => {
      timeLeft--;
      if (timerElem) {
        timerElem.textContent = Math.max(0, timeLeft);
      }
      if (circleElem) {
        const offset = fullCircumference * (1 - (timeLeft / totalTime));
        circleElem.style.strokeDashoffset = offset;
      }
      if (timeLeft <= 0) {
        clearInterval(countdownInterval);
        if (acceptBtn) {
          acceptBtn.disabled = true;
          acceptBtn.classList.remove('bg-primary-container');
          acceptBtn.classList.add('bg-surface-container-high', 'text-on-surface-variant');
          acceptBtn.innerHTML = '<span class="material-symbols-outlined mr-1">timer_off</span> Trip Expired';
        }
      }
    }, 1000);

    if (rejectBtn) {
      rejectBtn.addEventListener('click', () => {
        clearInterval(countdownInterval);
        rejectBtn.textContent = 'Declined';
        if (acceptBtn) acceptBtn.style.display = 'none';
      });
    }

    if (acceptBtn) {
      acceptBtn.addEventListener('click', () => {
        clearInterval(countdownInterval);
        acceptBtn.innerHTML = '<span class="material-symbols-outlined text-[22px] animate-spin mr-2">sync</span> Connecting to Passenger...';
        acceptBtn.classList.add('bg-tertiary', 'text-on-tertiary');
      });
    }

})();
</script></main></body></html>

<!-- ZemenGo - Super App Home (Addis Ababa) -->
<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/>
<title>ZemenGo - Super App Addis Ababa</title>
<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Tailwind Config -->
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brand: {
              50: '#EEF4FF',
              100: '#D9E6FF',
              200: '#BCD4FE',
              500: '#1852E8',
              600: '#1140C2',
              700: '#0C2F92',
            },
            slateCard: '#F8FAFC',
            darkNavy: '#0F172A',
            ethiopianGreen: '#009A44',
            telebirr: '#0072BC'
          },
          fontFamily: {
            sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Helvetica', 'Arial', 'sans-serif'],
          },
          boxShadow: {
            'soft': '0 8px 30px rgba(15, 23, 42, 0.06)',
            'float': '0 14px 38px rgba(24, 82, 232, 0.16)',
            'nav': '0 -6px 25px rgba(15, 23, 42, 0.05)',
          }
        }
      }
    }
  </script>
<!-- Custom Styles: General & UI polish -->
<style data-purpose="base-typography">
    body {
      -webkit-tap-highlight-color: transparent;
      user-select: none;
    }
    .no-scrollbar::-webkit-scrollbar {
      display: none;
    }
    .no-scrollbar {
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
  </style>
<!-- Custom Styles: Micro-interactions and Accents -->
<style data-purpose="interactive-styles">
    .press-effect:active {
      transform: scale(0.97);
      transition: transform 0.12s ease;
    }
    .pulse-ring {
      box-shadow: 0 0 0 0 rgba(24, 82, 232, 0.6);
      animation: pulseAnimation 2s infinite;
    }
    @keyframes pulseAnimation {
      0% {
        box-shadow: 0 0 0 0 rgba(24, 82, 232, 0.6);
      }
      70% {
        box-shadow: 0 0 0 10px rgba(24, 82, 232, 0);
      }
      100% {
        box-shadow: 0 0 0 0 rgba(24, 82, 232, 0);
      }
    }
  </style>
</head>
<body class="bg-slate-100 flex justify-center items-center min-h-screen text-darkNavy antialiased selection:bg-brand-100 selection:text-brand-600">
<!-- Mobile Wrapper with iOS aspect-ratio simulation -->
<main class="w-full max-w-[430px] min-h-screen sm:min-h-[880px] sm:h-[915px] bg-[#FAFBFD] sm:rounded-[44px] shadow-2xl overflow-y-auto no-scrollbar relative flex flex-col border-0 sm:border-[8px] sm:border-slate-800">
<!-- BEGIN: iOSStatusBar -->
<header class="sticky top-0 bg-[#FAFBFD]/90 backdrop-blur-md z-40 px-6 pt-3 pb-2 flex justify-between items-center text-xs font-semibold text-slate-800 tracking-tight">
<span>9:41</span>
<!-- Dynamic Island Indicator -->
<div class="hidden sm:block w-28 h-5 bg-black rounded-full mx-auto self-center"></div>
<div class="flex items-center gap-1.5">
<!-- Signal Strength -->
<svg class="w-3.5 h-3.5" fill="currentColor" viewbox="0 0 24 24">
<rect height="6" rx="1" width="3.5" x="2" y="16"></rect>
<rect height="10" rx="1" width="3.5" x="7.5" y="12"></rect>
<rect height="15" rx="1" width="3.5" x="13" y="7"></rect>
<rect height="20" rx="1" width="3.5" x="18.5" y="2"></rect>
</svg>
<!-- WiFi -->
<svg class="w-3.5 h-3.5" fill="currentColor" viewbox="0 0 24 24">
<path d="M12 4C7.31 4 3.07 5.9 0 8.98L12 21 24 8.98C20.93 5.9 16.69 4 12 4Z"></path>
</svg>
<!-- Battery -->
<svg class="w-5 h-3.5" fill="currentColor" viewbox="0 0 24 24">
<rect fill="none" height="14" rx="3" stroke="currentColor" stroke-width="2" width="18" x="2" y="5"></rect>
<rect height="10" rx="1.5" width="13" x="4" y="7"></rect>
<path d="M22 10V14" stroke="currentColor" stroke-linecap="round" stroke-width="2"></path>
</svg>
</div>
</header>
<!-- END: iOSStatusBar -->
<!-- BEGIN: AppHeader -->
<section class="px-5 pt-1 pb-3 flex flex-col gap-2" data-purpose="app-header">
<div class="flex items-center justify-between">
<!-- Hamburger Menu -->
<button aria-label="Open Navigation Menu" class="press-effect p-2 rounded-xl bg-white border border-slate-100 shadow-sm text-slate-700 hover:text-brand-500">
<svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M4 6h16M4 12h10M4 18h16" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</button>
<!-- Brand Title & Language Toggle -->
<div class="flex items-center gap-2">
<div class="flex items-center gap-1.5">
<div class="w-7 h-7 bg-brand-500 rounded-lg flex items-center justify-center text-white font-bold text-sm shadow-md shadow-brand-500/30">
              Z
            </div>
<span class="text-xl font-extrabold tracking-tight text-slate-900">Zemen<span class="text-brand-500">Go</span></span>
</div>
<!-- Amharic / English toggle pill -->
<button class="press-effect flex items-center gap-1 text-[11px] font-bold px-2 py-0.5 ml-1 bg-blue-50 text-brand-600 rounded-full border border-brand-100">
<span>EN</span>
<span class="text-slate-300">|</span>
<span class="text-slate-500 font-medium">አማ</span>
</button>
</div>
<!-- Notification Bell with Notification Badge -->
<button aria-label="Notifications" class="press-effect relative p-2 rounded-xl bg-white border border-slate-100 shadow-sm text-slate-700 hover:text-brand-500">
<svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
<span class="absolute top-1.5 right-1.5 w-2.5 h-2.5 bg-red-500 rounded-full ring-2 ring-white"></span>
</button>
</div>
<!-- Current Location Selector -->
<div class="flex items-center gap-1.5 pt-1">
<div class="flex items-center gap-1.5 bg-white py-1.5 px-3 rounded-full border border-slate-200/80 shadow-xs">
<svg class="w-3.5 h-3.5 text-brand-500 fill-brand-500" viewbox="0 0 20 20">
<path clip-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" fill-rule="evenodd"></path>
</svg>
<span class="text-xs font-semibold text-slate-800">Bole Medhanealem, Addis Ababa</span>
<svg class="w-3 h-3 text-slate-400 ml-0.5" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<path d="M19 9l-7 7-7-7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"></path>
</svg>
</div>
</div>
</section>
<!-- END: AppHeader -->
<!-- Scrollable Content Area -->
<div class="px-5 pb-28 space-y-5">
<!-- BEGIN: HeroServiceSwitcher -->
<!-- 3 Core Services in Ethiopian SuperApp: Ride, Food, Express Package -->
<section class="grid grid-cols-3 gap-3" data-purpose="service-switcher">
<!-- Service 1: Ride (Primary) -->
<div class="press-effect relative bg-white border-2 border-brand-500 rounded-2xl p-3 flex flex-col items-center justify-between shadow-soft hover:shadow-md cursor-pointer transition">
<div class="absolute -top-2.5 bg-brand-500 text-[9px] font-bold tracking-wider text-white uppercase px-2 py-0.5 rounded-full shadow-sm">
            Fast &amp; Safe
          </div>
<div class="w-12 h-12 mt-1 rounded-2xl bg-brand-50 flex items-center justify-center text-brand-500">
<svg class="w-7 h-7" fill="currentColor" viewbox="0 0 24 24">
<path d="M18.92 6.01C18.72 5.42 18.16 5 17.5 5H6.5c-.66 0-1.22.42-1.42 1.01L3 12v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.85 7h10.29l1.04 3H5.81l1.04-3zM19 17H5v-5h14v5z"></path>
<circle cx="7.5" cy="14.5" r="1.5"></circle>
<circle cx="16.5" cy="14.5" r="1.5"></circle>
</svg>
</div>
<div class="text-center mt-2">
<h3 class="text-sm font-bold text-slate-900">Ride</h3>
<p class="text-[10px] font-semibold text-brand-600">From 90 ETB</p>
</div>
</div>
<!-- Service 2: Food -->
<div class="press-effect relative bg-white border border-slate-100 rounded-2xl p-3 flex flex-col items-center justify-between shadow-soft hover:border-slate-300 cursor-pointer transition">
<div class="w-12 h-12 mt-1 rounded-2xl bg-amber-50 flex items-center justify-center text-amber-500">
<svg class="w-7 h-7" fill="currentColor" viewbox="0 0 24 24">
<path d="M12 2C8.13 2 5 5.13 5 9c0 2.38 1.19 4.47 3 5.74V17c0 .55.45 1 1 1h6c.55 0 1-.45 1-1v-2.26c1.81-1.27 3-3.36 3-5.74 0-3.87-3.13-7-7-7zm-1 18h2v2h-2v-2zM8.5 9c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5-.67 1.5-1.5 1.5-1.5-.67-1.5-1.5z"></path>
</svg>
</div>
<div class="text-center mt-2">
<h3 class="text-sm font-bold text-slate-800">Food</h3>
<p class="text-[10px] text-slate-500">Hot &amp; Fresh</p>
</div>
</div>
<!-- Service 3: Package / Delivery -->
<div class="press-effect relative bg-white border border-slate-100 rounded-2xl p-3 flex flex-col items-center justify-between shadow-soft hover:border-slate-300 cursor-pointer transition">
<div class="w-12 h-12 mt-1 rounded-2xl bg-emerald-50 flex items-center justify-center text-emerald-600">
<svg class="w-7 h-7" fill="currentColor" viewbox="0 0 24 24">
<path d="M20 7l-8-4-8 4 8 4 8-4zm-8 6l-7-3.5V17l7 4 7-4v-7.5L12 13z"></path>
</svg>
</div>
<div class="text-center mt-2">
<h3 class="text-sm font-bold text-slate-800">Package</h3>
<p class="text-[10px] text-slate-500">Door to Door</p>
</div>
</div>
</section>
<!-- END: HeroServiceSwitcher -->
<!-- BEGIN: SearchAndBookingCard -->
<section class="bg-white rounded-3xl p-4 shadow-soft border border-slate-100 space-y-3.5" data-purpose="booking-search">
<!-- Interactive search input button -->
<div class="press-effect flex items-center justify-between bg-slate-50 hover:bg-slate-100/80 border border-slate-200/90 rounded-2xl p-3 cursor-pointer transition">
<div class="flex items-center gap-3">
<div class="w-3.5 h-3.5 rounded-full bg-brand-500 pulse-ring flex items-center justify-center">
<div class="w-1.5 h-1.5 bg-white rounded-full"></div>
</div>
<span class="text-sm font-semibold text-slate-700">Where to in Addis Ababa?</span>
</div>
<!-- Voice/Microphone icon -->
<div class="p-1.5 rounded-lg bg-white border border-slate-200 text-slate-600 shadow-2xs">
<svg class="w-4 h-4 text-brand-500" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M19 11a7 7 0 01-7 7m0 0a7 7 0 01-7-7m7 7v4m0 0H8m4 0h4m-4-8a3 3 0 003-3V5a3 3 0 10-6 0v6a3 3 0 003 3z" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
</div>
<!-- Quick Destinations / Shortcuts -->
<div class="grid grid-cols-2 gap-2 pt-1">
<!-- Shortcut 1: CMC Home -->
<button class="press-effect flex items-center gap-2.5 p-2 rounded-xl bg-slate-50/80 hover:bg-slate-100 border border-slate-100 text-left">
<div class="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-slate-700 shadow-2xs">
<svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
<div class="overflow-hidden">
<p class="text-xs font-bold text-slate-800 truncate">Home (CMC)</p>
<span class="text-[10px] text-slate-400">18 min away</span>
</div>
</button>
<!-- Shortcut 2: Work Kazanchis -->
<button class="press-effect flex items-center gap-2.5 p-2 rounded-xl bg-slate-50/80 hover:bg-slate-100 border border-slate-100 text-left">
<div class="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-slate-700 shadow-2xs">
<svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
<div class="overflow-hidden">
<p class="text-xs font-bold text-slate-800 truncate">Work (Kazanchis)</p>
<span class="text-[10px] text-slate-400">12 min away</span>
</div>
</button>
<!-- Shortcut 3: Bole Airport -->
<button class="press-effect flex items-center gap-2.5 p-2 rounded-xl bg-slate-50/80 hover:bg-slate-100 border border-slate-100 text-left">
<div class="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-slate-700 shadow-2xs">
<svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
<div class="overflow-hidden">
<p class="text-xs font-bold text-slate-800 truncate">Bole Intl Airport</p>
<span class="text-[10px] text-slate-400">8 min away</span>
</div>
</button>
<!-- Shortcut 4: Mexico Square -->
<button class="press-effect flex items-center gap-2.5 p-2 rounded-xl bg-slate-50/80 hover:bg-slate-100 border border-slate-100 text-left">
<div class="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-slate-700 shadow-2xs">
<svg class="w-4 h-4 text-slate-700" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
<div class="overflow-hidden">
<p class="text-xs font-bold text-slate-800 truncate">Mexico Square</p>
<span class="text-[10px] text-slate-400">14 min away</span>
</div>
</button>
</div>
<!-- Prominent 'Book a Ride' Action Button -->
<button class="press-effect w-full bg-brand-500 hover:bg-brand-600 text-white font-semibold py-3.5 rounded-2xl flex items-center justify-center gap-2 shadow-float text-sm tracking-wide">
<span>Book Instant Ride</span>
<svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewbox="0 0 24 24">
<path d="M14 5l7 7m0 0l-7 7m7-7H3" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</button>
</section>
<!-- END: SearchAndBookingCard -->
<!-- BEGIN: ActiveDriverStatus -->
<!-- Mini Live Card showing on-the-way driver inspired by the RideFlow designs -->
<section class="bg-gradient-to-r from-slate-900 to-slate-800 rounded-3xl p-4 text-white shadow-soft relative overflow-hidden" data-purpose="active-ride-status">
<!-- Subtle background map mesh effect -->
<div class="absolute right-0 top-0 bottom-0 w-1/3 opacity-15 bg-[radial-gradient(#ffffff_1px,transparent_1px)] [background-size:8px_8px]"></div>
<div class="flex items-center justify-between mb-3">
<div class="flex items-center gap-2">
<span class="relative flex h-2.5 w-2.5">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500"></span>
</span>
<span class="text-xs font-medium text-emerald-400 tracking-wide uppercase">Driver Approaching</span>
</div>
<span class="text-xs font-bold bg-white/10 px-2 py-0.5 rounded-full text-slate-300">Arrival: 4 min</span>
</div>
<div class="flex items-center justify-between">
<div class="flex items-center gap-3">
<div class="w-11 h-11 rounded-2xl bg-brand-500/20 border border-brand-400/30 flex items-center justify-center text-white font-bold">
<!-- Driver Initials or Car Silhouette -->
<svg class="w-6 h-6 text-brand-300" fill="currentColor" viewbox="0 0 24 24">
<path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"></path>
</svg>
</div>
<div>
<h4 class="text-sm font-bold text-white">Dawit Haile <span class="text-xs font-normal text-amber-300">★ 4.9</span></h4>
<p class="text-xs text-slate-300">Toyota Vitz • <span class="font-mono text-slate-200">A-3 48291</span></p>
</div>
</div>
<button class="press-effect px-3 py-2 bg-brand-500 hover:bg-brand-600 rounded-xl text-xs font-semibold text-white shadow-md">
            View Live
          </button>
</div>
</section>
<!-- END: ActiveDriverStatus -->
<!-- BEGIN: LocalPaymentsPromoBanner -->
<!-- Highlight Ethiopian payment integrations: Telebirr & CBE Birr discount banner -->
<section class="relative overflow-hidden bg-gradient-to-br from-blue-600 to-indigo-700 rounded-3xl p-4 text-white shadow-soft" data-purpose="telebirr-promo">
<div class="flex justify-between items-start">
<div class="space-y-1 z-10 max-w-[70%]">
<span class="inline-block px-2 py-0.5 bg-yellow-400 text-slate-950 text-[10px] font-extrabold rounded-md uppercase tracking-wider">
              15% OFF
            </span>
<h4 class="text-base font-extrabold leading-snug">Pay with Telebirr or CBE Birr</h4>
<p class="text-xs text-blue-100">Save on your next 3 rides with coupon code: <span class="font-bold underline text-white">ADDIS15</span></p>
</div>
<!-- Payment Logo Badge -->
<div class="bg-white/10 backdrop-blur-sm p-2 rounded-2xl border border-white/20 flex flex-col items-center gap-1">
<div class="w-8 h-8 rounded-full bg-white text-blue-700 flex items-center justify-center font-black text-xs shadow">
              tb
            </div>
<span class="text-[9px] font-bold text-white uppercase tracking-tighter">CBE • Birr</span>
</div>
</div>
</section>
<!-- END: LocalPaymentsPromoBanner -->
<!-- BEGIN: PopularInAddis -->
<section class="space-y-3" data-purpose="popular-destinations">
<div class="flex items-center justify-between">
<h3 class="text-sm font-bold text-slate-900">Popular In Addis</h3>
<a class="text-xs font-semibold text-brand-600 hover:underline" href="#">See all</a>
</div>
<div class="flex gap-3 overflow-x-auto no-scrollbar py-1">
<!-- Item 1: Traditional Injera Restaurant -->
<div class="press-effect min-w-[145px] bg-white rounded-2xl p-2.5 border border-slate-100 shadow-soft flex flex-col gap-2">
<div class="w-full h-20 bg-amber-100 rounded-xl flex items-center justify-center text-amber-700 font-medium text-xs relative overflow-hidden">
<div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent"></div>
<span class="relative z-10 font-bold text-white text-xs drop-shadow">Kategna Resto</span>
</div>
<div>
<p class="text-xs font-bold text-slate-800 truncate">Kategna Bole</p>
<p class="text-[10px] text-slate-400">Ethiopian • 25 min</p>
</div>
</div>
<!-- Item 2: Coffee & Roastery -->
<div class="press-effect min-w-[145px] bg-white rounded-2xl p-2.5 border border-slate-100 shadow-soft flex flex-col gap-2">
<div class="w-full h-20 bg-rose-100 rounded-xl flex items-center justify-center text-rose-700 font-medium text-xs relative overflow-hidden">
<div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent"></div>
<span class="relative z-10 font-bold text-white text-xs drop-shadow">Tomoca Coffee</span>
</div>
<div>
<p class="text-xs font-bold text-slate-800 truncate">Tomoca Roastery</p>
<p class="text-[10px] text-slate-400">Coffee • 10 min</p>
</div>
</div>
<!-- Item 3: Bakery & Delight -->
<div class="press-effect min-w-[145px] bg-white rounded-2xl p-2.5 border border-slate-100 shadow-soft flex flex-col gap-2">
<div class="w-full h-20 bg-blue-100 rounded-xl flex items-center justify-center text-blue-700 font-medium text-xs relative overflow-hidden">
<div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent"></div>
<span class="relative z-10 font-bold text-white text-xs drop-shadow">Savor Bistro</span>
</div>
<div>
<p class="text-xs font-bold text-slate-800 truncate">Savor Bole</p>
<p class="text-[10px] text-slate-400">Burgers &amp; Pasta • 15 min</p>
</div>
</div>
</div>
</section>
<!-- END: PopularInAddis -->
<!-- BEGIN: RecentTripsChips -->
<section class="space-y-2" data-purpose="recent-trips-section">
<h3 class="text-xs font-bold uppercase tracking-wider text-slate-400">Recent Trips</h3>
<div class="bg-white rounded-2xl p-3 border border-slate-100 shadow-soft flex items-center justify-between">
<div class="flex items-center gap-3">
<div class="w-9 h-9 rounded-xl bg-slate-100 flex items-center justify-center text-slate-600">
<svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</div>
<div>
<p class="text-xs font-bold text-slate-800">Bole Atlas → Edna Mall</p>
<p class="text-[10px] text-slate-400">Yesterday • Toyota Corolla • 120 ETB</p>
</div>
</div>
<button class="press-effect text-xs font-bold text-brand-600 bg-brand-50 hover:bg-brand-100 px-3 py-1.5 rounded-xl transition">
            Rebook
          </button>
</div>
</section>
<!-- END: RecentTripsChips -->
</div>
<!-- BEGIN: BottomNavigation -->
<nav class="sticky bottom-0 mt-auto bg-white/95 backdrop-blur-md border-t border-slate-100 px-6 py-2.5 flex justify-between items-center z-50 shadow-nav" data-purpose="mobile-navbar">
<!-- Nav Item 1: Home (Active) -->
<button class="flex flex-col items-center gap-1 text-brand-500 font-semibold focus:outline-none">
<div class="p-1 rounded-xl bg-brand-50">
<svg class="w-5 h-5" fill="currentColor" viewbox="0 0 24 24">
<path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"></path>
</svg>
</div>
<span class="text-[10px]">Home</span>
</button>
<!-- Nav Item 2: Activity / Trips -->
<button class="flex flex-col items-center gap-1 text-slate-400 hover:text-slate-600 font-medium focus:outline-none transition">
<div class="p-1">
<svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
<span class="text-[10px]">Activity</span>
</button>
<!-- Nav Item 3: Wallet (With ETB balance indicator) -->
<button class="flex flex-col items-center gap-1 text-slate-400 hover:text-slate-600 font-medium focus:outline-none transition">
<div class="p-1 relative">
<svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
<span class="absolute 0 top-0.5 right-0.5 w-2 h-2 bg-emerald-500 rounded-full"></span>
</div>
<span class="text-[10px]">Wallet</span>
</button>
<!-- Nav Item 4: Account / Profile -->
<button class="flex flex-col items-center gap-1 text-slate-400 hover:text-slate-600 font-medium focus:outline-none transition">
<div class="p-1">
<svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24">
<path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
<span class="text-[10px]">Profile</span>
</button>
</nav>
<!-- END: BottomNavigation -->
<!-- iOS Home Indicator bar -->
<div class="w-32 h-1 bg-slate-300 rounded-full mx-auto my-1.5 mb-2 self-center shrink-0"></div>
</main>
<!-- BEGIN: InteractiveScript -->
<script data-purpose="lightweight-interactions">
    // Add lightweight feedback on button presses
    document.querySelectorAll('.press-effect').forEach(btn => {
      btn.addEventListener('click', () => {
        btn.classList.add('opacity-90');
        setTimeout(() => btn.classList.remove('opacity-90'), 150);
      });
    });
  </script>
<!-- END: InteractiveScript -->
</body></html>

<!-- ZemenGo - Live Driver Tracking -->
<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/>
<title>RideFlow - Driver is on the way</title>
<!-- Tailwind CSS v3 with Plugins -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brand: {
              50: '#eff6ff',
              100: '#dbeafe',
              500: '#2563eb',
              600: '#1d4ed8',
              700: '#1e40af'
            }
          },
          fontFamily: {
            sans: ['-apple-system', 'BlinkMacSystemFont', '"SF Pro Text"', '"SF Pro Display"', 'Roboto', 'Helvetica', 'Arial', 'sans-serif']
          }
        }
      }
    }
  </script>
<style data-purpose="custom-animations">
    @keyframes pulse-ring {
      0% {
        transform: scale(0.7);
        opacity: 0.8;
      }
      80%, 100% {
        transform: scale(2.4);
        opacity: 0;
      }
    }
    .pulse-ring-anim {
      animation: pulse-ring 2.2s cubic-bezier(0.215, 0.61, 0.355, 1) infinite;
    }
    /* Smooth iOS momentum scrolling */
    .ios-scroll {
      -webkit-overflow-scrolling: touch;
    }
    /* Hide scrollbar */
    .no-scrollbar::-webkit-scrollbar {
      display: none;
    }
    .no-scrollbar {
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
  </style>
</head>
<body class="bg-slate-900 flex justify-center items-center min-h-screen p-0 sm:p-4 text-slate-800 antialiased selection:bg-blue-500 selection:text-white">
<!-- BEGIN: PhoneContainer -->
<!-- Mimics an iPhone 15 Pro form factor matching the mobile snapshot presentation -->
<div class="relative w-full max-w-[412px] h-[100dvh] sm:h-[844px] bg-slate-100 sm:rounded-[48px] overflow-hidden shadow-2xl flex flex-col border border-slate-800/40" data-purpose="mobile-viewport-shell">
<!-- BEGIN: DynamicIslandAndStatusBar -->
<header class="absolute top-0 inset-x-0 z-50 pt-3 px-7 flex justify-between items-center text-slate-900 pointer-events-none select-none" data-purpose="ios-status-bar">
<!-- Time -->
<span class="text-xs font-semibold tracking-tight">9:41</span>
<!-- iOS Dynamic Island Notch -->
<div class="w-28 h-6 bg-black rounded-full mx-auto -mt-1 flex items-center justify-between px-2 shadow-sm">
<div class="w-2.5 h-2.5 rounded-full bg-slate-950 border border-slate-800/80"></div>
<div class="w-2.5 h-2.5 rounded-full bg-blue-950/60 ring-1 ring-blue-500/30"></div>
</div>
<!-- Cellular, WiFi, Battery Icons -->
<div class="flex items-center space-x-1.5 text-slate-900">
<svg class="w-3.5 h-3.5 fill-current" viewbox="0 0 24 24"><path d="M12 3c-4.97 0-9 4.03-9 9 0 2.12.74 4.07 1.97 5.61L4.35 18.25A10.97 10.97 0 0 1 1 12C1 5.92 5.92 1 12 1s11 4.92 11 11c0 2.33-.73 4.49-1.97 6.27l-.62-.62A9.97 9.97 0 0 0 21 12c0-4.97-4.03-9-9-9zm0 4c-2.76 0-5 2.24-5 5 0 1.25.46 2.4 1.22 3.28l.71-.71A3.988 3.988 0 0 1 8 12c0-2.21 1.79-4 4-4s4 1.79 4 4c0 1.05-.41 2.01-1.07 2.72l.71.71C16.48 14.47 17 13.3 17 12c0-2.76-2.24-5-5-5zm0 4c-.55 0-1 .45-1 1 0 .28.11.53.29.71.18.18.43.29.71.29s.53-.11.71-.29c.18-.18.29-.43.29-.71 0-.55-.45-1-1-1z"></path></svg>
<svg class="w-3 h-3 fill-current" viewbox="0 0 24 24"><path d="M12 4C7.31 4 3.07 5.9 0 8.98L12 21 24 8.98A17.88 17.88 0 0 0 12 4z"></path></svg>
<div class="w-5 h-2.5 border border-slate-800 rounded-sm p-0.5 flex items-center">
<div class="h-full w-full bg-slate-900 rounded-[1px]"></div>
</div>
</div>
</header>
<!-- END: DynamicIslandAndStatusBar -->
<!-- BEGIN: TopNavigationHeader -->
<nav class="absolute top-10 inset-x-0 z-40 px-4 py-2 flex items-center justify-between" data-purpose="top-navigation">
<!-- Dismiss / Minimize Button -->
<button aria-label="Minimize Ride Screen" class="w-10 h-10 rounded-full bg-white/95 shadow-md backdrop-blur-md flex items-center justify-center text-slate-700 active:scale-95 transition-transform hover:bg-white">
<svg class="w-5 h-5 stroke-slate-800" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" viewbox="0 0 24 24">
<line x1="18" x2="6" y1="6" y2="18"></line>
<line x1="6" x2="18" y1="6" y2="18"></line>
</svg>
</button>
<!-- Center Title -->
<h1 class="text-sm font-semibold tracking-wide text-slate-800 bg-white/90 backdrop-blur-md px-3.5 py-1.5 rounded-full shadow-sm">
        Driver is on the way
      </h1>
<!-- Context Menu Button -->
<button aria-label="More options" class="w-10 h-10 rounded-full bg-white/95 shadow-md backdrop-blur-md flex items-center justify-center text-slate-700 active:scale-95 transition-transform hover:bg-white">
<svg class="w-5 h-5 text-slate-700" fill="currentColor" viewbox="0 0 24 24">
<circle cx="5" cy="12" r="2"></circle>
<circle cx="12" cy="12" r="2"></circle>
<circle cx="19" cy="12" r="2"></circle>
</svg>
</button>
</nav>
<!-- END: TopNavigationHeader -->
<!-- BEGIN: InteractiveMapSection -->
<main class="relative flex-1 w-full overflow-hidden bg-[#e5ecf0]" data-purpose="map-canvas-container">
<!-- Map Graphic SVG representing Central Addis Ababa (Meskel Sq, Bole Rd, Kazanchis) -->
<svg class="absolute inset-0 w-full h-full object-cover select-none" preserveaspectratio="xMidYMid slice" viewbox="0 0 400 650" xmlns="http://www.w3.org/2000/svg">
<defs>
<lineargradient id="routeGradient" x1="0%" x2="100%" y1="0%" y2="100%">
<stop offset="0%" stop-color="#2563eb"></stop>
<stop offset="100%" stop-color="#3b82f6"></stop>
</lineargradient>
<filter height="140%" id="routeGlow" width="140%" x="-20%" y="-20%">
<fedropshadow dx="0" dy="4" flood-color="#2563eb" flood-opacity="0.4" stddeviation="4"></fedropshadow>
</filter>
</defs>
<!-- Base Landmass -->
<rect fill="#f1f5f9" height="650" width="400"></rect>
<!-- Green Parks & Open Spaces in Addis Ababa -->
<!-- Africa Park / Kazanchis Greens -->
<path d="M 270 120 C 310 130 360 170 380 230 C 370 290 320 310 280 270 C 250 240 240 180 270 120 Z" fill="#d1fae5" opacity="0.8"></path>
<text fill="#059669" font-family="sans-serif" font-size="9" font-weight="600" letter-spacing="0.5" opacity="0.7" x="315" y="215">AFRICA PARK</text>
<!-- Meskel Flower / Railway buffer green -->
<path d="M 20 380 C 70 390 110 440 90 510 C 60 520 20 490 10 440 Z" fill="#dcfce7" opacity="0.9"></path>
<text fill="#16a34a" font-family="sans-serif" font-size="8" font-weight="600" opacity="0.6" x="32" y="450">BEKLO BET</text>
<!-- Secondary Urban Blocks -->
<path d="M 40 140 L 140 160 L 130 260 L 30 230 Z" fill="#e2e8f0" opacity="0.6"></path>
<path d="M 160 120 L 240 130 L 230 210 L 150 200 Z" fill="#e2e8f0" opacity="0.5"></path>
<path d="M 120 290 L 220 300 L 205 380 L 100 370 Z" fill="#e2e8f0" opacity="0.6"></path>
<path d="M 220 380 L 330 400 L 310 500 L 200 470 Z" fill="#e2e8f0" opacity="0.5"></path>
<!-- Minor Connecting Streets -->
<g opacity="0.9" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3">
<!-- Kazanchis streets -->
<line x1="160" x2="260" y1="90" y2="105"></line>
<line x1="220" x2="220" y1="100" y2="220"></line>
<line x1="30" x2="160" y1="200" y2="220"></line>
<line x1="70" x2="90" y1="130" y2="290"></line>
<line x1="180" x2="290" y1="260" y2="275"></line>
<line x1="140" x2="260" y1="360" y2="380"></line>
<line x1="80" x2="210" y1="460" y2="480"></line>
<line x1="260" x2="360" y1="450" y2="465"></line>
</g>
<!-- Major Arterial Roads -->
<!-- Churchill / Stadium cross connection -->
<path d="M -20 180 Q 90 200 170 230" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-width="7"></path>
<!-- Bole Road (Airport Express Corridor) -->
<path d="M 170 230 L 340 590" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-width="10"></path>
<!-- Menelik II Avenue to Meskel Sq -->
<path d="M 195 40 L 170 230" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-width="9"></path>
<!-- Meskel Square Roundabout / Hub Plaza -->
<circle cx="170" cy="230" fill="#ffffff" r="30" stroke="#cbd5e1" stroke-width="2"></circle>
<circle cx="170" cy="230" fill="#f8fafc" r="16"></circle>
<text fill="#64748b" font-family="sans-serif" font-size="7" font-weight="700" text-anchor="middle" x="170" y="233">MESKEL SQ</text>
<!-- Road Labels -->
<text fill="#94a3b8" font-family="sans-serif" font-size="8" font-weight="600" letter-spacing="1" transform="rotate(64 280 440)" x="280" y="440">BOLE ROAD</text>
<text fill="#94a3b8" font-family="sans-serif" font-size="7" font-weight="600" transform="rotate(-82 185 140)" x="185" y="140">MENELIK II AVE</text>
<text fill="#94a3b8" font-family="sans-serif" font-size="7" font-weight="600" x="60" y="205">KAZANCHIS</text>
<!-- Active Trip Polyline (Glowing Route from Bole toward Meskel Sq / Pickup) -->
<!-- Driver Path: Bole Road -> Turn into Bambis / Meskel route -->
<path d="M 305 515 L 255 410 L 210 330 L 178 285 L 140 310" fill="none" filter="url(#routeGlow)" stroke="#2563eb" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"></path>
<path d="M 305 515 L 255 410 L 210 330 L 178 285 L 140 310" fill="none" stroke="#60a5fa" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"></path>
<!-- User Pickup Location Marker (Pulsing Pin at Bambis / Meskel) -->
<g transform="translate(140, 310)">
<!-- Pulsing Radar Rings -->
<circle class="pulse-ring-anim" cx="0" cy="0" fill="#3b82f6" r="22"></circle>
<circle cx="0" cy="0" fill="#60a5fa" opacity="0.3" r="14"></circle>
<circle cx="0" cy="0" fill="#2563eb" r="8" stroke="#ffffff" stroke-width="2.5"></circle>
<circle cx="0" cy="0" fill="#ffffff" r="3"></circle>
<!-- Label Tooltip -->
<rect fill="#1e293b" height="20" rx="10" width="84" x="-42" y="-32"></rect>
<polygon fill="#1e293b" points="-4,-12 4,-12 0,-8"></polygon>
<text fill="#ffffff" font-family="sans-serif" font-size="8.5" font-weight="600" text-anchor="middle" x="0" y="-19">Your Pickup</text>
</g>
<!-- Moving Driver Car Icon Marker along Bole Corridor -->
<g transform="translate(255, 410) rotate(-28)">
<!-- Car Shadow -->
<ellipse cx="0" cy="2" fill="#0f172a" opacity="0.25" rx="13" ry="24"></ellipse>
<!-- Car Body (Toyota Corolla Quest Shape) -->
<rect fill="#ffffff" height="40" rx="6" stroke="#cbd5e1" stroke-width="1.5" width="20" x="-10" y="-20"></rect>
<!-- Windshields & Glass Roof -->
<rect fill="#1e293b" height="15" rx="3" width="16" x="-8" y="-9"></rect>
<!-- Front Windshield angle -->
<path d="M -7 -6 L 7 -6 L 8 0 L -8 0 Z" fill="#38bdf8" opacity="0.85"></path>
<!-- Rear Windshield -->
<path d="M -7 4 L 7 4 L 6 8 L -6 8 Z" fill="#38bdf8" opacity="0.6"></path>
<!-- Headlights -->
<circle cx="-7" cy="-19" fill="#fef08a" r="1.5"></circle>
<circle cx="7" cy="-19" fill="#fef08a" r="1.5"></circle>
<!-- Taillights -->
<circle cx="-7" cy="19" fill="#ef4444" r="1.5"></circle>
<circle cx="7" cy="19" fill="#ef4444" r="1.5"></circle>
</g>
</svg>
<!-- BEGIN: ETACardOverlay -->
<!-- Floating Top Card directly under Header -->
<section class="absolute top-20 inset-x-4 z-30" data-purpose="eta-card-overlay">
<div class="bg-white/95 backdrop-blur-md rounded-2xl p-3.5 shadow-xl shadow-slate-900/10 border border-slate-100 flex items-center justify-between">
<!-- Left: Big Bold Arrival Time -->
<div class="flex flex-col pr-3 border-r border-slate-100">
<span class="text-[11px] font-medium text-slate-500 tracking-tight">Arrival in</span>
<div class="flex items-baseline space-x-1">
<span class="text-3xl font-extrabold text-slate-900 tracking-tight">3</span>
<span class="text-xs font-semibold text-slate-700">min</span>
</div>
<span class="text-[10px] text-emerald-600 font-medium flex items-center gap-0.5 mt-0.5">
<span class="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse"></span>
              On schedule
            </span>
</div>
<!-- Right: Car Model, Plate & Thumbnail -->
<div class="flex items-center pl-3 flex-1 justify-between">
<div class="flex flex-col">
<h2 class="text-xs font-bold text-slate-900 leading-tight">Toyota Corolla Quest</h2>
<span class="text-[11px] text-slate-500 font-medium">White</span>
<div class="mt-1 inline-flex items-center px-1.5 py-0.5 rounded bg-slate-100 border border-slate-300/80 text-[10px] font-mono font-bold text-slate-800 tracking-wider">
                Code 3 - A42981 ET
              </div>
</div>
<!-- Clean Vector Car Illustration -->
<div class="w-16 h-10 flex-shrink-0 flex items-center justify-center">
<svg class="w-full h-auto drop-shadow-sm" fill="none" viewbox="0 0 120 60" xmlns="http://www.w3.org/2000/svg">
<!-- Car Body Silhouette (Sedan) -->
<path d="M 8 36 C 8 32 12 28 20 28 L 36 28 L 52 14 C 55 11 60 10 68 10 L 90 10 C 97 10 104 15 107 22 L 112 30 C 117 31 119 34 119 38 L 119 44 C 119 46 117 48 115 48 L 105 48 C 105 41 99 36 92 36 C 85 36 79 41 79 48 L 41 48 C 41 41 35 36 28 36 C 21 36 15 41 15 48 L 5 48 C 3 48 1 46 1 44 L 1 38 C 1 36 4 36 8 36 Z" fill="#e2e8f0" stroke="#94a3b8" stroke-width="1.5"></path>
<!-- Windows -->
<path d="M 40 26 L 53 14 L 69 14 L 69 26 Z" fill="#0284c7" opacity="0.8"></path>
<path d="M 72 14 L 88 14 C 93 14 98 18 101 24 L 102 26 L 72 26 Z" fill="#0284c7" opacity="0.8"></path>
<!-- Front & Rear Wheels -->
<circle cx="28" cy="46" fill="#1e293b" r="9"></circle>
<circle cx="28" cy="46" fill="#94a3b8" r="4"></circle>
<circle cx="92" cy="46" fill="#1e293b" r="9"></circle>
<circle cx="92" cy="46" fill="#94a3b8" r="4"></circle>
<!-- Highlights -->
<path d="M 12 36 L 112 36" stroke="#ffffff" stroke-linecap="round" stroke-width="1.5"></path>
<circle cx="115" cy="33" fill="#fef08a" r="2.5"></circle>
</svg>
</div>
</div>
</div>
</section>
<!-- END: ETACardOverlay -->
<!-- BEGIN: FloatingMapControls -->
<aside class="absolute right-4 bottom-72 z-20 flex flex-col space-y-2.5" data-purpose="map-floating-controls">
<!-- Traffic toggle button -->
<button aria-label="Toggle Live Traffic" class="w-10 h-10 rounded-full bg-white shadow-lg border border-slate-100 flex items-center justify-center text-slate-700 active:scale-95 transition-transform hover:bg-slate-50">
<svg class="w-5 h-5 text-amber-500" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewbox="0 0 24 24">
<path d="M5 18v-6a7 7 0 0 1 14 0v6"></path>
<circle cx="12" cy="7" r="1"></circle>
<path d="M12 18v-3"></path>
<circle cx="8" cy="18" r="3"></circle>
<circle cx="16" cy="18" r="3"></circle>
</svg>
</button>
<!-- Recenter map button -->
<button aria-label="Recenter on current location" class="w-10 h-10 rounded-full bg-white shadow-lg border border-slate-100 flex items-center justify-center text-slate-700 active:scale-95 transition-transform hover:bg-slate-50">
<svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2" viewbox="0 0 24 24">
<circle cx="12" cy="12" r="7"></circle>
<line x1="12" x2="12" y1="2" y2="5"></line>
<line x1="12" x2="12" y1="19" y2="22"></line>
<line x1="2" x2="5" y1="12" y2="12"></line>
<line x1="19" x2="22" y1="12" y2="12"></line>
</svg>
</button>
</aside>
<!-- END: FloatingMapControls -->
</main>
<!-- END: InteractiveMapSection -->
<!-- BEGIN: BottomDriverModalCard -->
<!-- Lower floating sheet presenting Driver Credentials, Addis Ababa Security & Actions -->
<section class="relative z-40 bg-white rounded-t-3xl shadow-[0_-8px_30px_rgba(0,0,0,0.12)] border-t border-slate-100 px-5 pt-3 pb-6 flex flex-col" data-purpose="driver-bottom-sheet">
<!-- Drag Handle Pill -->
<div class="w-10 h-1 bg-slate-300 rounded-full mx-auto mb-3"></div>
<!-- Driver Identification Card -->
<div class="flex items-center justify-between">
<div class="flex items-center space-x-3.5">
<!-- Avatar with Online Ring -->
<div class="relative">
<img alt="Dawit Tadesse profile photo" class="w-13 h-13 w-12 h-12 rounded-full object-cover border-2 border-white shadow-md" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAbp0DqHgd_6q9pf0v6SIxTn4sfee5OBjKz6VF0kYicIaxlGL2TmstxnIPkzkJePX6dxGcQ1SO_gB83nHnUl_QpiiaZjVU0V-m1vkYHQnQaRQp1YnxMtmvdELxJaaRAwMJB4A5SQXj5hzravI_X-WKZSE_jcUBOwv34AppjMURA9B0pwOJe8eDf_j4-hAsgMAckH8SN5DF6eo1Ieah2pl9OhxPiqPcrVbKpFbTrV4zK1Vx-nNKZqEL_KA"/>
<div class="absolute -bottom-0.5 -right-0.5 w-4 h-4 rounded-full bg-emerald-500 border-2 border-white flex items-center justify-center">
<svg class="w-2.5 h-2.5 text-white" fill="none" stroke="currentColor" stroke-width="3" viewbox="0 0 24 24">
<polyline points="20 6 9 17 4 12"></polyline>
</svg>
</div>
</div>
<!-- Driver Name & Rating -->
<div>
<div class="flex items-center space-x-1.5">
<h2 class="text-base font-bold text-slate-900 leading-snug">Dawit Tadesse</h2>
<div class="flex items-center bg-amber-50 px-1.5 py-0.5 rounded text-[11px] font-bold text-amber-700">
<svg class="w-3 h-3 text-amber-500 fill-current mr-0.5" viewbox="0 0 20 20">
<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
</svg>
<span>4.9</span>
</div>
</div>
<p class="text-xs text-slate-500 font-medium">1,240 completed trips</p>
</div>
</div>
<!-- Telebirr & Regulatory Addis Verification Badge -->
<div class="flex flex-col items-end">
<span class="inline-flex items-center px-2 py-1 rounded-full text-[10px] font-semibold bg-blue-50 text-blue-700 border border-blue-200">
<svg class="w-2.5 h-2.5 mr-1 text-blue-600 fill-current" viewbox="0 0 20 20">
<path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
</svg>
            Telebirr Verified
          </span>
<span class="text-[10px] text-slate-400 mt-1 font-medium">Code 3 Certified</span>
</div>
</div>
<!-- Quick Action Buttons Row (Message, Call, Share Trip, Cancel) -->
<nav aria-label="Trip communication and safety actions" class="grid grid-cols-4 gap-3 mt-4 pt-3 border-t border-slate-100" data-purpose="quick-actions-bar">
<!-- 1. Message Action -->
<button class="flex flex-col items-center group focus:outline-none">
<div class="w-12 h-12 rounded-full bg-blue-50 text-blue-600 flex items-center justify-center transition group-hover:bg-blue-600 group-hover:text-white group-active:scale-95">
<svg class="w-5 h-5 fill-none stroke-current" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewbox="0 0 24 24">
<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
</svg>
</div>
<span class="text-[11px] font-medium text-slate-600 mt-1.5 group-hover:text-blue-600">Message</span>
</button>
<!-- 2. Phone Call Action -->
<button class="flex flex-col items-center group focus:outline-none">
<div class="w-12 h-12 rounded-full bg-blue-50 text-blue-600 flex items-center justify-center transition group-hover:bg-blue-600 group-hover:text-white group-active:scale-95">
<svg class="w-5 h-5 fill-none stroke-current" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewbox="0 0 24 24">
<path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
</svg>
</div>
<span class="text-[11px] font-medium text-slate-600 mt-1.5 group-hover:text-blue-600">Call</span>
</button>
<!-- 3. Share Trip Action -->
<button class="flex flex-col items-center group focus:outline-none">
<div class="w-12 h-12 rounded-full bg-blue-50 text-blue-600 flex items-center justify-center transition group-hover:bg-blue-600 group-hover:text-white group-active:scale-95">
<svg class="w-5 h-5 fill-none stroke-current" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewbox="0 0 24 24">
<circle cx="18" cy="5" r="3"></circle>
<circle cx="6" cy="12" r="3"></circle>
<circle cx="18" cy="19" r="3"></circle>
<line x1="8.59" x2="15.42" y1="13.51" y2="17.49"></line>
<line x1="15.41" x2="8.59" y1="6.51" y2="10.49"></line>
</svg>
</div>
<span class="text-[11px] font-medium text-slate-600 mt-1.5 group-hover:text-blue-600">Share Trip</span>
</button>
<!-- 4. Cancel Action -->
<button class="flex flex-col items-center group focus:outline-none">
<div class="w-12 h-12 rounded-full bg-rose-50 text-rose-600 flex items-center justify-center transition group-hover:bg-rose-600 group-hover:text-white group-active:scale-95">
<svg class="w-5 h-5 fill-none stroke-current" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2" viewbox="0 0 24 24">
<line x1="18" x2="6" y1="6" y2="18"></line>
<line x1="6" x2="18" y1="6" y2="18"></line>
</svg>
</div>
<span class="text-[11px] font-medium text-rose-600 mt-1.5">Cancel</span>
</button>
</nav>
<!-- BEGIN: SafetyShieldBanner -->
<footer class="mt-4 bg-slate-50 border border-slate-200/70 rounded-xl px-3 py-2 flex items-center space-x-2.5" data-purpose="safety-banner">
<div class="w-6 h-6 rounded-full bg-blue-600/10 flex items-center justify-center flex-shrink-0 text-blue-600">
<svg class="w-3.5 h-3.5 fill-current" viewbox="0 0 20 20">
<path clip-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
</svg>
</div>
<p class="text-[11px] text-slate-600 font-medium leading-tight">
          Share ride details with family for added safety in Addis Ababa.
        </p>
</footer>
<!-- END: SafetyShieldBanner -->
<!-- iOS Home Indicator -->
<div class="w-32 h-1 bg-slate-900/30 rounded-full mx-auto mt-4 mb-0.5"></div>
</section>
<!-- END: BottomDriverModalCard -->
</div>
<!-- END: PhoneContainer -->
<!-- BEGIN: InteractiveSimulationScript -->
<script data-purpose="driver-eta-simulation">
    document.addEventListener('DOMContentLoaded', () => {
      // Gentle vibration feedback on button touch for mobile browsers support
      const buttons = document.querySelectorAll('button');
      buttons.forEach(btn => {
        btn.addEventListener('click', () => {
          if ('vibrate' in navigator) {
            navigator.vibrate(15);
          }
        });
      });
    });
  </script>
<!-- END: InteractiveSimulationScript -->
</body></html>

<!-- ZemenGo - Ride Options & Booking -->
<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/>
<title>RideFlow - Ride Options</title>
<!-- Tailwind CSS v3 -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brand: {
              blue: '#2563EB',
              darkBlue: '#1D4ED8',
              lightBlue: '#EFF6FF',
              accent: '#059669',
            },
            telebirr: '#0072BC'
          },
          fontFamily: {
            sans: ['-apple-system', 'BlinkMacSystemFont', '"SF Pro Text"', '"SF Pro Display"', 'Segoe UI', 'Roboto', 'Helvetica', 'Arial', 'sans-serif'],
          }
        }
      }
    }
  </script>
<!-- Custom Styling for Mobile Container and SVG Details -->
<style data-purpose="mobile-layout">
    body {
      -webkit-tap-highlight-color: transparent;
      user-select: none;
      background-color: #0f172a;
    }
    /* Hide scrollbars while allowing smooth touch scroll */
    .no-scrollbar::-webkit-scrollbar {
      display: none;
    }
    .no-scrollbar {
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
  </style>
</head>
<body class="flex justify-center items-center min-h-screen p-0 sm:p-4 text-slate-800 antialiased font-sans">
<!-- BEGIN: PhoneShellContainer -->
<!-- Represents an iPhone mobile device frame -->
<div class="relative w-full max-w-[412px] h-[890px] bg-slate-50 sm:rounded-[48px] shadow-2xl overflow-hidden flex flex-col border border-slate-700/20 sm:ring-8 sm:ring-slate-900/60" data-purpose="mobile-viewport">
<!-- BEGIN: iOSStatusBar -->
<div class="relative z-30 pt-3 px-7 flex justify-between items-center text-xs font-semibold text-slate-800 select-none bg-transparent">
<span>9:41</span>
<!-- Dynamic Island / Sensor Notch Simulation -->
<div class="w-28 h-4 bg-black rounded-full mx-auto -mt-1 shadow-inner"></div>
<div class="flex items-center space-x-1.5">
<!-- Cellular Signal Icon -->
<svg class="w-3.5 h-3.5 fill-current" viewbox="0 0 24 24">
<path d="M2 17h3v4H2v-4zm5-4h3v8H7v-8zm5-4h3v12h-3V9zm5-4h3v16h-3V5z"></path>
</svg>
<!-- Wifi Icon -->
<svg class="w-3.5 h-3.5 fill-current" viewbox="0 0 24 24">
<path d="M12 4C7.31 4 3.07 5.9 0 8.98L12 21 24 8.98C20.93 5.9 16.69 4 12 4z"></path>
</svg>
<!-- Battery Icon -->
<div class="w-5 h-2.5 border border-slate-800 rounded-sm p-0.5 flex items-center">
<div class="h-full bg-slate-800 rounded-2xs w-3/4"></div>
</div>
</div>
</div>
<!-- END: iOSStatusBar -->
<!-- BEGIN: TopNavigationBar -->
<header class="relative z-20 px-4 py-2.5 flex items-center justify-between bg-white/95 backdrop-blur border-b border-slate-100">
<!-- Back Chevron Button -->
<button aria-label="Go Back" class="w-9 h-9 rounded-full flex items-center justify-center text-slate-700 hover:bg-slate-100 active:scale-95 transition-all">
<svg class="w-5 h-5 stroke-[2.5]" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<path d="M15 19l-7-7 7-7" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</button>
<!-- Screen Title -->
<div class="text-center">
<h1 class="text-base font-bold text-slate-900 tracking-tight">Select Ride</h1>
<p class="text-[11px] font-medium text-slate-500">RideFlow • Addis Ababa</p>
</div>
<!-- Help / Support Button -->
<button aria-label="Support Help" class="w-9 h-9 rounded-full flex items-center justify-center text-slate-600 hover:bg-slate-100 active:scale-95 transition-all">
<svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<circle cx="12" cy="12" r="9" stroke-width="2"></circle>
<path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3m.08 4h.01" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</button>
</header>
<!-- END: TopNavigationBar -->
<!-- BEGIN: ContentArea -->
<div class="flex-1 overflow-y-auto no-scrollbar flex flex-col relative" data-purpose="scrollable-content">
<!-- BEGIN: RouteCardWithMapPeek -->
<section class="relative bg-slate-100 overflow-hidden" data-purpose="map-and-route">
<!-- Stylized Map Background (Bole to Kazanchis Vector Graphic) -->
<div class="absolute inset-0 h-44 w-full opacity-70 pointer-events-none">
<svg class="w-full h-full object-cover" fill="none" viewbox="0 0 400 180" xmlns="http://www.w3.org/2000/svg">
<!-- Road Grids & City Blocks -->
<rect fill="#E2E8F0" height="180" width="400"></rect>
<path d="M-10 40 Q 120 70 200 45 T 410 70" stroke="#CBD5E1" stroke-linecap="round" stroke-width="12"></path>
<path d="M40 -10 L110 190" stroke="#CBD5E1" stroke-width="8"></path>
<path d="M290 -10 L250 190" stroke="#CBD5E1" stroke-width="10"></path>
<path d="M180 0 L195 180" stroke="#CBD5E1" stroke-width="6"></path>
<!-- Meskel Square roundabout hint -->
<circle cx="210" cy="115" fill="#F1F5F9" r="28" stroke="#CBD5E1" stroke-width="8"></circle>
<!-- Route Trajectory Line (Bole to Kazanchis) -->
<path d="M90 145 C 130 140 180 125 210 115 C 235 105 270 70 305 45" stroke="#2563EB" stroke-dasharray="2 0" stroke-linecap="round" stroke-width="5"></path>
<!-- Pickup Marker (Bole) -->
<circle class="shadow" cx="90" cy="145" fill="#10B981" r="7" stroke="#FFFFFF" stroke-width="2.5"></circle>
<!-- Dropoff Marker (Kazanchis) -->
<circle class="shadow" cx="305" cy="45" fill="#2563EB" r="7" stroke="#FFFFFF" stroke-width="2.5"></circle>
</svg>
<!-- Subtle Gradient to fade into content -->
<div class="absolute inset-0 bg-gradient-to-t from-slate-50 via-transparent to-transparent"></div>
</div>
<!-- Route Summary Floating Details -->
<div class="relative z-10 px-4 pt-3 pb-3">
<div class="bg-white/95 backdrop-blur-md rounded-2xl p-3.5 shadow-sm border border-slate-200/80">
<!-- Pickup point -->
<div class="flex items-center space-x-3">
<div class="relative flex flex-col items-center">
<span class="w-3 h-3 rounded-full bg-emerald-500 ring-4 ring-emerald-100"></span>
<span class="w-0.5 h-6 bg-slate-200 my-0.5"></span>
<span class="w-3 h-3 rounded-full bg-blue-600 ring-4 ring-blue-100"></span>
</div>
<div class="flex-1 min-w-0 pr-1 space-y-2">
<div class="flex items-center justify-between">
<div class="truncate">
<p class="text-[10px] font-semibold tracking-wider uppercase text-slate-400">Pickup Location</p>
<p class="text-xs font-semibold text-slate-800 truncate">Bole Medhanealem (Current Location)</p>
</div>
<span class="text-[11px] bg-slate-100 text-slate-600 font-medium px-2 py-0.5 rounded-full">Now</span>
</div>
<!-- Destination point -->
<div class="flex items-center justify-between">
<div class="truncate">
<p class="text-[10px] font-semibold tracking-wider uppercase text-slate-400">Destination</p>
<p class="text-xs font-semibold text-slate-800 truncate">Kazanchis, UNECA Conference Ctr</p>
</div>
<!-- Distance & ETA Pill -->
<div class="text-right shrink-0">
<span class="inline-flex items-center gap-1 text-[11px] font-bold text-blue-700 bg-blue-50 px-2 py-0.5 rounded-md">
                      6.4 km • 18 min
                    </span>
</div>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- END: RouteCardWithMapPeek -->
<!-- BEGIN: VehicleOptionsList -->
<section class="px-4 py-2 flex-1 space-y-2.5" data-purpose="vehicle-tier-selection">
<div class="flex items-center justify-between pb-1">
<span class="text-xs font-bold uppercase tracking-wider text-slate-500">Available Categories</span>
<span class="text-xs font-medium text-blue-600 cursor-pointer hover:underline">Fare Breakdown</span>
</div>
<!-- Tier 1: Economy (Selected State) -->
<label class="relative flex items-center justify-between p-3.5 rounded-2xl border-2 border-brand-blue bg-blue-50/60 shadow-sm cursor-pointer transition-all duration-200 active:scale-[0.99]" data-purpose="tier-economy">
<input checked="" class="sr-only" name="ride_tier" type="radio" value="economy"/>
<div class="flex items-center space-x-3.5">
<!-- Vehicle Graphic Representation -->
<div class="w-14 h-11 bg-white rounded-xl shadow-xs flex items-center justify-center p-1 border border-blue-100">
<svg class="w-12 h-8 text-blue-600" fill="currentColor" viewbox="0 0 64 36">
<!-- Sedan profile silhouette -->
<path d="M12 24C12 21.79 13.79 20 16 20C18.21 20 20 21.79 20 24C20 26.21 18.21 28 16 28C13.79 28 12 26.21 12 24ZM44 24C44 21.79 45.79 20 48 20C50.21 20 52 21.79 52 24C52 26.21 50.21 28 48 28C45.79 28 44 26.21 44 24ZM56 18H52.5C50.8 14 47.1 11 42.5 11H22.5C18.4 11 15 13.8 13.5 17.5L8.2 18.5C6.3 18.9 5 20.6 5 22.5V25H9.5C9.2 24.2 9 23.4 9 22.5C9 18.9 11.9 16 15.5 16C19.1 16 22 18.9 22 22.5C22 23.4 21.8 24.2 21.5 25H42.5C42.2 24.2 42 23.4 42 22.5C42 18.9 44.9 16 48.5 16C52.1 16 55 18.9 55 22.5C55 23.4 54.8 24.2 54.5 25H59V21C59 19.3 57.7 18 56 18ZM23 15H42C44.2 15 46.1 16.5 46.8 18H18.2C19 16.2 20.8 15 23 15Z"></path>
</svg>
</div>
<div>
<div class="flex items-center space-x-1.5">
<span class="text-sm font-bold text-slate-900">Economy</span>
<!-- Passenger capacity -->
<span class="inline-flex items-center text-[10px] text-slate-500 font-medium">
<svg class="w-3 h-3 ml-0.5 inline" fill="currentColor" viewbox="0 0 20 20">
<path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"></path>
</svg>
                  4
                </span>
</div>
<p class="text-[11px] text-slate-500 font-normal">Toyota Vitz • Suzuki Dzire</p>
<p class="text-[10px] font-semibold text-emerald-600 flex items-center gap-1 mt-0.5">
<span class="w-1.5 h-1.5 rounded-full bg-emerald-500"></span> 3 min away
              </p>
</div>
</div>
<div class="text-right">
<!-- Price with promo discount applied -->
<div class="text-base font-extrabold text-slate-900 leading-tight">120 ETB</div>
<div class="text-[11px] text-slate-400 line-through font-medium">145 ETB</div>
<!-- Selection Checkmark -->
<div class="w-5 h-5 ml-auto mt-1 rounded-full bg-brand-blue flex items-center justify-center text-white">
<svg class="w-3 h-3 stroke-[3]" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<path d="M5 13l4 4L19 7" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</div>
</div>
</label>
<!-- Tier 2: Comfort / Standard -->
<label class="relative flex items-center justify-between p-3.5 rounded-2xl border border-slate-200 bg-white hover:border-slate-300 shadow-xs cursor-pointer transition-all active:scale-[0.99]" data-purpose="tier-comfort">
<input class="sr-only" name="ride_tier" type="radio" value="comfort"/>
<div class="flex items-center space-x-3.5">
<div class="w-14 h-11 bg-slate-50 rounded-xl flex items-center justify-center p-1 border border-slate-100">
<svg class="w-12 h-8 text-slate-700" fill="currentColor" viewbox="0 0 64 36">
<path d="M12 24C12 21.79 13.79 20 16 20C18.21 20 20 21.79 20 24C20 26.21 18.21 28 16 28C13.79 28 12 26.21 12 24ZM44 24C44 21.79 45.79 20 48 20C50.21 20 52 21.79 52 24C52 26.21 50.21 28 48 28C45.79 28 44 26.21 44 24ZM56 18H52.5C50.8 14 47.1 11 42.5 11H22.5C18.4 11 15 13.8 13.5 17.5L8.2 18.5C6.3 18.9 5 20.6 5 22.5V25H9.5C9.2 24.2 9 23.4 9 22.5C9 18.9 11.9 16 15.5 16C19.1 16 22 18.9 22 22.5C22 23.4 21.8 24.2 21.5 25H42.5C42.2 24.2 42 23.4 42 22.5C42 18.9 44.9 16 48.5 16C52.1 16 55 18.9 55 22.5C55 23.4 54.8 24.2 54.5 25H59V21C59 19.3 57.7 18 56 18Z"></path>
</svg>
</div>
<div>
<div class="flex items-center space-x-1.5">
<span class="text-sm font-bold text-slate-800">Comfort</span>
<span class="inline-flex items-center text-[10px] text-slate-500 font-medium">
<svg class="w-3 h-3 ml-0.5 inline" fill="currentColor" viewbox="0 0 20 20"><path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"></path></svg>
                  4
                </span>
</div>
<p class="text-[11px] text-slate-500">Corolla • Hyundai Elantra</p>
<p class="text-[10px] font-medium text-slate-500 mt-0.5">5 min away</p>
</div>
</div>
<div class="text-right">
<div class="text-base font-bold text-slate-900">210 ETB</div>
<div class="w-5 h-5 ml-auto mt-1 rounded-full border border-slate-300"></div>
</div>
</label>
<!-- Tier 3: XL Minibus -->
<label class="relative flex items-center justify-between p-3.5 rounded-2xl border border-slate-200 bg-white hover:border-slate-300 shadow-xs cursor-pointer transition-all active:scale-[0.99]" data-purpose="tier-xl">
<input class="sr-only" name="ride_tier" type="radio" value="xl"/>
<div class="flex items-center space-x-3.5">
<!-- Minibus Icon -->
<div class="w-14 h-11 bg-slate-50 rounded-xl flex items-center justify-center p-1 border border-slate-100">
<svg class="w-12 h-8 text-slate-700" fill="currentColor" viewbox="0 0 64 36">
<path d="M10 24C10 21.8 11.8 20 14 20C16.2 20 18 21.8 18 24C18 26.2 16.2 28 14 28C11.8 28 10 26.2 10 24ZM46 24C46 21.8 47.8 20 50 20C52.2 20 54 21.8 54 24C54 26.2 52.2 28 50 28C47.8 28 46 26.2 46 24ZM58 14V24H55.5C55.2 23.2 55 22.4 55 21.5C55 17.9 52.1 15 48.5 15C44.9 15 42 17.9 42 21.5C42 22.4 42.2 23.2 42.5 24H21.5C21.2 23.2 21 22.4 21 21.5C21 17.9 18.1 15 14.5 15C10.9 15 8 17.9 8 21.5C8 22.4 8.2 23.2 8.5 24H5V13C5 10.8 6.8 9 9 9H51C54.9 9 58 11.2 58 14ZM16 12H10V16H16V12ZM28 12H20V16H28V12ZM40 12H32V16H40V12ZM52 12H44V16H52V12Z"></path>
</svg>
</div>
<div>
<div class="flex items-center space-x-1.5">
<span class="text-sm font-bold text-slate-800">XL Minivan</span>
<span class="inline-flex items-center text-[10px] text-slate-500 font-medium">
<svg class="w-3 h-3 ml-0.5 inline" fill="currentColor" viewbox="0 0 20 20"><path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"></path></svg>
                  6-8
                </span>
</div>
<p class="text-[11px] text-slate-500">Toyota HiAce • Minivan</p>
<p class="text-[10px] font-medium text-slate-500 mt-0.5">7 min away</p>
</div>
</div>
<div class="text-right">
<div class="text-base font-bold text-slate-900">340 ETB</div>
<div class="w-5 h-5 ml-auto mt-1 rounded-full border border-slate-300"></div>
</div>
</label>
<!-- Tier 4: Classic Addis Lada Taxi -->
<label class="relative flex items-center justify-between p-3.5 rounded-2xl border border-slate-200 bg-white hover:border-slate-300 shadow-xs cursor-pointer transition-all active:scale-[0.99]" data-purpose="tier-lada">
<input class="sr-only" name="ride_tier" type="radio" value="lada"/>
<div class="flex items-center space-x-3.5">
<!-- Distinct Blue/White Lada Taxi Styling Icon -->
<div class="w-14 h-11 bg-blue-600 rounded-xl relative overflow-hidden flex flex-col justify-end p-0.5 border border-blue-400">
<div class="absolute inset-x-0 top-0 h-4 bg-white"></div>
<span class="text-[8px] font-black uppercase text-center text-slate-800 tracking-tighter bg-amber-400 rounded-xs mx-1">TAXI</span>
<div class="flex justify-between px-1.5 py-0.5">
<span class="w-2 h-2 rounded-full bg-slate-900"></span>
<span class="w-2 h-2 rounded-full bg-slate-900"></span>
</div>
</div>
<div>
<div class="flex items-center space-x-1.5">
<span class="text-sm font-bold text-slate-800">Lada Taxi</span>
<span class="text-[9px] bg-amber-100 text-amber-800 font-bold px-1.5 py-0.2 rounded">Local Classic</span>
</div>
<p class="text-[11px] text-slate-500">Blue &amp; White Addis Sedan</p>
<p class="text-[10px] font-semibold text-emerald-600 mt-0.5">2 min away</p>
</div>
</div>
<div class="text-right">
<div class="text-base font-bold text-slate-900">120 ETB</div>
<div class="w-5 h-5 ml-auto mt-1 rounded-full border border-slate-300"></div>
</div>
</label>
</section>
<!-- END: VehicleOptionsList -->
<!-- BEGIN: PaymentAndPromotions -->
<section class="px-4 py-2 space-y-2 mt-auto" data-purpose="checkout-preferences">
<!-- Promo Code Pill -->
<div class="flex items-center justify-between bg-emerald-50 border border-emerald-200/80 px-3.5 py-2 rounded-xl text-xs">
<div class="flex items-center space-x-2 text-emerald-800 font-semibold">
<!-- Promo tag svg -->
<svg class="w-4 h-4 text-emerald-600" fill="currentColor" viewbox="0 0 20 20">
<path clip-rule="evenodd" d="M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z" fill-rule="evenodd"></path>
</svg>
<span>ADDIS15 applied (-25 ETB)</span>
</div>
<button class="text-[11px] font-bold text-emerald-700 uppercase tracking-tight hover:underline">Change</button>
</div>
<!-- Payment Method Selector Pill (Telebirr Default) -->
<div class="flex items-center justify-between p-2.5 bg-white border border-slate-200 rounded-xl shadow-xs" data-purpose="payment-selector">
<div class="flex items-center space-x-2.5">
<!-- Telebirr Emblem Badge -->
<div class="w-8 h-8 rounded-lg bg-[#0072BC] flex items-center justify-center text-white font-black text-xs tracking-tighter shadow-xs">
              tb
            </div>
<div>
<div class="flex items-center space-x-1.5">
<span class="text-xs font-bold text-slate-800">Telebirr</span>
<span class="text-[10px] bg-slate-100 text-slate-600 font-medium px-1.5 py-0.5 rounded">Primary</span>
</div>
<p class="text-[11px] text-slate-500 font-medium">Bal: <span class="text-slate-700 font-semibold">ETB 1,450.00</span></p>
</div>
</div>
<!-- Selector Switcher (Telebirr / CBE Birr / Cash dropdown) -->
<div class="flex items-center space-x-1 text-slate-400 cursor-pointer hover:text-slate-600">
<span class="text-xs font-semibold text-slate-600">Switch</span>
<svg class="w-4 h-4" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<path d="M19 9l-7 7-7-7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</div>
</div>
</section>
<!-- END: PaymentAndPromotions -->
</div>
<!-- END: ContentArea -->
<!-- BEGIN: BottomCTAStickySection -->
<footer class="p-4 bg-white border-t border-slate-100 shadow-xl" data-purpose="action-cta">
<!-- Main CTA Button -->
<button class="w-full py-3.5 px-4 bg-brand-blue hover:bg-brand-darkBlue active:scale-[0.98] text-white rounded-2xl font-bold text-base shadow-lg shadow-blue-500/25 transition-all flex items-center justify-center gap-2">
<span>Confirm Economy (120 ETB)</span>
<svg class="w-4 h-4 stroke-[2.5]" fill="none" stroke="currentColor" viewbox="0 0 24 24">
<path d="M14 5l7 7m0 0l-7 7m7-7H3" stroke-linecap="round" stroke-linejoin="round"></path>
</svg>
</button>
<!-- Trust & Safety Badging -->
<div class="flex items-center justify-center space-x-1.5 mt-2.5 text-slate-400">
<svg class="w-3.5 h-3.5 text-blue-600" fill="currentColor" viewbox="0 0 20 20">
<path clip-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
</svg>
<span class="text-[11px] font-medium text-slate-500">Safe rides, Verified drivers</span>
</div>
<!-- iOS Home Bar Indicator -->
<div class="w-32 h-1 bg-slate-900 rounded-full mx-auto mt-3"></div>
</footer>
<!-- END: BottomCTAStickySection -->
</div>
<!-- END: PhoneShellContainer -->
<!-- Interactivity for tier switching -->
<script data-purpose="tier-selection-handler">
    document.addEventListener('DOMContentLoaded', () => {
      const labels = document.querySelectorAll('[data-purpose^="tier-"]');
      const ctaBtnSpan = document.querySelector('button[class*="bg-brand-blue"] span');

      const prices = {
        economy: '120 ETB',
        comfort: '210 ETB',
        xl: '340 ETB',
        lada: '120 ETB'
      };

      const names = {
        economy: 'Economy',
        comfort: 'Comfort',
        xl: 'XL Minivan',
        lada: 'Lada Taxi'
      };

      labels.forEach(label => {
        label.addEventListener('click', () => {
          // Reset styling
          labels.forEach(l => {
            l.classList.remove('border-2', 'border-brand-blue', 'bg-blue-50/60');
            l.classList.add('border', 'border-slate-200', 'bg-white');
            const check = l.querySelector('.w-5.h-5');
            if (check) {
              check.className = 'w-5 h-5 ml-auto mt-1 rounded-full border border-slate-300';
              check.innerHTML = '';
            }
          });

          // Apply selected styles
          label.classList.remove('border-slate-200', 'bg-white');
          label.classList.add('border-2', 'border-brand-blue', 'bg-blue-50/60');

          const activeRadio = label.querySelector('input[type="radio"]');
          if (activeRadio) {
            activeRadio.checked = true;
            const check = label.querySelector('.w-5.h-5');
            if (check) {
              check.className = 'w-5 h-5 ml-auto mt-1 rounded-full bg-brand-blue flex items-center justify-center text-white';
              check.innerHTML = '<svg class="w-3 h-3 stroke-[3]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" /></svg>';
            }
            if (ctaBtnSpan) {
              ctaBtnSpan.textContent = `Confirm ${names[activeRadio.value]} (${prices[activeRadio.value]})`;
            }
          }
        });
      });
    });

  </script>
</body></html>
<!-- ZemenGo - OTP Verification -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-secondary-container": "#004666", "surface-dim": "#d2d9f4", "tertiary": "#005539", "surface-variant": "#dae2fd", "on-tertiary-container": "#6af7b9", "inverse-primary": "#b7c4ff", "surface": "#faf8ff", "on-primary": "#ffffff", "surface-container-highest": "#dae2fd", "surface-container-low": "#f2f3ff", "surface-bright": "#faf8ff", "surface-container-high": "#e2e7ff", "secondary": "#006591", "on-background": "#131b2e", "tertiary-container": "#00704c", "error": "#ba1a1a", "on-surface": "#131b2e", "on-primary-container": "#d6dcff", "on-surface-variant": "#434655", "on-tertiary": "#ffffff", "on-secondary-fixed-variant": "#004c6e", "outline": "#747687", "on-secondary": "#ffffff", "primary": "#003cbb", "secondary-fixed-dim": "#89ceff", "primary-container": "#1852e8", "primary-fixed-dim": "#b7c4ff", "inverse-on-surface": "#eef0ff", "inverse-surface": "#283044", "outline-variant": "#c3c5d8", "background": "#faf8ff", "error-container": "#ffdad6", "tertiary-fixed-dim": "#4edea3", "surface-container-lowest": "#ffffff", "on-error": "#ffffff", "secondary-fixed": "#c9e6ff", "primary-fixed": "#dce1ff", "on-secondary-fixed": "#001e2f", "on-error-container": "#93000a", "surface-tint": "#104ee5", "on-tertiary-fixed": "#002113", "tertiary-fixed": "#6ffbbe", "surface-container": "#eaedff", "secondary-container": "#39b8fd", "on-tertiary-fixed-variant": "#005236", "on-primary-fixed": "#001551", "on-primary-fixed-variant": "#0039b4" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-2xs": "0.25rem", "space-lg": "1.25rem", "space-md": "1rem", "margin": "1rem", "space-2xl": "2rem", "gutter": "1rem", "space-sm": "0.75rem", "space-xs": "0.5rem", "space-xl": "1.5rem" }, fontFamily: { "body-md-medium": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md-medium": ["14px", { lineHeight: "20px", fontWeight: "600" }], "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }], "currency-display": ["22px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "800" }], "headline-lg": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }], "display-lg": ["36px", { lineHeight: "44px", letterSpacing: "-0.03em", fontWeight: "800" }], "label-sm": ["11px", { lineHeight: "14px", letterSpacing: "0.04em", fontWeight: "700" }], "body-lg": ["16px", { lineHeight: "24px", fontWeight: "400" }], "body-md": ["14px", { lineHeight: "20px", fontWeight: "400" }], "display-lg-mobile": ["28px", { lineHeight: "34px", letterSpacing: "-0.02em", fontWeight: "800" }], "headline-md": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }], "body-lg-medium": ["16px", { lineHeight: "24px", fontWeight: "500" }], "headline-sm": ["18px", { lineHeight: "24px", fontWeight: "600" }] } } } };</script><style>@layer base{html,body{width:100vw;min-height:100vh;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface antialiased"><header class="fixed top-0 w-full z-50 pt-safe bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-margin flex items-center justify-between"><button aria-label="Go back" class="min-w-[44px] min-h-[44px] -ml-space-xs flex items-center justify-center rounded-full text-on-surface hover:bg-surface-container active:bg-surface-container-high transition-colors" onclick="history.back()" type="button"><span class="material-symbols-outlined text-[24px]">arrow_back</span></button><div class="flex-1 px-space-sm flex flex-col items-center justify-center"><span class="font-headline-sm text-headline-sm text-on-surface truncate">Otp Verification</span></div><div class="flex items-center gap-space-xs"><button class="min-h-[44px] px-space-sm flex items-center justify-center rounded-full bg-surface-container-low text-primary hover:bg-surface-container active:bg-surface-container-high transition-colors font-label-md text-label-md" type="button"><span class="font-bold">EN</span><span class="text-outline mx-space-2xs">/</span><span class="text-on-surface-variant font-medium">አማ</span></button><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center shrink-0"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></div></header><main class="flex flex-col relative w-full pt-16 bg-surface pb-safe min-h-screen"><div class="flex flex-col w-full px-margin pb-space-xl">
<!-- Progress Header Indicator -->
<div class="flex items-center justify-between pt-space-xs pb-space-md">
<div class="flex items-center gap-space-xs">
<span class="font-label-sm text-label-sm text-primary uppercase tracking-wider font-extrabold">Step 2 of 3</span>
<span class="w-1.5 h-1.5 rounded-full bg-primary/40"></span>
<span class="font-label-sm text-label-sm text-on-surface-variant font-medium">Security Check</span>
</div>
<span class="font-label-md text-label-md text-tertiary bg-tertiary-container/10 px-space-xs py-0.5 rounded-full font-bold flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">shield</span> Encrypted
    </span>
</div>
<!-- Progress Bar Line -->
<div class="w-full h-1 bg-surface-container rounded-full overflow-hidden mb-space-lg">
<div class="w-2/3 h-full bg-primary rounded-full transition-all duration-500 ease-out"></div>
</div>
<!-- Verification Hero / Header Context -->
<div class="flex flex-col gap-space-2xs mb-space-lg">
<div class="w-12 h-12 rounded-xl bg-primary-fixed flex items-center justify-center mb-space-2xs shadow-sm">
<span class="material-symbols-outlined text-primary text-[28px]" style="font-variation-settings: 'FILL' 1;">sms</span>
</div>
<h1 class="font-display-lg-mobile text-display-lg-mobile text-on-surface tracking-tight">Verify your phone</h1>
<div class="flex items-center flex-wrap gap-1 font-body-md text-body-md text-on-surface-variant mt-1">
<span>We sent a 6-digit code to</span>
<span class="font-body-md-medium text-body-md-medium text-on-surface font-bold tracking-normal">+251 91 123 4567</span>
<button class="inline-flex items-center gap-0.5 text-primary hover:text-primary-container font-label-md text-label-md ml-1 py-0.5 px-1.5 rounded-lg bg-surface-container-high transition-colors" type="button">
<span class="material-symbols-outlined text-[14px]">edit</span>
<span>Edit</span>
</button>
</div>
</div>
<!-- Visual Security Illustration Banner -->
<div class="relative w-full rounded-xl bg-surface-container-lowest p-space-sm mb-space-lg shadow-sm flex items-center justify-between overflow-hidden">
<div class="flex items-center gap-space-sm z-10">
<div class="w-10 h-10 rounded-full bg-secondary-fixed flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-on-secondary-fixed text-[20px]">mark_chat_read</span>
</div>
<div class="flex flex-col">
<span class="font-label-md text-label-md text-on-surface font-bold">Auto-detecting SMS</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Waiting for cellular carrier sync...</span>
</div>
</div>
<div class="flex items-center gap-1 z-10">
<span class="w-2 h-2 rounded-full bg-secondary animate-ping"></span>
<span class="w-2 h-2 rounded-full bg-secondary"></span>
</div>
<div class="absolute right-0 top-0 bottom-0 w-32 bg-gradient-to-l from-secondary-fixed/30 to-transparent pointer-events-none"></div>
</div>
<!-- 6-digit OTP Code Inputs -->
<div class="w-full flex flex-col items-center mb-space-lg">
<div class="w-full flex items-center justify-between gap-1.5 sm:gap-2">
<!-- Box 1: Filled '4' -->
<div class="flex-1 aspect-square max-w-[52px] rounded-xl bg-surface-container-lowest flex items-center justify-center shadow-sm">
<span class="font-headline-lg text-headline-lg text-on-surface font-bold">4</span>
</div>
<!-- Box 2: Filled '8' -->
<div class="flex-1 aspect-square max-w-[52px] rounded-xl bg-surface-container-lowest flex items-center justify-center shadow-sm">
<span class="font-headline-lg text-headline-lg text-on-surface font-bold">8</span>
</div>
<!-- Box 3: Filled '2' -->
<div class="flex-1 aspect-square max-w-[52px] rounded-xl bg-surface-container-lowest flex items-center justify-center shadow-sm">
<span class="font-headline-lg text-headline-lg text-on-surface font-bold">2</span>
</div>
<!-- Box 4: Filled '9' -->
<div class="flex-1 aspect-square max-w-[52px] rounded-xl bg-surface-container-lowest flex items-center justify-center shadow-sm">
<span class="font-headline-lg text-headline-lg text-on-surface font-bold">9</span>
</div>
<!-- Box 5: Active Focused Cursor -->
<div class="flex-1 aspect-square max-w-[52px] rounded-xl bg-surface-container-lowest flex items-center justify-center shadow-md bg-gradient-to-b from-primary/5 to-transparent relative">
<div class="w-0.5 h-6 bg-primary animate-pulse rounded-full"></div>
<div class="absolute inset-x-2 bottom-2 h-0.5 bg-primary rounded-full"></div>
</div>
<!-- Box 6: Empty Unfocused -->
<div class="flex-1 aspect-square max-w-[52px] rounded-xl bg-surface-container flex items-center justify-center">
<span class="w-2 h-2 rounded-full bg-outline-variant"></span>
</div>
</div>
</div>
<!-- Resend Timer & Alternate Channel Actions -->
<div class="w-full flex flex-col items-center gap-space-xs mb-space-lg">
<div class="flex items-center gap-1.5 text-on-surface-variant font-label-md text-label-md bg-surface-container px-space-md py-1.5 rounded-full">
<span class="material-symbols-outlined text-[16px] text-primary animate-spin" style="animation-duration: 4s;">history</span>
<span>Resend code in</span>
<span class="text-primary font-bold tracking-wider" id="countdown-timer">00:42</span>
</div>
<div class="flex items-center gap-space-sm mt-1">
<button class="flex items-center gap-1 text-on-surface-variant hover:text-primary font-label-md text-label-md py-1 px-2 transition-colors" type="button">
<span class="material-symbols-outlined text-[16px] text-tertiary">chat</span>
<span>WhatsApp</span>
</button>
<span class="text-outline-variant">•</span>
<button class="flex items-center gap-1 text-on-surface-variant hover:text-primary font-label-md text-label-md py-1 px-2 transition-colors" type="button">
<span class="material-symbols-outlined text-[16px]">call</span>
<span>Call Me</span>
</button>
</div>
</div>
<!-- Soft Tactile Digital Keypad -->
<div class="w-full bg-surface-container-lowest rounded-xl p-space-xs shadow-sm mb-space-lg">
<div class="grid grid-cols-3 gap-space-xs select-none">
<!-- 1 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">1</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none"> </span>
</button>
<!-- 2 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">2</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">ABC</span>
</button>
<!-- 3 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">3</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">DEF</span>
</button>
<!-- 4 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">4</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">GHI</span>
</button>
<!-- 5 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">5</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">JKL</span>
</button>
<!-- 6 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">6</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">MNO</span>
</button>
<!-- 7 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">7</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">PQRS</span>
</button>
<!-- 8 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">8</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">TUV</span>
</button>
<!-- 9 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">9</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">WXYZ</span>
</button>
<!-- Empty Spacer -->
<div class="h-13 py-2 flex items-center justify-center rounded-lg bg-transparent">
<span class="material-symbols-outlined text-outline-variant text-[20px]">fingerprint</span>
</div>
<!-- 0 -->
<button class="h-13 py-2 flex flex-col items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="font-headline-md text-headline-md font-bold leading-none">0</span>
<span class="font-label-sm text-[9px] text-on-surface-variant tracking-widest mt-0.5 leading-none">+</span>
</button>
<!-- Backspace -->
<button class="h-13 py-2 flex items-center justify-center rounded-lg bg-surface hover:bg-surface-container active:scale-95 transition-all text-on-surface shadow-xs" type="button">
<span class="material-symbols-outlined text-[22px]">backspace</span>
</button>
</div>
</div>
<!-- Primary CTA Button -->
<div class="w-full flex flex-col gap-space-xs">
<button class="w-full h-[52px] bg-primary-container text-on-primary font-body-lg-medium text-body-lg-medium font-bold rounded-xl shadow-lg shadow-primary/20 flex items-center justify-center gap-space-xs active:scale-[0.99] transition-all" type="button">
<span>Verify &amp; Proceed</span>
<span class="material-symbols-outlined text-[20px]">arrow_forward</span>
</button>
<div class="flex items-center justify-center gap-1.5 py-1 text-center">
<span class="material-symbols-outlined text-tertiary text-[14px]">lock</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Secured by Telebirr &amp; CBE verified gateways</span>
</div>
</div>
</div>
<script>
  // Simple playful countdown tick simulation
  (function() {
    let timeLeft = 42;
    const timerElem = document.getElementById('countdown-timer');
    if (!timerElem) return;
    const interval = setInterval(() => {
      timeLeft--;
      if (timeLeft <= 0) {
        clearInterval(interval);
        timerElem.innerText = '00:00';
      } else {
        const secs = timeLeft < 10 ? '0' + timeLeft : timeLeft;
        timerElem.innerText = `00:${secs}`;
      }
    }, 1000);
  })();
</script></main></body></html>

<!-- ZemenGo - Onboarding Slides -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-secondary-container": "#004666", "surface-dim": "#d2d9f4", "tertiary": "#005539", "surface-variant": "#dae2fd", "on-tertiary-container": "#6af7b9", "inverse-primary": "#b7c4ff", "surface": "#faf8ff", "on-primary": "#ffffff", "surface-container-highest": "#dae2fd", "surface-container-low": "#f2f3ff", "surface-bright": "#faf8ff", "surface-container-high": "#e2e7ff", "secondary": "#006591", "on-background": "#131b2e", "tertiary-container": "#00704c", "error": "#ba1a1a", "on-surface": "#131b2e", "on-primary-container": "#d6dcff", "on-surface-variant": "#434655", "on-tertiary": "#ffffff", "on-secondary-fixed-variant": "#004c6e", "outline": "#747687", "on-secondary": "#ffffff", "primary": "#003cbb", "secondary-fixed-dim": "#89ceff", "primary-container": "#1852e8", "primary-fixed-dim": "#b7c4ff", "inverse-on-surface": "#eef0ff", "inverse-surface": "#283044", "outline-variant": "#c3c5d8", "background": "#faf8ff", "error-container": "#ffdad6", "tertiary-fixed-dim": "#4edea3", "surface-container-lowest": "#ffffff", "on-error": "#ffffff", "secondary-fixed": "#c9e6ff", "primary-fixed": "#dce1ff", "on-secondary-fixed": "#001e2f", "on-error-container": "#93000a", "surface-tint": "#104ee5", "on-tertiary-fixed": "#002113", "tertiary-fixed": "#6ffbbe", "surface-container": "#eaedff", "secondary-container": "#39b8fd", "on-tertiary-fixed-variant": "#005236", "on-primary-fixed": "#001551", "on-primary-fixed-variant": "#0039b4" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-2xs": "0.25rem", "space-lg": "1.25rem", "space-md": "1rem", "margin": "1rem", "space-2xl": "2rem", "gutter": "1rem", "space-sm": "0.75rem", "space-xs": "0.5rem", "space-xl": "1.5rem" }, fontFamily: { "body-md-medium": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md-medium": ["14px", { lineHeight: "20px", fontWeight: "600" }], "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }], "currency-display": ["22px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "800" }], "headline-lg": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }], "display-lg": ["36px", { lineHeight: "44px", letterSpacing: "-0.03em", fontWeight: "800" }], "label-sm": ["11px", { lineHeight: "14px", letterSpacing: "0.04em", fontWeight: "700" }], "body-lg": ["16px", { lineHeight: "24px", fontWeight: "400" }], "body-md": ["14px", { lineHeight: "20px", fontWeight: "400" }], "display-lg-mobile": ["28px", { lineHeight: "34px", letterSpacing: "-0.02em", fontWeight: "800" }], "headline-md": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }], "body-lg-medium": ["16px", { lineHeight: "24px", fontWeight: "500" }], "headline-sm": ["18px", { lineHeight: "24px", fontWeight: "600" }] } } } };</script><style>@layer base{html,body{width:100vw;min-height:100vh;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface antialiased"><main class="flex flex-col relative w-full min-h-screen bg-surface"><div class="flex flex-col w-full relative overflow-hidden bg-surface-container-lowest pb-safe">
<!-- Soft Ambient Atmosphere Orbs -->
<div class="absolute -top-16 -right-16 w-56 h-56 rounded-full bg-secondary-container/15 blur-3xl pointer-events-none"></div>
<div class="absolute top-72 -left-20 w-48 h-48 rounded-full bg-primary/10 blur-3xl pointer-events-none"></div>
<!-- Header Utilities Bar -->
<div class="flex items-center justify-between px-space-md py-space-sm z-10">
<!-- Language Switch Pill -->
<button class="flex items-center gap-space-2xs px-space-sm py-1.5 rounded-full bg-surface-container-low text-on-surface-variant transition-transform active:scale-95 shadow-sm" type="button">
<span class="material-symbols-outlined text-base text-primary">translate</span>
<span class="font-label-md text-label-md tracking-wide">EN</span>
<span class="font-label-sm text-label-sm text-outline">|</span>
<span class="font-label-md text-label-md font-bold text-on-surface">አማ</span>
</button>
<!-- Skip Button -->
<button class="px-space-sm py-1.5 rounded-full text-outline transition-colors hover:text-on-surface active:scale-95" type="button">
<span class="font-label-md text-label-md">Skip</span>
</button>
</div>
<!-- Dynamic Service Showcase Deck (Interactive Bento Carousel Visual) -->
<div class="px-space-md pt-space-xs pb-space-sm relative z-10">
<div class="relative w-full rounded-2xl bg-surface-container-low p-space-md shadow-sm overflow-hidden flex flex-col gap-space-xs">
<!-- Subtle Backing Pattern Layer -->
<div class="absolute inset-0 bg-gradient-to-br from-surface-container-lowest/80 via-surface-container-low to-secondary-container/10 pointer-events-none"></div>
<!-- Feature Card 1: Instant Rides -->
<div class="relative flex items-center justify-between p-space-sm rounded-xl bg-surface-container-lowest shadow-sm transition-all hover:translate-y-[-1px]">
<div class="flex items-center gap-space-sm min-w-0">
<div class="w-12 h-12 rounded-xl bg-primary-fixed flex items-center justify-center text-primary shrink-0 shadow-sm">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">electric_car</span>
</div>
<div class="min-w-0">
<div class="flex items-center gap-space-2xs">
<span class="font-headline-sm text-headline-sm text-on-surface truncate">Instant Rides</span>
<span class="px-1.5 py-0.5 rounded-full bg-tertiary-container/10 text-tertiary font-label-sm text-label-sm">Fast</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">Addis cross-town cabs &amp; bajaj</p>
</div>
</div>
<div class="pl-space-2xs shrink-0 text-primary">
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</div>
</div>
<!-- Feature Card 2: Food & Habesha Cuisines -->
<div class="relative flex items-center justify-between p-space-sm rounded-xl bg-surface-container-lowest shadow-sm transition-all hover:translate-y-[-1px]">
<div class="flex items-center gap-space-sm min-w-0">
<div class="w-12 h-12 rounded-xl bg-tertiary-container/15 flex items-center justify-center text-tertiary shrink-0 shadow-sm">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">restaurant</span>
</div>
<div class="min-w-0">
<div class="flex items-center gap-space-2xs">
<span class="font-headline-sm text-headline-sm text-on-surface truncate">Top Restaurants</span>
<span class="px-1.5 py-0.5 rounded-full bg-secondary-fixed/50 text-secondary font-label-sm text-label-sm">Hot</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">Kitfo, Shiro &amp; artisanal cafe deliveries</p>
</div>
</div>
<div class="pl-space-2xs shrink-0 text-tertiary">
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</div>
</div>
<!-- Feature Card 3: Express Package Courier -->
<div class="relative flex items-center justify-between p-space-sm rounded-xl bg-surface-container-lowest shadow-sm transition-all hover:translate-y-[-1px]">
<div class="flex items-center gap-space-sm min-w-0">
<div class="w-12 h-12 rounded-xl bg-secondary-fixed flex items-center justify-center text-on-secondary-fixed-variant shrink-0 shadow-sm">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">inventory_2</span>
</div>
<div class="min-w-0">
<div class="flex items-center gap-space-2xs">
<span class="font-headline-sm text-headline-sm text-on-surface truncate">Door-to-Door Courier</span>
<span class="px-1.5 py-0.5 rounded-full bg-primary-fixed text-primary font-label-sm text-label-sm">Live GPS</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">Secure parcel dispatch across town</p>
</div>
</div>
<div class="pl-space-2xs shrink-0 text-secondary">
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</div>
</div>
</div>
</div>
<!-- Carousel Indicators (Slide 3 Active) -->
<div class="flex items-center justify-center gap-space-2xs py-space-xs z-10">
<div class="w-2 h-2 rounded-full bg-surface-variant"></div>
<div class="w-2 h-2 rounded-full bg-surface-variant"></div>
<div class="w-7 h-2 rounded-full bg-primary-container"></div>
</div>
<!-- Main Value Narrative -->
<div class="px-space-md text-center flex flex-col items-center z-10 mt-space-2xs">
<h1 class="font-display-lg-mobile text-display-lg-mobile text-on-surface tracking-tight">
      One App for Everything in Addis
    </h1>
<p class="font-body-md text-body-md text-on-surface-variant mt-space-xs max-w-sm">
      Book verified rides in minutes, order your favorite Habesha meals, and send packages across the city with live tracking.
    </p>
</div>
<!-- Localized Trust & Value Badges -->
<div class="px-space-md mt-space-md flex flex-wrap items-center justify-center gap-space-2xs z-10">
<!-- Telebirr & CBE Ready -->
<div class="flex items-center gap-1.5 px-space-sm py-1.5 rounded-full bg-surface-container-high/60 text-on-surface">
<span class="material-symbols-outlined text-sm text-primary" style="font-variation-settings: 'FILL' 1;">bolt</span>
<span class="font-label-md text-label-md">Telebirr &amp; CBE Birr Ready</span>
</div>
<!-- Verified Drivers -->
<div class="flex items-center gap-1.5 px-space-sm py-1.5 rounded-full bg-surface-container-high/60 text-on-surface">
<span class="material-symbols-outlined text-sm text-tertiary" style="font-variation-settings: 'FILL' 1;">verified_user</span>
<span class="font-label-md text-label-md">100% Verified Drivers</span>
</div>
<!-- Addis Coverage -->
<div class="flex items-center gap-1.5 px-space-sm py-1.5 rounded-full bg-surface-container-high/60 text-on-surface">
<span class="material-symbols-outlined text-sm text-error" style="font-variation-settings: 'FILL' 1;">location_on</span>
<span class="font-label-md text-label-md">Addis Ababa Wide</span>
</div>
</div>
<!-- Action Deck CTA -->
<div class="px-space-md mt-space-xl mb-space-lg flex flex-col items-center gap-space-md z-10">
<button class="w-full h-13 py-space-sm px-space-lg rounded-xl bg-primary-container text-on-primary font-headline-sm text-headline-sm flex items-center justify-center gap-space-xs shadow-md transition-transform active:scale-[0.98]" type="button">
<span>Get Started</span>
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</button>
<button class="font-body-md-medium text-body-md-medium text-on-surface-variant hover:text-primary transition-colors" type="button">
      Already have an account? <span class="text-primary font-bold">Log in</span>
</button>
</div>
</div></main></body></html>

<!-- ZemenGo - Phone Login -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-secondary-container": "#004666", "surface-dim": "#d2d9f4", "tertiary": "#005539", "surface-variant": "#dae2fd", "on-tertiary-container": "#6af7b9", "inverse-primary": "#b7c4ff", "surface": "#faf8ff", "on-primary": "#ffffff", "surface-container-highest": "#dae2fd", "surface-container-low": "#f2f3ff", "surface-bright": "#faf8ff", "surface-container-high": "#e2e7ff", "secondary": "#006591", "on-background": "#131b2e", "tertiary-container": "#00704c", "error": "#ba1a1a", "on-surface": "#131b2e", "on-primary-container": "#d6dcff", "on-surface-variant": "#434655", "on-tertiary": "#ffffff", "on-secondary-fixed-variant": "#004c6e", "outline": "#747687", "on-secondary": "#ffffff", "primary": "#003cbb", "secondary-fixed-dim": "#89ceff", "primary-container": "#1852e8", "primary-fixed-dim": "#b7c4ff", "inverse-on-surface": "#eef0ff", "inverse-surface": "#283044", "outline-variant": "#c3c5d8", "background": "#faf8ff", "error-container": "#ffdad6", "tertiary-fixed-dim": "#4edea3", "surface-container-lowest": "#ffffff", "on-error": "#ffffff", "secondary-fixed": "#c9e6ff", "primary-fixed": "#dce1ff", "on-secondary-fixed": "#001e2f", "on-error-container": "#93000a", "surface-tint": "#104ee5", "on-tertiary-fixed": "#002113", "tertiary-fixed": "#6ffbbe", "surface-container": "#eaedff", "secondary-container": "#39b8fd", "on-tertiary-fixed-variant": "#005236", "on-primary-fixed": "#001551", "on-primary-fixed-variant": "#0039b4" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-2xs": "0.25rem", "space-lg": "1.25rem", "space-md": "1rem", "margin": "1rem", "space-2xl": "2rem", "gutter": "1rem", "space-sm": "0.75rem", "space-xs": "0.5rem", "space-xl": "1.5rem" }, fontFamily: { "body-md-medium": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md-medium": ["14px", { lineHeight: "20px", fontWeight: "600" }], "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }], "currency-display": ["22px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "800" }], "headline-lg": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }], "display-lg": ["36px", { lineHeight: "44px", letterSpacing: "-0.03em", fontWeight: "800" }], "label-sm": ["11px", { lineHeight: "14px", letterSpacing: "0.04em", fontWeight: "700" }], "body-lg": ["16px", { lineHeight: "24px", fontWeight: "400" }], "body-md": ["14px", { lineHeight: "20px", fontWeight: "400" }], "display-lg-mobile": ["28px", { lineHeight: "34px", letterSpacing: "-0.02em", fontWeight: "800" }], "headline-md": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }], "body-lg-medium": ["16px", { lineHeight: "24px", fontWeight: "500" }], "headline-sm": ["18px", { lineHeight: "24px", fontWeight: "600" }] } } } };</script><style>@layer base{html,body{width:100vw;min-height:100vh;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface antialiased"><header class="fixed top-0 w-full z-50 pt-safe bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-margin flex items-center justify-between"><button aria-label="Go back" class="min-w-[44px] min-h-[44px] -ml-space-xs flex items-center justify-center rounded-full text-on-surface hover:bg-surface-container active:bg-surface-container-high transition-colors" onclick="history.back()" type="button"><span class="material-symbols-outlined text-[24px]">arrow_back</span></button><div class="flex-1 px-space-sm flex flex-col items-center justify-center"><span class="font-headline-sm text-headline-sm text-on-surface truncate">Phone Login</span></div><div class="flex items-center gap-space-xs"><button class="min-h-[44px] px-space-sm flex items-center justify-center rounded-full bg-surface-container-low text-primary hover:bg-surface-container active:bg-surface-container-high transition-colors font-label-md text-label-md" type="button"><span class="font-bold">EN</span><span class="text-outline mx-space-2xs">/</span><span class="text-on-surface-variant font-medium">አማ</span></button><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center shrink-0"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></div></header><main class="flex flex-col relative w-full pt-16 bg-surface pb-safe min-h-screen"><div class="flex flex-col w-full px-margin pb-space-2xl">
<!-- Subtle Visual Ambient Badge / Illustration Slot -->
<div class="pt-space-md pb-space-sm flex items-center justify-between">
<div class="flex items-center gap-space-xs bg-surface-container px-space-sm py-1.5 rounded-full">
<span class="w-2 h-2 rounded-full bg-tertiary-container animate-pulse"></span>
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Fast &amp; Secure Access</span>
</div>
<div class="flex items-center gap-1.5 text-on-surface-variant">
<span class="material-symbols-outlined text-[16px] text-tertiary">verified_user</span>
<span class="font-label-sm text-label-sm font-semibold">256-Bit SSL</span>
</div>
</div>
<!-- City Skyline Micro Hero Graphic -->
<div class="relative w-full h-28 rounded-xl overflow-hidden mb-space-lg shadow-sm">
<div class="bg-cover bg-center w-full h-full transform scale-105 transition-transform duration-700" data-alt="Modern Addis Ababa Ethiopia city skyline at dawn with sleek elevated light rail transit bridges, flowing morning traffic with bright vehicle lights, vibrant sunrise over Mount Entoto, styled with vivid electric cobalt blue and crisp warm golden highlights." style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuC6eA6G9JudPtALDFjtyQ1YLetY3pH2G1PWci5A9m5TzvlYWpZSrryvfWBBQfyn2y0s5j2U4jitL2zuQb9u251UL3lMVHXd0u_sZO-bS-rIxtRyqqX5zK9pbQNo4CtURE25khRIlwVHGr5__6hHhpzIM74Xbn7VzLrtT6Ku11R4zs8QEJwko80yFX2z1Vcb8imFWpz_F_g2YKQ8RitmrF9DP071Xzpqp5JRbXyQrV54mTnKkRK0hQD0uw')">
</div>
<div class="absolute inset-0 bg-gradient-to-t from-surface via-surface/40 to-transparent"></div>
<div class="absolute bottom-2 left-3 flex items-center gap-1.5 bg-surface/90 backdrop-blur-md px-2.5 py-1 rounded-full shadow-sm">
<span class="material-symbols-outlined text-primary text-[14px]">electric_bolt</span>
<span class="font-label-sm text-label-sm text-on-surface font-semibold">Mobility &amp; Digital Payments</span>
</div>
</div>
<!-- Headline & Intro -->
<div class="flex flex-col gap-space-2xs mb-space-xl">
<h1 class="font-display-lg-mobile text-display-lg-mobile text-on-surface tracking-tight">
      Welcome to <span class="text-primary-container">ZemenGo</span>
</h1>
<p class="font-body-md text-body-md text-on-surface-variant">
      Enter your phone number to sign in or create an account
    </p>
</div>
<!-- Phone Number Input Section -->
<div class="flex flex-col gap-space-xs mb-space-lg">
<label class="font-label-md text-label-md text-on-surface font-bold tracking-wide" for="phone-input">
      Phone Number
    </label>
<div class="flex items-center w-full bg-surface-container-lowest rounded-xl shadow-sm transition-all duration-200 focus-within:shadow-md focus-within:bg-surface-container-low" id="input-container">
<!-- Country Code Picker -->
<button aria-label="Select Country Code" class="h-14 px-space-md flex items-center gap-space-xs rounded-l-xl bg-surface-container hover:bg-surface-container-high transition-colors text-on-surface shrink-0" id="country-picker-btn" type="button">
<span aria-label="Ethiopian Flag" class="text-[20px] leading-none" role="img">🇪🇹</span>
<span class="font-body-md-medium text-body-md-medium text-on-surface font-bold tracking-tight">+251</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant transition-transform duration-200" id="picker-caret">expand_more</span>
</button>
<!-- Main Input -->
<div class="relative flex-1 flex items-center pr-space-md">
<input autocomplete="tel-national" class="w-full h-14 pl-space-sm pr-space-xs bg-transparent font-currency-display text-currency-display text-on-surface placeholder:text-outline-variant outline-none tracking-normal" id="phone-input" inputmode="numeric" maxlength="11" pattern="[0-9]*" placeholder="911 234 567" type="tel"/>
<button aria-label="Clear field" class="hidden w-7 h-7 rounded-full bg-surface-container-highest items-center justify-center text-on-surface-variant hover:text-on-surface active:scale-95 transition-all shrink-0" id="clear-btn" type="button">
<span class="material-symbols-outlined text-[16px]">close</span>
</button>
</div>
</div>
<!-- Verification Code Helper Hint -->
<div class="flex items-center gap-1.5 px-space-2xs pt-1">
<span class="material-symbols-outlined text-[16px] text-primary">sms</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">
        We'll send you a 6-digit verification code via SMS
      </span>
</div>
</div>
<!-- Trust / Ecosystem Banner -->
<div class="mb-space-xl p-space-md rounded-xl bg-secondary-fixed/30 flex items-start gap-space-sm shadow-sm">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center shrink-0 shadow-sm">
<span class="material-symbols-outlined text-secondary text-[22px]">account_balance_wallet</span>
</div>
<div class="flex-1 min-w-0">
<div class="flex items-center gap-space-xs flex-wrap">
<span class="font-body-md-medium text-body-md-medium text-on-secondary-fixed font-bold">
          Ecosystem Fast Sync
        </span>
<span class="bg-secondary text-on-secondary px-1.5 py-0.5 rounded font-label-sm text-[10px] uppercase font-bold tracking-wider">
          Instant
        </span>
</div>
<p class="font-label-md text-label-md text-on-secondary-fixed-variant mt-0.5">
        Supports instant sign-in with Telebirr / CBE Birr accounts
      </p>
<!-- Ecosystem Mini Badges -->
<div class="flex items-center gap-space-xs mt-space-xs">
<span class="px-2 py-0.5 rounded-full bg-surface-container-lowest text-secondary font-label-sm text-label-sm font-bold shadow-sm">
          Telebirr
        </span>
<span class="px-2 py-0.5 rounded-full bg-surface-container-lowest text-on-secondary-container font-label-sm text-label-sm font-bold shadow-sm">
          CBE Birr
        </span>
<span class="px-2 py-0.5 rounded-full bg-surface-container-lowest text-tertiary font-label-sm text-label-sm font-bold shadow-sm flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary"></span>
          Direct Pay
        </span>
</div>
</div>
</div>
<!-- Primary CTA Action Button -->
<button class="w-full h-[52px] rounded-xl bg-primary-container text-on-primary font-headline-sm text-headline-sm flex items-center justify-center gap-space-xs shadow-lg shadow-primary-container/25 hover:brightness-105 active:scale-[0.98] transition-all cursor-pointer" id="submit-cta" type="button">
<span>Continue</span>
<span class="material-symbols-outlined text-[20px] transition-transform group-hover:translate-x-1">arrow_forward</span>
</button>
<!-- Or Continue With Divider -->
<div class="flex items-center my-space-xl">
<div class="flex-1 h-[1px] bg-surface-container-highest"></div>
<span class="px-space-md font-label-md text-label-md text-outline uppercase tracking-wider">
      Or continue with
    </span>
<div class="flex-1 h-[1px] bg-surface-container-highest"></div>
</div>
<!-- Social Login Alternatives -->
<div class="flex flex-col gap-space-sm mb-space-xl">
<!-- Google Option -->
<button class="w-full h-12 rounded-xl bg-surface-container-lowest text-on-surface hover:bg-surface-container-low active:bg-surface-container transition-all flex items-center justify-center gap-space-sm shadow-sm font-body-md-medium text-body-md-medium" type="button">
<svg class="w-5 h-5 shrink-0" viewbox="0 0 24 24">
<path d="M23.745 12.27c0-.7-.06-1.4-.19-2.07H12v4.51h6.6c-.29 1.52-1.14 2.8-2.4 3.66v3.05h3.88c2.27-2.09 3.66-5.17 3.66-9.15z" fill="#4285F4"></path>
<path d="M12 24c3.24 0 5.95-1.08 7.93-2.91l-3.88-3.05c-1.08.72-2.45 1.16-4.05 1.16-3.12 0-5.77-2.1-6.72-4.93H1.24v3.15C3.26 21.36 7.34 24 12 24z" fill="#34A853"></path>
<path d="M5.28 14.27c-.25-.72-.38-1.49-.38-2.27s.13-1.55.38-2.27V6.58H1.24C.45 8.15 0 9.92 0 12s.45 3.85 1.24 5.42l4.04-3.15z" fill="#FBBC05"></path>
<path d="M12 4.75c1.77 0 3.35.61 4.6 1.8l3.42-3.42C17.95 1.19 15.24 0 12 0 7.34 0 3.26 2.64 1.24 6.58l4.04 3.15c.95-2.83 3.6-4.98 6.72-4.98z" fill="#EA4335"></path>
</svg>
<span>Continue with Google</span>
</button>
<!-- Apple Option -->
<button class="w-full h-12 rounded-xl bg-surface-container-lowest text-on-surface hover:bg-surface-container-low active:bg-surface-container transition-all flex items-center justify-center gap-space-sm shadow-sm font-body-md-medium text-body-md-medium" type="button">
<svg class="w-5 h-5 shrink-0" fill="currentColor" viewbox="0 0 170 170">
<path d="M150.37 130.25c-2.45 5.66-5.35 10.87-8.71 15.66-4.58 6.53-8.33 11.05-11.22 13.56-4.48 4.12-9.28 6.23-14.42 6.35-3.69 0-8.14-1.05-13.32-3.18-5.19-2.12-9.97-3.17-14.34-3.17-4.58 0-9.49 1.05-14.75 3.17-5.26 2.13-9.5 3.24-12.74 3.35-4.35.13-9.16-1.9-14.42-6.08-3.69-3.04-7.69-7.85-12.02-14.42-6.53-9.88-11.75-21.2-15.66-33.97-3.91-12.77-5.87-24.88-5.87-36.33 0-14.93 3.8-27.18 11.41-36.75 7.6-9.57 17.1-14.42 28.5-14.56 5.54 0 11.39 1.34 17.55 4.02 6.16 2.68 10.23 4.08 12.21 4.2 1.54 0 5.86-1.57 12.98-4.7 7.12-3.13 13.32-4.52 18.6-4.18 14.07 1.06 24.96 6.31 32.67 15.75-12.63 7.6-18.81 18.06-18.54 31.38.27 10.42 4.27 19.18 12.01 26.27 7.74 7.09 16.92 11.04 27.54 11.85-2.28 7.07-5.17 14.3-8.68 21.72zM119.22 31.05c0-7.39 2.66-14.28 7.97-20.67 5.31-6.39 11.87-10.15 19.67-11.28.27 1.07.4 2.14.4 3.21 0 7.39-2.73 14.34-8.18 20.85-5.46 6.51-12.07 10.23-19.86 11.16v-3.27z"></path>
</svg>
<span>Continue with Apple</span>
</button>
</div>
<!-- Legal & Terms Footer -->
<div class="px-space-xs text-center">
<p class="font-label-sm text-label-sm text-on-surface-variant leading-relaxed">
      By continuing, you agree to ZemenGo's
      <a class="text-primary font-bold underline underline-offset-2 hover:text-primary-container" href="#terms">Terms of Service</a>
      and
      <a class="text-primary font-bold underline underline-offset-2 hover:text-primary-container" href="#privacy">Privacy Policy</a>.
    </p>
</div>
</div>
<script>
  (function initLoginInteractions() {
    const input = document.getElementById('phone-input');
    const container = document.getElementById('input-container');
    const clearBtn = document.getElementById('clear-btn');
    const submitBtn = document.getElementById('submit-cta');

    if (!input || !container) return;

    // Format phone with spaces (e.g. 911 234 567)
    input.addEventListener('input', function(e) {
      let raw = e.target.value.replace(/\D/g, '');
      if (raw.length > 9) raw = raw.substring(0, 9);

      let formatted = '';
      if (raw.length > 0) formatted += raw.substring(0, 3);
      if (raw.length >= 4) formatted += ' ' + raw.substring(3, 6);
      if (raw.length >= 7) formatted += ' ' + raw.substring(6, 9);

      e.target.value = formatted;

      if (raw.length > 0) {
        clearBtn.classList.remove('hidden');
        clearBtn.classList.add('flex');
      } else {
        clearBtn.classList.add('hidden');
        clearBtn.classList.remove('flex');
      }

      // Visual feedback when standard 9 digits are entered
      if (raw.length === 9) {
        submitBtn.classList.add('scale-[1.01]');
      } else {
        submitBtn.classList.remove('scale-[1.01]');
      }
    });

    clearBtn.addEventListener('click', function() {
      input.value = '';
      clearBtn.classList.add('hidden');
      clearBtn.classList.remove('flex');
      input.focus();
    });

    // Country picker micro-interaction
    const pickerBtn = document.getElementById('country-picker-btn');
    const pickerCaret = document.getElementById('picker-caret');
    if (pickerBtn && pickerCaret) {
      pickerBtn.addEventListener('click', function() {
        pickerCaret.classList.toggle('rotate-180');
      });
    }

})();
</script></main></body></html>

<!-- ZemenGo - Profile Setup -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-secondary-container": "#004666", "surface-dim": "#d2d9f4", "tertiary": "#005539", "surface-variant": "#dae2fd", "on-tertiary-container": "#6af7b9", "inverse-primary": "#b7c4ff", "surface": "#faf8ff", "on-primary": "#ffffff", "surface-container-highest": "#dae2fd", "surface-container-low": "#f2f3ff", "surface-bright": "#faf8ff", "surface-container-high": "#e2e7ff", "secondary": "#006591", "on-background": "#131b2e", "tertiary-container": "#00704c", "error": "#ba1a1a", "on-surface": "#131b2e", "on-primary-container": "#d6dcff", "on-surface-variant": "#434655", "on-tertiary": "#ffffff", "on-secondary-fixed-variant": "#004c6e", "outline": "#747687", "on-secondary": "#ffffff", "primary": "#003cbb", "secondary-fixed-dim": "#89ceff", "primary-container": "#1852e8", "primary-fixed-dim": "#b7c4ff", "inverse-on-surface": "#eef0ff", "inverse-surface": "#283044", "outline-variant": "#c3c5d8", "background": "#faf8ff", "error-container": "#ffdad6", "tertiary-fixed-dim": "#4edea3", "surface-container-lowest": "#ffffff", "on-error": "#ffffff", "secondary-fixed": "#c9e6ff", "primary-fixed": "#dce1ff", "on-secondary-fixed": "#001e2f", "on-error-container": "#93000a", "surface-tint": "#104ee5", "on-tertiary-fixed": "#002113", "tertiary-fixed": "#6ffbbe", "surface-container": "#eaedff", "secondary-container": "#39b8fd", "on-tertiary-fixed-variant": "#005236", "on-primary-fixed": "#001551", "on-primary-fixed-variant": "#0039b4" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-2xs": "0.25rem", "space-lg": "1.25rem", "space-md": "1rem", "margin": "1rem", "space-2xl": "2rem", "gutter": "1rem", "space-sm": "0.75rem", "space-xs": "0.5rem", "space-xl": "1.5rem" }, fontFamily: { "body-md-medium": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md-medium": ["14px", { lineHeight: "20px", fontWeight: "600" }], "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }], "currency-display": ["22px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "800" }], "headline-lg": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }], "display-lg": ["36px", { lineHeight: "44px", letterSpacing: "-0.03em", fontWeight: "800" }], "label-sm": ["11px", { lineHeight: "14px", letterSpacing: "0.04em", fontWeight: "700" }], "body-lg": ["16px", { lineHeight: "24px", fontWeight: "400" }], "body-md": ["14px", { lineHeight: "20px", fontWeight: "400" }], "display-lg-mobile": ["28px", { lineHeight: "34px", letterSpacing: "-0.02em", fontWeight: "800" }], "headline-md": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }], "body-lg-medium": ["16px", { lineHeight: "24px", fontWeight: "500" }], "headline-sm": ["18px", { lineHeight: "24px", fontWeight: "600" }] } } } };</script><style>@layer base{html,body{width:100vw;min-height:100vh;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface antialiased"><header class="fixed top-0 w-full z-50 pt-safe bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-margin flex items-center justify-between"><button aria-label="Go back" class="min-w-[44px] min-h-[44px] -ml-space-xs flex items-center justify-center rounded-full text-on-surface hover:bg-surface-container active:bg-surface-container-high transition-colors" onclick="history.back()" type="button"><span class="material-symbols-outlined text-[24px]">arrow_back</span></button><div class="flex-1 px-space-sm flex flex-col items-center justify-center"><span class="font-headline-sm text-headline-sm text-on-surface truncate">Profile Setup</span></div><div class="flex items-center gap-space-xs"><button class="min-h-[44px] px-space-sm flex items-center justify-center rounded-full bg-surface-container-low text-primary hover:bg-surface-container active:bg-surface-container-high transition-colors font-label-md text-label-md" type="button"><span class="font-bold">EN</span><span class="text-outline mx-space-2xs">/</span><span class="text-on-surface-variant font-medium">አማ</span></button><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center shrink-0"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></div></header><main class="flex flex-col relative w-full pt-16 bg-surface pb-safe min-h-screen"><div class="flex flex-col w-full pb-36">
<!-- Top Auxiliary Utility Bar -->
<div class="flex items-center justify-between px-margin py-space-sm">
<div class="inline-flex items-center gap-space-xs bg-surface-container-high px-space-sm py-1 rounded-full text-on-surface-variant font-label-sm text-label-sm">
<span class="w-2 h-2 rounded-full bg-secondary-container animate-pulse"></span>
      Step 2 of 3
    </div>
<button class="font-label-md text-label-md text-primary hover:text-primary-container transition-colors py-1 px-space-xs rounded-lg active:bg-surface-container-high" type="button">
      Skip for now
    </button>
</div>
<!-- Header Area -->
<section class="px-margin pt-space-xs pb-space-md">
<h1 class="font-display-lg-mobile text-display-lg-mobile text-on-surface tracking-tight mb-space-2xs">
      Set up your profile
    </h1>
<p class="font-body-md text-body-md text-on-surface-variant max-w-sm">
      Add your details so drivers and couriers can identify you instantly during pickups.
    </p>
</section>
<!-- Profile Photo Section -->
<section class="flex flex-col items-center justify-center py-space-md px-margin">
<div class="relative group cursor-pointer" id="avatarUploadTrigger">
<!-- Outer Pulsing Glow -->
<div class="absolute -inset-1 rounded-full bg-secondary-fixed-dim/40 blur-sm group-hover:bg-secondary-container/50 transition-all"></div>
<!-- Avatar Surface Frame -->
<div class="relative w-28 h-28 rounded-full bg-surface-variant flex items-center justify-center shadow-sm overflow-hidden transition-transform active:scale-95">
<span class="material-symbols-outlined text-primary text-[54px] select-none">person</span>
<div class="absolute inset-0 bg-primary/10 hidden items-center justify-center backdrop-blur-xs" id="previewOverlay"></div>
</div>
<!-- Electric Camera Action Badge -->
<button aria-label="Upload photo" class="absolute bottom-0 right-0 w-10 h-10 rounded-full bg-primary-container text-on-primary flex items-center justify-center shadow-md shadow-primary-container/30 active:scale-90 transition-transform" type="button">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">photo_camera</span>
</button>
</div>
<div class="mt-space-sm text-center">
<span class="font-body-md-medium text-body-md-medium text-primary cursor-pointer hover:underline">
        Tap to upload photo
      </span>
<p class="font-label-sm text-label-sm text-on-surface-variant mt-0.5">
        JPG, PNG up to 5MB
      </p>
</div>
</section>
<!-- Form Fields Canvas -->
<section class="px-margin flex flex-col gap-space-md mt-space-xs">
<!-- Full Name Field -->
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface flex items-center justify-between" for="fullNameInput">
<span>Full Name</span>
<span class="text-tertiary font-label-sm text-label-sm flex items-center gap-0.5">
<span class="material-symbols-outlined text-[14px]">verified</span> Driver visible
        </span>
</label>
<div class="relative flex items-center">
<span class="material-symbols-outlined absolute left-3.5 text-on-surface-variant text-[20px] pointer-events-none">badge</span>
<input class="w-full bg-surface-container-low text-on-surface font-body-md-medium text-body-md-medium pl-11 pr-4 py-3.5 rounded-xl shadow-sm outline-none focus:bg-surface-container-lowest transition-colors" id="fullNameInput" placeholder="e.g., Almaz Kebede" type="text" value="Almaz Kebede"/>
</div>
</div>
<!-- Email Address Field -->
<div class="flex flex-col gap-1.5">
<div class="flex items-center justify-between">
<label class="font-label-md text-label-md text-on-surface" for="emailInput">Email Address</label>
<span class="bg-surface-container-high text-on-surface-variant px-2 py-0.5 rounded-full font-label-sm text-label-sm">
          Optional
        </span>
</div>
<div class="relative flex items-center">
<span class="material-symbols-outlined absolute left-3.5 text-on-surface-variant text-[20px] pointer-events-none">mail</span>
<input class="w-full bg-surface-container-low text-on-surface font-body-md text-body-md pl-11 pr-4 py-3.5 rounded-xl shadow-sm outline-none focus:bg-surface-container-lowest transition-colors" id="emailInput" placeholder="almaz.k@example.com" type="email"/>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant pl-1">
        Used exclusively for ride receipts &amp; parcel tracking
      </span>
</div>
<!-- Preferred Language Selector -->
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface">Preferred Language</label>
<div class="grid grid-cols-2 gap-space-xs p-1 bg-surface-container-low rounded-xl shadow-sm">
<button class="flex items-center justify-center gap-space-2xs py-2.5 rounded-lg font-body-md-medium text-body-md-medium bg-primary-container text-on-primary shadow-sm transition-all" id="langEnBtn" onclick="toggleLang('en')" type="button">
<span class="material-symbols-outlined text-[18px]">check_circle</span>
<span>English</span>
</button>
<button class="flex items-center justify-center gap-space-2xs py-2.5 rounded-lg font-body-md-medium text-body-md-medium bg-transparent text-on-surface-variant hover:text-on-surface transition-all" id="langAmBtn" onclick="toggleLang('am')" type="button">
<span class="material-symbols-outlined text-[18px] opacity-0" id="amCheck">check_circle</span>
<span>አማርኛ</span>
</button>
</div>
</div>
<!-- Default Operating City Field -->
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface">Default City</label>
<div class="flex items-center justify-between p-3.5 bg-surface-container-low rounded-xl shadow-sm">
<div class="flex items-center gap-space-xs min-w-0">
<div class="w-8 h-8 rounded-lg bg-surface-variant flex items-center justify-center text-primary shrink-0">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">location_on</span>
</div>
<div class="flex flex-col min-w-0">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Addis Ababa</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Sheger Dispatch Zone</span>
</div>
</div>
<div class="flex items-center gap-1 bg-secondary-fixed text-on-secondary-fixed px-2.5 py-1 rounded-full font-label-sm text-label-sm shrink-0">
<span class="material-symbols-outlined text-[14px]">lock</span>
<span>Active Hub</span>
</div>
</div>
</div>
<!-- Referral / Addis Promo Accordion -->
<div class="bg-surface-container-low rounded-xl shadow-sm overflow-hidden transition-all">
<button class="w-full flex items-center justify-between p-3.5 text-left active:bg-surface-container" onclick="toggleReferral()" type="button">
<div class="flex items-center gap-space-xs">
<div class="w-8 h-8 rounded-lg bg-tertiary-fixed-dim/30 flex items-center justify-center text-tertiary shrink-0">
<span class="material-symbols-outlined text-[18px]">redeem</span>
</div>
<div class="flex flex-col">
<span class="font-body-md-medium text-body-md-medium text-on-surface">Have a referral code?</span>
<span class="font-label-sm text-label-sm text-tertiary">Get 50 ETB off your first 3 trips</span>
</div>
</div>
<span class="material-symbols-outlined text-on-surface-variant text-[20px] transition-transform duration-200" id="referralChevron">
          expand_more
        </span>
</button>
<div class="hidden px-3.5 pb-3.5 pt-1" id="referralSection">
<div class="flex gap-space-2xs">
<div class="relative flex-1">
<input class="w-full uppercase tracking-wider bg-surface-container-lowest text-on-surface font-body-md-medium text-body-md-medium px-3.5 py-2.5 rounded-lg shadow-sm outline-none" id="refCodeInput" placeholder="e.g. ADDISFREE" type="text"/>
</div>
<button class="px-4 py-2.5 bg-primary text-on-primary font-label-md text-label-md rounded-lg active:scale-95 transition-all shadow-sm" id="applyPromoBtn" onclick="applyPromo()" type="button">
            Apply
          </button>
</div>
<div class="hidden items-center gap-1.5 mt-2 text-tertiary font-label-sm text-label-sm" id="promoSuccess">
<span class="material-symbols-outlined text-[16px]">check_circle</span>
<span>Promo applied! 150 ETB ride credits queued.</span>
</div>
</div>
</div>
</section>
<!-- Visual Proof: City Welcome Graphic Snippet -->
<section class="px-margin mt-space-lg">
<div class="p-3.5 bg-surface-variant rounded-xl flex items-center gap-space-sm shadow-sm">
<div class="w-12 h-12 rounded-lg overflow-hidden shrink-0">
<img class="w-full h-full object-cover" data-alt="Vibrant modern street scene in Addis Ababa, Ethiopia during soft daylight with friendly commuter people walking past clean electric blue dispatch transport vehicles, highly atmospheric photographic style." src="https://lh3.googleusercontent.com/aida-public/AB6AXuAOG4h5Gx_mgxWJzZrXTDZcWn7sMjspObA9I_kuaj4y_H3FzhCPJg0CWGCE5r06P-mjomA8S4m1MyMLAkl2kFYwOKBI_MGhZgW8mUuZdTpkZoSeT3nz5MUXQvosq3nXOkEX4d3WGoHWlRL5aj75yKJwLw-wmawsM5Q3FlMwZR1_xY9iQ7NcMf5F2boDrKsxKUHFRWqkON_jdTHF25x55iSjBD7ZAJ-qvBJXyunrFSLKnlHFwXURAR255A"/>
</div>
<div class="flex flex-col min-w-0 flex-1">
<span class="font-label-md text-label-md text-on-surface-variant truncate">Welcome to ZemenGo Ethiopia</span>
<span class="font-body-md text-body-md text-on-surface font-medium truncate">Ride-hailing, Express Courier &amp; Cargo</span>
</div>
</div>
</section>
<!-- Persistent Floating Bottom Action Bar -->
<div class="fixed bottom-0 left-0 right-0 z-40 bg-surface/90 backdrop-blur-xl px-margin pt-space-xs pb-safe shadow-[0_-8px_24px_rgba(19,27,46,0.08)]">
<div class="max-w-[480px] mx-auto flex flex-col items-center gap-2 pb-3">
<button class="w-full h-[52px] rounded-xl bg-primary-container hover:bg-primary active:scale-[0.99] text-on-primary font-headline-sm text-headline-sm flex items-center justify-center gap-space-xs shadow-md shadow-primary-container/25 transition-all" id="saveBtn" onclick="handleSaveProfile()" type="button">
<span>Save &amp; Continue</span>
<span class="material-symbols-outlined text-[20px]">arrow_forward</span>
</button>
<div class="flex items-center justify-center gap-1 text-on-surface-variant font-label-sm text-label-sm">
<span class="material-symbols-outlined text-[14px] text-tertiary">lock</span>
<span>Your information is encrypted and safe.</span>
</div>
</div>
</div>
</div>
<script>
  function toggleLang(lang) {
    const enBtn = document.getElementById('langEnBtn');
    const amBtn = document.getElementById('langAmBtn');
    const amCheck = document.getElementById('amCheck');
    
    if (lang === 'en') {
      enBtn.className = 'flex items-center justify-center gap-space-2xs py-2.5 rounded-lg font-body-md-medium text-body-md-medium bg-primary-container text-on-primary shadow-sm transition-all';
      enBtn.querySelector('.material-symbols-outlined').classList.remove('opacity-0');
      
      amBtn.className = 'flex items-center justify-center gap-space-2xs py-2.5 rounded-lg font-body-md-medium text-body-md-medium bg-transparent text-on-surface-variant hover:text-on-surface transition-all';
      amCheck.classList.add('opacity-0');
    } else {
      amBtn.className = 'flex items-center justify-center gap-space-2xs py-2.5 rounded-lg font-body-md-medium text-body-md-medium bg-primary-container text-on-primary shadow-sm transition-all';
      amCheck.classList.remove('opacity-0');
      
      enBtn.className = 'flex items-center justify-center gap-space-2xs py-2.5 rounded-lg font-body-md-medium text-body-md-medium bg-transparent text-on-surface-variant hover:text-on-surface transition-all';
      enBtn.querySelector('.material-symbols-outlined').classList.add('opacity-0');
    }
  }

function toggleReferral() {
const section = document.getElementById('referralSection');
const chevron = document.getElementById('referralChevron');
const isHidden = section.classList.contains('hidden');

    if (isHidden) {
      section.classList.remove('hidden');
      chevron.style.transform = 'rotate(180deg)';
    } else {
      section.classList.add('hidden');
      chevron.style.transform = 'rotate(0deg)';
    }

}

function applyPromo() {
const input = document.getElementById('refCodeInput');
const successMsg = document.getElementById('promoSuccess');
const applyBtn = document.getElementById('applyPromoBtn');

    if (input.value.trim().length > 0) {
      applyBtn.innerText = 'Applied';
      applyBtn.classList.replace('bg-primary', 'bg-tertiary');
      successMsg.classList.remove('hidden');
      successMsg.classList.add('flex');
    }

}

function handleSaveProfile() {
const btn = document.getElementById('saveBtn');
btn.innerHTML = `       <span class="material-symbols-outlined animate-spin text-[20px]">progress_activity</span>
      <span>Saving Details...</span>
    `;
setTimeout(() => {
btn.innerHTML = `         <span class="material-symbols-outlined text-[20px]">check_circle</span>
        <span>Profile Ready</span>
      `;
btn.classList.replace('bg-primary-container', 'bg-tertiary');
}, 900);
}
</script></main></body></html>

<!-- ZemenGo - Location Permission -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-secondary-container": "#004666", "surface-dim": "#d2d9f4", "tertiary": "#005539", "surface-variant": "#dae2fd", "on-tertiary-container": "#6af7b9", "inverse-primary": "#b7c4ff", "surface": "#faf8ff", "on-primary": "#ffffff", "surface-container-highest": "#dae2fd", "surface-container-low": "#f2f3ff", "surface-bright": "#faf8ff", "surface-container-high": "#e2e7ff", "secondary": "#006591", "on-background": "#131b2e", "tertiary-container": "#00704c", "error": "#ba1a1a", "on-surface": "#131b2e", "on-primary-container": "#d6dcff", "on-surface-variant": "#434655", "on-tertiary": "#ffffff", "on-secondary-fixed-variant": "#004c6e", "outline": "#747687", "on-secondary": "#ffffff", "primary": "#003cbb", "secondary-fixed-dim": "#89ceff", "primary-container": "#1852e8", "primary-fixed-dim": "#b7c4ff", "inverse-on-surface": "#eef0ff", "inverse-surface": "#283044", "outline-variant": "#c3c5d8", "background": "#faf8ff", "error-container": "#ffdad6", "tertiary-fixed-dim": "#4edea3", "surface-container-lowest": "#ffffff", "on-error": "#ffffff", "secondary-fixed": "#c9e6ff", "primary-fixed": "#dce1ff", "on-secondary-fixed": "#001e2f", "on-error-container": "#93000a", "surface-tint": "#104ee5", "on-tertiary-fixed": "#002113", "tertiary-fixed": "#6ffbbe", "surface-container": "#eaedff", "secondary-container": "#39b8fd", "on-tertiary-fixed-variant": "#005236", "on-primary-fixed": "#001551", "on-primary-fixed-variant": "#0039b4" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-2xs": "0.25rem", "space-lg": "1.25rem", "space-md": "1rem", "margin": "1rem", "space-2xl": "2rem", "gutter": "1rem", "space-sm": "0.75rem", "space-xs": "0.5rem", "space-xl": "1.5rem" }, fontFamily: { "body-md-medium": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md-medium": ["14px", { lineHeight: "20px", fontWeight: "600" }], "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }], "currency-display": ["22px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "800" }], "headline-lg": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }], "display-lg": ["36px", { lineHeight: "44px", letterSpacing: "-0.03em", fontWeight: "800" }], "label-sm": ["11px", { lineHeight: "14px", letterSpacing: "0.04em", fontWeight: "700" }], "body-lg": ["16px", { lineHeight: "24px", fontWeight: "400" }], "body-md": ["14px", { lineHeight: "20px", fontWeight: "400" }], "display-lg-mobile": ["28px", { lineHeight: "34px", letterSpacing: "-0.02em", fontWeight: "800" }], "headline-md": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }], "body-lg-medium": ["16px", { lineHeight: "24px", fontWeight: "500" }], "headline-sm": ["18px", { lineHeight: "24px", fontWeight: "600" }] } } } };</script><style>@layer base{html,body{width:100vw;min-height:100vh;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface antialiased"><main class="flex flex-col relative w-full min-h-screen bg-surface"><div class="flex flex-col w-full px-margin pb-safe pt-space-xs">
<!-- Top Dismiss Bar -->
<div class="flex items-center justify-between w-full h-12">
<div class="flex items-center gap-space-xs">
<span class="inline-flex items-center justify-center w-6 h-6 rounded-full bg-primary-container text-on-primary">
<span class="material-symbols-outlined text-[14px]">near_me</span>
</span>
<span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">ZemenGo</span>
</div>
<button aria-label="Skip for now" class="flex items-center gap-1 px-space-xs py-1 rounded-full text-on-surface-variant hover:text-on-surface hover:bg-surface-container transition-colors" type="button">
<span class="font-body-md-medium text-body-md-medium">Skip</span>
<span class="material-symbols-outlined text-[18px]">close</span>
</button>
</div>
<!-- Hero Visual: Stylized Map Card with Converging Services -->
<div class="relative w-full rounded-xl bg-surface-container-low shadow-sm overflow-hidden mt-space-xs p-space-md">
<!-- Subtle Ambient Radial Glow -->
<div class="absolute -top-12 -right-12 w-48 h-48 rounded-full bg-secondary-container/20 blur-2xl pointer-events-none"></div>
<div class="absolute -bottom-8 -left-8 w-40 h-40 rounded-full bg-primary-container/15 blur-xl pointer-events-none"></div>
<!-- Map Canvas & Radar Graphic -->
<div class="relative flex flex-col items-center justify-center w-full h-56">
<!-- Ambient Animated Radar Pulse Circles -->
<div class="absolute w-44 h-44 rounded-full bg-primary-container/10 animate-ping" style="animation-duration: 3s;"></div>
<div class="absolute w-32 h-32 rounded-full bg-primary-container/15"></div>
<div class="absolute w-20 h-20 rounded-full bg-primary-container/25"></div>
<!-- Stylized Addis Ababa Grid Lines SVG -->
<svg class="absolute inset-0 w-full h-full text-outline-variant/40" fill="none" stroke="currentColor" stroke-dasharray="3 4" stroke-width="1.5" viewbox="0 0 340 220">
<!-- Route Curve to Central Pin -->
<path class="opacity-70" d="M 30,190 C 80,180 110,130 170,110" stroke="#1852E8" stroke-dasharray="0" stroke-width="2.5"></path>
<path class="opacity-80" d="M 310,180 C 270,170 230,140 170,110" stroke="#39B8FD" stroke-dasharray="0" stroke-width="2.5"></path>
<path class="opacity-60" d="M 170,15 C 170,50 170,80 170,110" stroke="#00704C" stroke-dasharray="3 3" stroke-width="2"></path>
<!-- Grid Lines suggesting Addis arterials (Meskel Sq / Bole Rd) -->
<line class="opacity-30" x1="10" x2="330" y1="60" y2="90"></line>
<line class="opacity-30" x1="20" x2="320" y1="130" y2="150"></line>
<line class="opacity-20" x1="100" x2="80" y1="20" y2="200"></line>
<line class="opacity-20" x1="260" x2="240" y1="10" y2="210"></line>
</svg>
<!-- Converging Mini Service Floaters -->
<!-- 1. Ride Hail Car (from Bole) -->
<div class="absolute left-6 bottom-5 flex items-center gap-1.5 px-space-xs py-1 rounded-full bg-surface shadow-sm">
<span class="material-symbols-outlined text-primary-container text-[18px]">local_taxi</span>
<span class="font-label-sm text-label-sm text-on-surface">Bole • 3m</span>
</div>
<!-- 2. Fast Food Delivery (from Kazanchis) -->
<div class="absolute right-5 bottom-8 flex items-center gap-1.5 px-space-xs py-1 rounded-full bg-surface shadow-sm">
<span class="material-symbols-outlined text-secondary text-[18px]">lunch_dining</span>
<span class="font-label-sm text-label-sm text-on-surface">Kazanchis</span>
</div>
<!-- 3. Express Parcel Courier (from Piassa) -->
<div class="absolute top-4 right-10 flex items-center gap-1.5 px-space-xs py-1 rounded-full bg-surface shadow-sm">
<span class="material-symbols-outlined text-tertiary-container text-[18px]">inventory_2</span>
<span class="font-label-sm text-label-sm text-on-surface">Piassa</span>
</div>
<!-- Center Vibrant Pin (Addis Ababa Core Anchor) -->
<div class="relative z-10 flex flex-col items-center">
<div class="relative flex items-center justify-center w-14 h-14 rounded-full bg-primary-container shadow-xl shadow-primary-container/40">
<span class="material-symbols-outlined text-on-primary text-[30px]" style="font-variation-settings: 'FILL' 1;">location_on</span>
<span class="absolute -top-1 -right-1 flex h-4 w-4">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary-fixed-dim opacity-75"></span>
<span class="relative inline-flex rounded-full h-4 w-4 bg-secondary-container"></span>
</span>
</div>
<!-- Shadow Base Indicator -->
<div class="w-8 h-2 rounded-full bg-on-surface/10 blur-[1px] mt-1"></div>
</div>
</div>
<!-- Micro City Tagline -->
<div class="flex items-center justify-center gap-1.5 mt-space-xs pt-space-xs text-on-surface-variant">
<span class="material-symbols-outlined text-[15px] text-tertiary-container">hub</span>
<span class="font-label-sm text-label-sm uppercase tracking-wide">Addis Ababa Live Network</span>
</div>
</div>
<!-- Primary Messaging -->
<div class="flex flex-col text-left mt-space-lg">
<h1 class="font-display-lg-mobile text-display-lg-mobile text-on-surface">
      Enable location access
    </h1>
<p class="font-body-md text-body-md text-on-surface-variant mt-space-2xs">
      To find nearby drivers in Addis, calculate exact pickup times, and deliver hot food directly to your doorstep.
    </p>
</div>
<!-- Value Propositions List -->
<div class="flex flex-col gap-space-sm mt-space-lg">
<!-- Value 1 -->
<div class="flex items-start gap-space-sm p-space-sm rounded-xl bg-surface-container-low shadow-sm">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-primary-fixed text-primary shrink-0">
<span class="material-symbols-outlined text-[22px]">near_me</span>
</div>
<div class="flex flex-col min-w-0">
<span class="font-body-md-medium text-body-md-medium text-on-surface">Accurate Pickups</span>
<span class="font-body-md text-body-md text-on-surface-variant">Zero confusion for drivers at Bole, Kazanchis, or Piassa.</span>
</div>
</div>
<!-- Value 2 -->
<div class="flex items-start gap-space-sm p-space-sm rounded-xl bg-surface-container-low shadow-sm">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-secondary-fixed text-secondary shrink-0">
<span class="material-symbols-outlined text-[22px]">bolt</span>
</div>
<div class="flex flex-col min-w-0">
<span class="font-body-md-medium text-body-md-medium text-on-surface">Real-Time Tracking</span>
<span class="font-body-md text-body-md text-on-surface-variant">Watch your driver or food courier approach in real time on the live map.</span>
</div>
</div>
<!-- Value 3 -->
<div class="flex items-start gap-space-sm p-space-sm rounded-xl bg-surface-container-low shadow-sm">
<div class="flex items-center justify-center w-10 h-10 rounded-full bg-tertiary-fixed text-tertiary shrink-0">
<span class="material-symbols-outlined text-[22px]">verified_user</span>
</div>
<div class="flex flex-col min-w-0">
<span class="font-body-md-medium text-body-md-medium text-on-surface">Emergency &amp; Safety</span>
<span class="font-body-md text-body-md text-on-surface-variant">Instant sharing of your live location with emergency contacts.</span>
</div>
</div>
</div>
<!-- Privacy Reassurance Badge -->
<div class="flex items-center justify-center gap-space-2xs mt-space-md py-space-xs px-space-sm rounded-full bg-surface-container self-center">
<span class="material-symbols-outlined text-on-surface-variant text-[16px]">lock</span>
<span class="font-label-md text-label-md text-on-surface-variant">We only access your location while using the app.</span>
</div>
<!-- Sticky Bottom CTAs -->
<div class="flex flex-col gap-space-xs mt-space-lg mb-space-sm">
<!-- Primary Blue CTA -->
<button class="flex items-center justify-center gap-space-xs w-full h-[52px] rounded-xl bg-primary-container text-on-primary font-body-md-medium text-body-md-medium shadow-md shadow-primary-container/25 active:scale-[0.98] transition-transform" type="button">
<span class="material-symbols-outlined text-[20px]">my_location</span>
<span>Allow Location Access</span>
</button>
<!-- Secondary Soft Action -->
<button class="flex items-center justify-center w-full h-11 rounded-xl bg-transparent text-primary font-body-md-medium text-body-md-medium hover:bg-surface-container transition-colors" type="button">
<span>Not Now (Enter Manually)</span>
</button>
</div>
</div></main></body></html>

<!-- ZemenGo - Splash Screen -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-secondary-container": "#004666", "surface-dim": "#d2d9f4", "tertiary": "#005539", "surface-variant": "#dae2fd", "on-tertiary-container": "#6af7b9", "inverse-primary": "#b7c4ff", "surface": "#faf8ff", "on-primary": "#ffffff", "surface-container-highest": "#dae2fd", "surface-container-low": "#f2f3ff", "surface-bright": "#faf8ff", "surface-container-high": "#e2e7ff", "secondary": "#006591", "on-background": "#131b2e", "tertiary-container": "#00704c", "error": "#ba1a1a", "on-surface": "#131b2e", "on-primary-container": "#d6dcff", "on-surface-variant": "#434655", "on-tertiary": "#ffffff", "on-secondary-fixed-variant": "#004c6e", "outline": "#747687", "on-secondary": "#ffffff", "primary": "#003cbb", "secondary-fixed-dim": "#89ceff", "primary-container": "#1852e8", "primary-fixed-dim": "#b7c4ff", "inverse-on-surface": "#eef0ff", "inverse-surface": "#283044", "outline-variant": "#c3c5d8", "background": "#faf8ff", "error-container": "#ffdad6", "tertiary-fixed-dim": "#4edea3", "surface-container-lowest": "#ffffff", "on-error": "#ffffff", "secondary-fixed": "#c9e6ff", "primary-fixed": "#dce1ff", "on-secondary-fixed": "#001e2f", "on-error-container": "#93000a", "surface-tint": "#104ee5", "on-tertiary-fixed": "#002113", "tertiary-fixed": "#6ffbbe", "surface-container": "#eaedff", "secondary-container": "#39b8fd", "on-tertiary-fixed-variant": "#005236", "on-primary-fixed": "#001551", "on-primary-fixed-variant": "#0039b4" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-2xs": "0.25rem", "space-lg": "1.25rem", "space-md": "1rem", "margin": "1rem", "space-2xl": "2rem", "gutter": "1rem", "space-sm": "0.75rem", "space-xs": "0.5rem", "space-xl": "1.5rem" }, fontFamily: { "body-md-medium": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md-medium": ["14px", { lineHeight: "20px", fontWeight: "600" }], "label-md": ["12px", { lineHeight: "16px", letterSpacing: "0.02em", fontWeight: "600" }], "currency-display": ["22px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "800" }], "headline-lg": ["24px", { lineHeight: "32px", letterSpacing: "-0.02em", fontWeight: "700" }], "display-lg": ["36px", { lineHeight: "44px", letterSpacing: "-0.03em", fontWeight: "800" }], "label-sm": ["11px", { lineHeight: "14px", letterSpacing: "0.04em", fontWeight: "700" }], "body-lg": ["16px", { lineHeight: "24px", fontWeight: "400" }], "body-md": ["14px", { lineHeight: "20px", fontWeight: "400" }], "display-lg-mobile": ["28px", { lineHeight: "34px", letterSpacing: "-0.02em", fontWeight: "800" }], "headline-md": ["20px", { lineHeight: "28px", letterSpacing: "-0.01em", fontWeight: "700" }], "body-lg-medium": ["16px", { lineHeight: "24px", fontWeight: "500" }], "headline-sm": ["18px", { lineHeight: "24px", fontWeight: "600" }] } } } };</script><style>@layer base{html,body{width:100vw;min-height:100vh;margin:0;padding:0;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface antialiased"><main class="flex flex-col relative w-full min-h-screen bg-surface"><div class="flex flex-col w-full relative overflow-hidden select-none bg-primary-container text-on-primary">
<!-- Subtle Radial Glow & Ambient Velocity Waves -->
<div class="absolute inset-0 pointer-events-none flex items-center justify-center overflow-hidden opacity-30">
<div class="w-[520px] h-[520px] rounded-full bg-secondary-container blur-3xl transform scale-110"></div>
<div class="absolute w-[340px] h-[340px] rounded-full bg-surface-bright opacity-20 blur-2xl animate-pulse"></div>
</div>
<!-- Decorative Concentric Geo Rings -->
<div class="absolute inset-0 pointer-events-none flex items-center justify-center opacity-15">
<div class="w-[280px] h-[280px] rounded-full bg-transparent border-2 border-on-primary"></div>
<div class="absolute w-[420px] h-[420px] rounded-full bg-transparent border border-on-primary opacity-60"></div>
<div class="absolute w-[580px] h-[580px] rounded-full bg-transparent border border-on-primary opacity-30"></div>
</div>
<!-- Main Content Layout -->
<div class="relative z-10 flex flex-col justify-between items-center w-full px-margin py-space-2xl" style="min-height: calc(100vh - 4rem);">
<!-- Top Utility & Network Status Bar Indicator -->
<div class="w-full flex items-center justify-between text-on-primary-container/80 pt-space-xs">
<div class="flex items-center gap-space-xs bg-primary/40 px-space-sm py-space-2xs rounded-full backdrop-blur-md shadow-sm">
<span class="w-2 h-2 rounded-full bg-on-tertiary-container animate-ping"></span>
<span class="font-label-sm text-label-sm text-on-primary tracking-wider uppercase">Addis Ababa Core Live</span>
</div>
<div class="flex items-center gap-space-xs text-on-primary/90 font-label-sm text-label-sm bg-primary/30 px-space-sm py-space-2xs rounded-full">
<span class="material-symbols-outlined text-[16px]">bolt</span>
<span>HyperSpeed</span>
</div>
</div>
<!-- Centered Brand Identity -->
<div class="flex flex-col items-center text-center my-auto px-space-sm">
<!-- Glow & Icon Container -->
<div class="relative mb-space-xl flex items-center justify-center">
<!-- Soft back-glow -->
<div class="absolute w-28 h-28 bg-on-primary/30 rounded-full blur-xl transform scale-125"></div>
<!-- Physical Icon Surface Card -->
<div class="relative w-24 h-24 rounded-3xl bg-surface-container-lowest shadow-2xl flex items-center justify-center p-space-sm transform transition-transform duration-500 hover:scale-105">
<!-- Stylized Velocity 'Z' Spark Emblem -->
<svg class="w-14 h-14" fill="none" viewbox="0 0 56 56" xmlns="http://www.w3.org/2000/svg">
<path d="M12 16C12 14.8954 12.8954 14 14 14H40C41.7828 14 42.7937 15.9984 41.7483 17.4449L25.6 39.8H42C43.1046 39.8 44 40.6954 44 41.8V42C44 43.1046 43.1046 44 42 44H15C13.2384 44 12.2223 42.0399 13.2307 40.5898L29.6 17H14C12.8954 17 12 16.1046 12 15V16Z" fill="#1852E8"></path>
<path d="M37 11L45 19L36 21L39 15L37 11Z" fill="#39B8FD"></path>
<circle cx="15.5" cy="42.5" fill="#6AF7B9" r="2.5"></circle>
</svg>
</div>
</div>
<!-- Brand Typography -->
<div class="flex items-baseline justify-center gap-space-2xs">
<h1 class="font-display-lg text-display-lg text-on-primary tracking-tight font-extrabold drop-shadow-sm">
          Zemen<span class="text-secondary-fixed">Go</span>
</h1>
</div>
<!-- Slogan & Multi-service Pill Tag -->
<p class="font-headline-sm text-headline-sm text-on-primary/95 mt-space-2xs font-semibold tracking-wide">
        All of Addis in One Tap
      </p>
<!-- Sub-services Micro-labels -->
<div class="mt-space-md flex items-center gap-space-sm bg-primary/40 px-space-md py-space-xs rounded-full backdrop-blur-md">
<span class="font-label-md text-label-md text-on-primary flex items-center gap-1">
<span class="material-symbols-outlined text-[15px] text-secondary-fixed">directions_car</span> Ride
        </span>
<span class="text-on-primary/40 font-bold">•</span>
<span class="font-label-md text-label-md text-on-primary flex items-center gap-1">
<span class="material-symbols-outlined text-[15px] text-tertiary-fixed">lunch_dining</span> Food
        </span>
<span class="text-on-primary/40 font-bold">•</span>
<span class="font-label-md text-label-md text-on-primary flex items-center gap-1">
<span class="material-symbols-outlined text-[15px] text-secondary-fixed-dim">package_2</span> Package
        </span>
</div>
</div>
<!-- Bottom Footer Elements -->
<div class="w-full flex flex-col items-center gap-space-md pb-space-sm">
<!-- Animated Smooth Progress Pill -->
<div class="w-36 h-1.5 bg-primary/60 rounded-full overflow-hidden relative shadow-inner">
<div class="absolute top-0 bottom-0 left-0 bg-on-primary rounded-full transition-all duration-300 w-1/3" id="splash-loading-bar"></div>
</div>
<!-- Localization & Version Label -->
<div class="flex flex-col items-center gap-space-2xs">
<div class="flex items-center gap-space-xs text-on-primary/90 font-label-md text-label-md">
<span>Proudly built for Ethiopia</span>
<span class="text-sm">🇪🇹</span>
</div>
<div class="flex items-center gap-space-sm font-label-sm text-label-sm text-on-primary-container/70 tracking-wider">
<span>v2.4.0</span>
<span>•</span>
<span>TELEBIRR &amp; CBE READY</span>
</div>
</div>
</div>
</div>
</div>
<script>
  (function () {
    const bar = document.getElementById('splash-loading-bar');
    if (!bar) return;
    let progress = 35;
    const interval = setInterval(() => {
      progress += Math.floor(Math.random() * 18) + 8;
      if (progress >= 96) {
        progress = 96;
        clearInterval(interval);
      }
      bar.style.width = progress + '%';
    }, 280);
  })();
</script></main></body></html>
<!-- ZemenGo - Payment Method Selection -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen"><header class="fixed top-0 w-full z-50 bg-surface/85 backdrop-blur-xl pt-safe shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-space-sm flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Back" class="w-11 h-11 flex items-center justify-center rounded-full hover:bg-surface-container transition-colors" onclick="window.history.back()"><span class="material-symbols-outlined text-on-surface text-[22px]">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm text-on-surface">Payment Method Selection</h1></div><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></header><main class="flex flex-col relative w-full pt-16 bg-surface flex-1"><div class="flex flex-col w-full pb-28">
<!-- Interactive Feedback Pill Notice -->
<div class="px-space-md pt-space-xs">
<div class="bg-secondary-fixed/50 rounded-xl p-space-sm flex items-center justify-between shadow-sm">
<div class="flex items-center gap-space-xs">
<div class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[18px]">verified_user</span>
</div>
<div class="flex flex-col">
<span class="font-label-md text-label-md text-on-surface">End-to-End Secure</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Bank-grade NBE certified gateway</span>
</div>
</div>
<span class="material-symbols-outlined text-secondary text-[20px]">lock</span>
</div>
</div>
<!-- Promotional Cash Back Banner with subtle delight gradient -->
<div class="px-space-md mt-space-sm">
<div class="relative overflow-hidden rounded-xl bg-gradient-to-r from-primary-container via-primary to-secondary p-space-md text-on-primary shadow-md">
<div class="relative z-10 flex items-start justify-between">
<div class="flex flex-col pr-space-md">
<div class="inline-flex items-center gap-1 bg-tertiary-fixed text-on-tertiary-fixed px-2 py-0.5 rounded-full w-fit mb-1.5">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">bolt</span>
<span class="font-label-sm text-label-sm">ADDIS SAVINGS</span>
</div>
<span class="font-headline-sm text-headline-sm">15% Instant Cashback</span>
<p class="font-body-md text-body-md text-primary-fixed mt-1">Pay with Telebirr or CBE Birr on your next 5 rides across town.</p>
</div>
<div class="w-12 h-12 rounded-full bg-surface-container-lowest/20 backdrop-blur-md flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-on-primary text-[28px]">local_offer</span>
</div>
</div>
<div class="absolute -right-4 -bottom-6 w-28 h-28 rounded-full bg-surface-container-lowest/10 blur-xl pointer-events-none"></div>
</div>
</div>
<!-- Section 1: Digital & Mobile Money (Ethiopia Localized) -->
<div class="px-space-md mt-space-lg">
<div class="flex items-center justify-between mb-space-xs">
<h2 class="font-headline-sm text-headline-sm text-on-surface">Mobile Money &amp; Wallets</h2>
<span class="font-label-sm text-label-sm text-primary uppercase">Recommended</span>
</div>
<div class="flex flex-col gap-space-xs" id="mobile-wallet-group">
<!-- Telebirr (Selected) -->
<div class="payment-card cursor-pointer rounded-xl p-space-md bg-surface-container-lowest shadow-md transition-all duration-200" id="card-telebirr" onclick="selectPaymentMethod('telebirr')">
<div class="flex items-start justify-between">
<div class="flex items-start gap-space-sm">
<div class="w-12 h-12 rounded-xl bg-secondary-fixed flex items-center justify-center shrink-0 text-secondary shadow-sm">
<span class="material-symbols-outlined text-[26px]">account_balance_wallet</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">Telebirr</span>
<span class="bg-primary-container text-on-primary font-label-sm text-label-sm px-2 py-0.5 rounded-full">Default</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-on-surface-variant mt-0.5">+251 91***4567</span>
<div class="flex items-center gap-1.5 mt-2 bg-surface-container-low px-2 py-1 rounded-lg w-fit">
<span class="font-label-sm text-label-sm text-on-surface-variant">Balance:</span>
<span class="font-body-md-medium text-body-md-medium text-tertiary">1,450.00 ETB</span>
</div>
</div>
</div>
<div class="w-6 h-6 rounded-full bg-primary flex items-center justify-center shadow-sm radio-indicator" id="radio-telebirr">
<span class="material-symbols-outlined text-on-primary text-[16px]">check</span>
</div>
</div>
</div>
<!-- CBE Birr -->
<div class="payment-card cursor-pointer rounded-xl p-space-md bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" id="card-cbe" onclick="selectPaymentMethod('cbe')">
<div class="flex items-start justify-between">
<div class="flex items-start gap-space-sm">
<div class="w-12 h-12 rounded-xl bg-surface-container-highest flex items-center justify-center shrink-0 text-primary shadow-sm">
<span class="material-symbols-outlined text-[26px]">payments</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">CBE Birr</span>
<span class="bg-secondary-fixed text-on-secondary-fixed font-label-sm text-label-sm px-2 py-0.5 rounded-full">Fast Link</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-on-surface-variant mt-0.5">+251 91***4567</span>
<span class="font-label-sm text-label-sm text-tertiary mt-1">Verified with Commercial Bank of Ethiopia</span>
</div>
</div>
<div class="w-6 h-6 rounded-full bg-surface-container-high flex items-center justify-center radio-indicator" id="radio-cbe">
<span class="material-symbols-outlined text-transparent text-[16px]">check</span>
</div>
</div>
</div>
<!-- E-Birr / CoopPay -->
<div class="payment-card cursor-pointer rounded-xl p-space-md bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" id="card-ebirr" onclick="selectPaymentMethod('ebirr')">
<div class="flex items-start justify-between">
<div class="flex items-start gap-space-sm">
<div class="w-12 h-12 rounded-xl bg-tertiary-fixed flex items-center justify-center shrink-0 text-on-tertiary-fixed shadow-sm">
<span class="material-symbols-outlined text-[26px]">credit_score</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">CoopPay / E-Birr</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-on-surface-variant mt-0.5">Cooperative Bank of Oromia</span>
<span class="font-label-sm text-label-sm text-outline mt-1">Instant digital checkout</span>
</div>
</div>
<div class="w-6 h-6 rounded-full bg-surface-container-high flex items-center justify-center radio-indicator" id="radio-ebirr">
<span class="material-symbols-outlined text-transparent text-[16px]">check</span>
</div>
</div>
</div>
</div>
</div>
<!-- Section 2: Cash & Physical Payment -->
<div class="px-space-md mt-space-lg">
<h2 class="font-headline-sm text-headline-sm text-on-surface mb-space-xs">Cash on Dropoff</h2>
<div class="payment-card cursor-pointer rounded-xl p-space-md bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" id="card-cash" onclick="selectPaymentMethod('cash')">
<div class="flex items-start justify-between">
<div class="flex items-start gap-space-sm">
<div class="w-12 h-12 rounded-xl bg-tertiary/10 flex items-center justify-center shrink-0 text-tertiary shadow-sm">
<span class="material-symbols-outlined text-[26px]">attach_money</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">Cash (ETB)</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant mt-0.5">Pay your driver directly at destination</span>
<div class="flex items-center gap-2 mt-3 pt-3 bg-surface-container-low p-2 rounded-lg" onclick="event.stopPropagation()">
<input class="w-4 h-4 rounded text-primary focus:ring-0 cursor-pointer accent-primary" id="change-needed" type="checkbox"/>
<label class="font-body-md text-body-md text-on-surface cursor-pointer select-none" for="change-needed">Need change for 1,000 / 2,000 ETB note</label>
</div>
</div>
</div>
<div class="w-6 h-6 rounded-full bg-surface-container-high flex items-center justify-center shrink-0 radio-indicator" id="radio-cash">
<span class="material-symbols-outlined text-transparent text-[16px]">check</span>
</div>
</div>
</div>
</div>
<!-- Section 3: Cards & International -->
<div class="px-space-md mt-space-lg">
<h2 class="font-headline-sm text-headline-sm text-on-surface mb-space-xs">Debit &amp; Credit Cards</h2>
<div class="flex flex-col gap-space-xs">
<!-- Existing Card -->
<div class="payment-card cursor-pointer rounded-xl p-space-md bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" id="card-card1" onclick="selectPaymentMethod('card1')">
<div class="flex items-start justify-between">
<div class="flex items-start gap-space-sm">
<div class="w-12 h-12 rounded-xl bg-surface-container-highest flex items-center justify-center shrink-0 text-on-surface-variant shadow-sm">
<span class="material-symbols-outlined text-[26px]">credit_card</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">Visa •••• 4242</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant mt-0.5">Expires 08/28</span>
<span class="font-label-sm text-label-sm text-secondary mt-1">Processed via Dashen Bank Gateway</span>
</div>
</div>
<div class="w-6 h-6 rounded-full bg-surface-container-high flex items-center justify-center radio-indicator" id="radio-card1">
<span class="material-symbols-outlined text-transparent text-[16px]">check</span>
</div>
</div>
</div>
<!-- Add New Card CTA Button -->
<button class="w-full flex items-center justify-center gap-2 py-3.5 px-space-md rounded-xl bg-surface-container-low hover:bg-surface-container text-primary font-headline-sm text-headline-sm shadow-sm transition-all duration-200 active:scale-[0.99]" type="button">
<span class="material-symbols-outlined text-[20px]">add_circle</span>
<span>Add New Card or Bank Account</span>
</button>
</div>
</div>
<!-- Visual Trust Micro-Card -->
<div class="px-space-md mt-space-lg">
<div class="rounded-xl bg-surface-container-lowest p-space-md shadow-sm flex items-center gap-space-sm">
<div class="w-10 h-10 rounded-full bg-secondary-fixed flex items-center justify-center text-secondary shrink-0">
<span class="material-symbols-outlined text-[22px]">shield</span>
</div>
<div class="flex flex-col">
<span class="font-headline-sm text-headline-sm text-on-surface">ZemenGo Fair Fare Guarantee</span>
<span class="font-body-md text-body-md text-on-surface-variant">Zero hidden surcharge fees. Digital receipts sent instantly to your SMS &amp; email.</span>
</div>
</div>
</div>
<!-- Sticky Bottom Sheet Bar -->
<div class="fixed bottom-0 left-0 right-0 z-40 bg-surface-container-lowest/95 backdrop-blur-xl px-space-md py-space-sm shadow-[0_-8px_24px_rgba(15,23,42,0.08)] pb-safe">
<div class="flex items-center justify-between mb-space-xs px-1">
<div class="flex flex-col">
<span class="font-label-sm text-label-sm text-on-surface-variant">SELECTED PAYMENT</span>
<span class="font-body-md-medium text-body-md-medium text-on-surface" id="selected-label">Telebirr (+251 91***4567)</span>
</div>
<div class="text-right">
<span class="font-label-sm text-label-sm text-tertiary">15% DISCOUNT APPLIED</span>
<span class="font-currency-display text-currency-display text-primary block">320.00 ETB</span>
</div>
</div>
<button class="w-full h-[52px] rounded-xl bg-primary-container text-on-primary font-headline-sm text-headline-sm flex items-center justify-center gap-2 shadow-[0_4px_16px_rgba(24,82,232,0.3)] hover:brightness-105 active:scale-[0.98] transition-all" id="apply-btn" onclick="confirmPaymentChoice()" type="button">
<span class="material-symbols-outlined text-[22px]">check_circle</span>
<span>Save &amp; Apply to Ride</span>
</button>
</div>
</div>
<script>
  function selectPaymentMethod(id) {
    const cards = ['telebirr', 'cbe', 'ebirr', 'cash', 'card1'];
    const names = {
      telebirr: 'Telebirr (+251 91***4567)',
      cbe: 'CBE Birr (+251 91***4567)',
      ebirr: 'CoopPay / E-Birr',
      cash: 'Cash on Dropoff',
      card1: 'Visa •••• 4242'
    };

    cards.forEach((method) => {
      const cardEl = document.getElementById('card-' + method);
      const radioEl = document.getElementById('radio-' + method);
      if (!cardEl || !radioEl) return;

      const icon = radioEl.querySelector('.material-symbols-outlined');

      if (method === id) {
        cardEl.classList.remove('bg-surface-container-lowest', 'shadow-sm');
        cardEl.classList.add('bg-surface-container-low', 'shadow-md');
        radioEl.classList.remove('bg-surface-container-high');
        radioEl.classList.add('bg-primary');
        if (icon) {
          icon.classList.remove('text-transparent');
          icon.classList.add('text-on-primary');
        }
      } else {
        cardEl.classList.remove('bg-surface-container-low', 'shadow-md');
        cardEl.classList.add('bg-surface-container-lowest', 'shadow-sm');
        radioEl.classList.remove('bg-primary');
        radioEl.classList.add('bg-surface-container-high');
        if (icon) {
          icon.classList.remove('text-on-primary');
          icon.classList.add('text-transparent');
        }
      }
    });

    const selectedLabel = document.getElementById('selected-label');
    if (selectedLabel && names[id]) {
      selectedLabel.textContent = names[id];
    }

}

function confirmPaymentChoice() {
const btn = document.getElementById('apply-btn');
if (!btn) return;
const originalText = btn.innerHTML;
btn.innerHTML = '<span class="material-symbols-outlined animate-spin text-[22px]">refresh</span> Applied Successfully!';
btn.classList.add('bg-tertiary-container', 'text-on-tertiary');
setTimeout(() => {
btn.innerHTML = originalText;
btn.classList.remove('bg-tertiary-container', 'text-on-tertiary');
}, 1500);
}
</script></main></body></html>

<!-- ZemenGo - Searching for Driver -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen pt-safe pb-safe"><main class="flex flex-col relative w-full h-full bg-surface flex-1"><div class="flex flex-col w-full relative select-none">
<!-- Interactive Radar Map Viewport -->
<div class="relative w-full h-[460px] overflow-hidden bg-surface-container-low">
<!-- Map Background -->
<div class="absolute inset-0 w-full h-full bg-cover bg-center opacity-70" data-location="Bole Medhanealem, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuA9_JvIii0_YuKgjLqCh-_H2bzb9mMtWPclEPc5gi1qWyh5f43XFeaTIs4Mcm6NWk1ztRErVoQXo3e6tx0M8igv2Cu1zkYzJkz3bcQ-Bg0ojioeh8EAwarfv4mkfqp7pS1uU0O0t6jCbWwjQt2Jtn1lpvFURTEd-StMKOugv40NIhB4AFLgHcOVsmzXRN5ed8pcWkjYS5heF2h9-Gpvc6O1uiQBo0re_8SIfazebV4JoI0o7BTyrR7hTQ')"></div>
<!-- Soft Ambient Fog / Tonal Vignette -->
<div class="absolute inset-0 bg-gradient-to-b from-surface/80 via-transparent to-surface pointer-events-none"></div>
<!-- Top Floating Header Bar: Search Status Pill & Close/Minimize -->
<div class="absolute top-4 inset-x-4 flex items-center justify-between z-20">
<div class="flex items-center gap-2 bg-surface-container-lowest/95 backdrop-blur-md px-3.5 py-2 rounded-full shadow-md">
<span class="relative flex h-2.5 w-2.5">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-primary-container opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-primary-container"></span>
</span>
<span class="font-body-md-medium text-body-md text-on-surface">Matching your ride...</span>
<span class="bg-surface-container px-2 py-0.5 rounded-full font-label-sm text-label-sm text-primary font-bold ml-1 tabular-nums" id="search-timer">00:18</span>
</div>
<button aria-label="Minimize search" class="w-10 h-10 rounded-full bg-surface-container-lowest/95 backdrop-blur-md flex items-center justify-center text-on-surface shadow-md active:scale-95 transition-transform">
<span class="material-symbols-outlined text-headline-sm">expand_more</span>
</button>
</div>
<!-- Center Radar Wave & Vehicle Matching Nodes -->
<div class="absolute inset-0 flex items-center justify-center pointer-events-none">
<!-- Expanding Concentric Rings -->
<div class="absolute w-80 h-80 rounded-full bg-primary-container/5 animate-ping" style="animation-duration: 3s; animation-iteration-count: infinite;"></div>
<div class="absolute w-64 h-64 rounded-full bg-secondary-container/10 animate-pulse"></div>
<div class="absolute w-44 h-44 rounded-full bg-primary-container/15"></div>
<!-- Rotating Radar Beam Effect -->
<div class="absolute w-72 h-72 rounded-full pointer-events-none overflow-hidden animate-spin" style="animation-duration: 4.5s; animation-timing-function: linear;">
<div class="w-1/2 h-1/2 bg-gradient-to-br from-primary-container/25 via-secondary-container/10 to-transparent origin-bottom-right rounded-tl-full"></div>
</div>
<!-- User Center Pin (Bole Medhanealem) -->
<div class="relative z-10 flex flex-col items-center">
<div class="w-12 h-12 rounded-full bg-primary-container flex items-center justify-center text-on-primary shadow-lg ring-4 ring-surface-container-lowest">
<span class="material-symbols-outlined text-headline-md" style="font-variation-settings: 'FILL' 1;">person_pin</span>
</div>
<div class="bg-surface-container-lowest/90 backdrop-blur-sm px-2.5 py-0.5 rounded-full shadow-sm mt-1">
<span class="font-label-sm text-label-sm text-on-surface font-semibold">You're here</span>
</div>
</div>
<!-- Nearby Candidate Driver Marker 1 (Toyota Vitz - North East) -->
<div class="absolute -translate-y-20 translate-x-24 z-10 flex items-center gap-1.5 animate-bounce" style="animation-duration: 2.4s;">
<div class="w-9 h-9 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-headline-sm" style="font-variation-settings: 'FILL' 1;">directions_car</span>
</div>
<span class="bg-surface-container-lowest px-2 py-0.5 rounded-full font-label-sm text-label-sm text-on-surface shadow-sm">2 min</span>
</div>
<!-- Nearby Candidate Driver Marker 2 (West) -->
<div class="absolute -translate-x-28 translate-y-6 z-10 flex items-center gap-1.5">
<div class="w-9 h-9 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-on-surface-variant">
<span class="material-symbols-outlined text-headline-sm" style="font-variation-settings: 'FILL' 1;">local_taxi</span>
</div>
<span class="bg-surface-container-lowest px-2 py-0.5 rounded-full font-label-sm text-label-sm text-on-surface-variant shadow-sm">4 min</span>
</div>
<!-- Nearby Candidate Driver Marker 3 (South East) -->
<div class="absolute translate-y-28 translate-x-16 z-10 flex items-center gap-1.5">
<div class="w-9 h-9 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-on-surface-variant">
<span class="material-symbols-outlined text-headline-sm" style="font-variation-settings: 'FILL' 1;">directions_car</span>
</div>
<span class="bg-surface-container-lowest px-2 py-0.5 rounded-full font-label-sm text-label-sm text-on-surface-variant shadow-sm">3 min</span>
</div>
</div>
<!-- Active Broadcast Status Pill (Above Bottom Sheet) -->
<div class="absolute bottom-4 inset-x-4 flex justify-center z-20">
<div class="flex items-center gap-2 bg-inverse-surface/90 text-inverse-on-surface px-4 py-2 rounded-full shadow-lg backdrop-blur-sm">
<span class="material-symbols-outlined text-body-md text-tertiary-fixed animate-spin" style="animation-duration: 2s;">sync</span>
<span class="font-body-md text-body-md font-medium">Connecting with nearby drivers in Bole...</span>
</div>
</div>
</div>
<!-- Dynamic Bottom Sheet / Trip Request Card -->
<div class="flex flex-col bg-surface-container-lowest rounded-t-3xl -mt-6 relative z-30 shadow-xl px-4 pt-3 pb-6">
<!-- Grab Bar Handle -->
<div class="w-12 h-1.5 bg-outline-variant/60 rounded-full mx-auto mb-4"></div>
<!-- Vehicle Class & Estimated Fare Header -->
<div class="flex items-center justify-between bg-surface-container-low p-3.5 rounded-2xl mb-4">
<div class="flex items-center gap-3">
<div class="w-12 h-12 rounded-xl bg-surface-container-highest flex items-center justify-center text-primary-container">
<span class="material-symbols-outlined text-display-lg-mobile" style="font-variation-settings: 'FILL' 1;">directions_car</span>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-1.5">
<span class="font-headline-sm text-headline-sm text-on-surface">Economy</span>
<span class="bg-surface-variant text-on-surface-variant font-label-sm text-label-sm px-1.5 py-0.5 rounded-full">4 seats</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant">Toyota Vitz or similar</span>
</div>
</div>
<div class="flex flex-col items-end">
<span class="font-currency-display text-currency-display text-on-surface">120 ETB</span>
<div class="flex items-center gap-1 bg-secondary-fixed/50 px-2 py-0.5 rounded-full mt-0.5">
<span class="material-symbols-outlined text-label-sm text-secondary" style="font-variation-settings: 'FILL' 1;">account_balance_wallet</span>
<span class="font-label-sm text-label-sm text-secondary font-bold">Telebirr</span>
</div>
</div>
</div>
<!-- Route Overview Timeline -->
<div class="bg-surface p-3.5 rounded-2xl flex flex-col gap-3 mb-4">
<div class="flex items-start gap-3">
<div class="flex flex-col items-center mt-1">
<span class="w-3 h-3 rounded-full bg-tertiary ring-2 ring-tertiary-fixed"></span>
<span class="w-0.5 h-7 bg-outline-variant my-1"></span>
<span class="w-3 h-3 rounded-full bg-primary-container ring-2 ring-primary-fixed"></span>
</div>
<div class="flex-1 flex flex-col justify-between h-14">
<div class="flex justify-between items-center">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Bole Medhanealem</span>
<span class="font-label-md text-label-md text-on-surface-variant">Pickup</span>
</div>
<div class="flex justify-between items-center">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Kazanchis Total</span>
<span class="font-label-md text-label-md text-on-surface-variant">Drop-off</span>
</div>
</div>
</div>
<!-- Distance and Travel Duration Chips -->
<div class="flex items-center justify-between pt-2">
<div class="flex items-center gap-3">
<div class="flex items-center gap-1 text-on-surface-variant">
<span class="material-symbols-outlined text-body-md">route</span>
<span class="font-body-md text-body-md">6.4 km</span>
</div>
<span class="text-outline-variant">•</span>
<div class="flex items-center gap-1 text-on-surface-variant">
<span class="material-symbols-outlined text-body-md">schedule</span>
<span class="font-body-md text-body-md">18 min est.</span>
</div>
</div>
<span class="font-label-md text-label-md text-tertiary font-semibold flex items-center gap-1">
<span class="material-symbols-outlined text-body-md">flash_on</span> No Surge
        </span>
</div>
</div>
<!-- Contact & Comfort Preferences Pill -->
<div class="flex items-center justify-between bg-surface-container-high/60 px-3.5 py-2.5 rounded-xl mb-4">
<div class="flex items-center gap-2 text-on-surface-variant">
<span class="material-symbols-outlined text-headline-sm text-primary">phone_in_talk</span>
<span class="font-body-md text-body-md text-on-surface">Driver will call upon arrival</span>
</div>
<button class="font-label-md text-label-md text-primary font-bold px-2 py-1 rounded-lg hover:bg-surface-variant/40 active:scale-95 transition-transform">
        Edit
      </button>
</div>
<!-- Action Section: High Acceptance Indicator & Cancel Button -->
<div class="flex flex-col gap-3">
<!-- Cancellation Button with Light Danger Accent -->
<button class="w-full h-13 py-3.5 rounded-xl bg-error-container text-on-error-container font-headline-sm text-headline-sm text-center font-bold active:scale-[0.98] transition-all flex items-center justify-center gap-2" id="cancel-booking-btn">
<span class="material-symbols-outlined text-headline-sm">close</span>
<span>Cancel Request</span>
</button>
<!-- Reassurance Footer Badge -->
<div class="flex items-center justify-center gap-1.5 pt-1 text-on-surface-variant">
<span class="material-symbols-outlined text-body-md text-tertiary font-bold" style="font-variation-settings: 'FILL' 1;">verified</span>
<span class="font-label-md text-label-md">High driver acceptance rate in your zone (<span class="font-bold text-on-surface">98%</span>)</span>
</div>
</div>
</div>
</div>
<script>
  (function initRadarTimer() {
    let seconds = 18;
    const timerEl = document.getElementById('search-timer');
    if (timerEl) {
      setInterval(() => {
        seconds++;
        const mins = Math.floor(seconds / 60);
        const remSecs = seconds % 60;
        timerEl.textContent = `${mins.toString().padStart(2, '0')}:${remSecs.toString().padStart(2, '0')}`;
      }, 1000);
    }

    const cancelBtn = document.getElementById('cancel-booking-btn');
    if (cancelBtn) {
      cancelBtn.addEventListener('click', () => {
        if (confirm('Cancel driver search for Bole Medhanealem?')) {
          cancelBtn.textContent = 'Canceling...';
          cancelBtn.classList.add('opacity-50');
        }
      });
    }

})();
</script></main></body></html>

<!-- ZemenGo - Destination Selection -->
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"><meta content="mobile_stack" name="shell-type"><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script></head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen"><header class="fixed top-0 w-full z-50 bg-surface/85 backdrop-blur-xl pt-safe shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="w-full flex items-center justify-between px-6 pt-3 pb-1 select-none pointer-events-none"><span class="text-[14px] font-bold tracking-tight text-on-surface">9:41</span><div class="w-24 h-4 bg-on-background rounded-full mx-auto"></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-[15px]">signal_cellular_alt</span><span class="material-symbols-outlined text-[15px]">wifi</span><span class="material-symbols-outlined text-[18px]">battery_full</span></div></div><div class="h-14 px-4 flex items-center justify-between"><div class="flex items-center gap-3"><button aria-label="Back" class="w-10 h-10 flex items-center justify-center rounded-full bg-surface-container-low hover:bg-surface-container active:scale-95 transition-all text-on-surface" onclick="window.history.back()"><span class="material-symbols-outlined text-[20px]">arrow_back</span></button><h1 class="font-headline-sm text-[19px] font-bold text-on-surface tracking-tight">Select Destination</h1></div><div class="flex items-center gap-2"><button aria-label="Favorites" class="w-9 h-9 rounded-full bg-surface-container-low flex items-center justify-center text-on-surface-variant hover:text-primary transition-colors"><span class="material-symbols-outlined text-[19px]">bookmark_border</span></button><div class="w-9 h-9 rounded-full bg-primary-fixed flex items-center justify-center text-primary font-bold text-[13px]"><span class="">ZM</span></div></div></div></header><main class="flex flex-col relative w-full pt-24 bg-surface flex-1"><div class="flex flex-col w-full pb-safe"><!-- Interactive Waypoint Input Block --><div class="px-4 pt-2 pb-3"><div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/30 shadow-[0_4px_20px_rgba(19,27,46,0.06)] p-4 flex flex-col gap-3 relative"><!-- Connector line between nodes --><div class="absolute left-[29px] top-[40px] bottom-[42px] w-[2px] bg-gradient-to-b from-tertiary via-outline-variant/60 to-primary rounded-full"></div><!-- Pickup Row (Preset) --><div class="flex items-center gap-3 relative z-10"><div class="w-7 h-7 rounded-full bg-tertiary-fixed/30 flex items-center justify-center shrink-0"><span class="w-3 h-3 rounded-full bg-tertiary shadow-[0_0_8px_rgba(0,112,76,0.35)]"></span></div><div class="flex-1 min-w-0 bg-surface-container-low/70 border border-outline-variant/20 rounded-xl px-3.5 py-2 flex items-center justify-between"><div class="flex flex-col min-w-0"><div class="flex items-center gap-1.5"><span class="font-label-sm text-[10px] text-tertiary uppercase font-bold tracking-wider">Pickup</span><span class="text-[11px] text-outline">• Current location</span></div><span class="font-body-md-medium text-body-md-medium text-on-surface truncate font-semibold">Bole Medhanealem, Addis Ababa</span></div><button aria-label="Edit pickup point" class="w-7 h-7 rounded-full bg-surface-container flex items-center justify-center text-on-surface-variant hover:text-primary active:scale-95 transition-all shrink-0 ml-2" type="button"><span class="material-symbols-outlined text-[16px]">edit_location_alt</span></button></div></div><!-- Destination Row --><div class="flex items-center gap-3 relative z-10"><div class="w-7 h-7 rounded-lg bg-primary-fixed/40 flex items-center justify-center shrink-0"><span class="w-3 h-3 rounded-sm bg-primary shadow-[0_0_8px_rgba(24,82,232,0.4)]"></span></div><div class="flex-1 min-w-0 bg-surface-container-high/60 border-2 border-primary/20 rounded-xl px-3.5 py-2 flex items-center gap-2 shadow-sm focus-within:border-primary transition-colors"><span class="material-symbols-outlined text-primary text-[20px] shrink-0">search</span><input autofocus="" class="w-full bg-transparent font-body-md-medium text-[15px] text-on-surface placeholder:text-outline focus:outline-none font-semibold" id="destination-input" placeholder="Search destination in Addis Ababa..." type="text" value="Kazanchis"><button aria-label="Clear or add stop" class="w-7 h-7 rounded-full bg-primary text-on-primary flex items-center justify-center active:scale-90 transition-transform shrink-0 shadow-sm" type="button"><span class="material-symbols-outlined text-[16px]">add</span></button></div></div></div></div><!-- Quick Select Category Chips --><div class="px-4 pt-1 pb-2 flex items-center justify-between"><span class="font-label-sm text-outline uppercase tracking-wider font-bold text-[11px]">Quick Select</span><span class="font-label-sm text-[11px] text-primary flex items-center gap-1 font-bold bg-primary-fixed/30 px-2 py-0.5 rounded-full"><span class="material-symbols-outlined text-[13px]">bolt</span> Live Traffic Sync</span></div><div class="w-full overflow-x-auto px-4 pb-3 flex gap-2 no-scrollbar"><button class="flex items-center gap-2 px-3.5 py-2 rounded-full bg-surface-container-lowest border border-primary/30 text-primary shadow-sm hover:bg-surface-container-low active:scale-95 transition-all shrink-0"><span class="material-symbols-outlined text-[18px]">flight_takeoff</span><span class="font-body-md-medium text-[13px] font-semibold">Airport</span></button><button class="flex items-center gap-2 px-3.5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/40 text-on-surface shadow-sm hover:bg-surface-container-low active:scale-95 transition-all shrink-0"><span class="material-symbols-outlined text-on-surface-variant text-[18px]">work</span><span class="font-body-md-medium text-[13px] font-semibold">Work</span></button><button class="flex items-center gap-2 px-3.5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/40 text-on-surface shadow-sm hover:bg-surface-container-low active:scale-95 transition-all shrink-0"><span class="material-symbols-outlined text-on-surface-variant text-[18px]">local_mall</span><span class="font-body-md-medium text-[13px] font-semibold">Shopping Malls</span></button><button class="flex items-center gap-2 px-3.5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/40 text-on-surface shadow-sm hover:bg-surface-container-low active:scale-95 transition-all shrink-0"><span class="material-symbols-outlined text-on-surface-variant text-[18px]">local_hospital</span><span class="font-body-md-medium text-[13px] font-semibold">Hospitals</span></button><button class="flex items-center gap-2 px-3.5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/40 text-on-surface shadow-sm hover:bg-surface-container-low active:scale-95 transition-all shrink-0"><span class="material-symbols-outlined text-on-surface-variant text-[18px]">school</span><span class="font-body-md-medium text-[13px] font-semibold">Universities</span></button></div><!-- Recent Destinations List --><div class="flex-1 px-4 pt-2 flex flex-col gap-2.5 pb-28"><div class="flex items-center justify-between pb-1"><h2 class="font-headline-sm text-[17px] font-bold text-on-surface">Recent &amp; Suggested</h2><button class="font-label-sm text-[12px] font-semibold text-secondary hover:underline">Clear History</button></div><!-- Location Item 1: Kazanchis --><div class="bg-surface-container-lowest rounded-2xl p-3.5 border border-primary/25 shadow-[0_2px_12px_rgba(24,82,232,0.06)] flex items-center justify-between active:bg-surface-container-low transition-colors cursor-pointer"><div class="flex items-center gap-3 min-w-0"><div class="w-10 h-10 rounded-xl bg-primary-fixed flex items-center justify-center text-primary shrink-0"><span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">history</span></div><div class="flex flex-col min-w-0"><div class="flex items-center gap-2"><span class="font-body-md-medium text-[15px] font-bold text-on-surface truncate">Kazanchis, Menelik II Ave</span><span class="px-2 py-0.5 rounded-full bg-tertiary-fixed text-on-tertiary-fixed text-[10px] font-bold shrink-0">Fastest</span></div><span class="font-label-md text-outline truncate text-[12px]">Near UNECA HQ &amp; Interlux Hotel</span></div></div><div class="flex flex-col items-end shrink-0 pl-2"><span class="font-body-md-medium text-[14px] font-bold text-primary">18 min</span><span class="font-label-sm text-[11px] text-outline font-medium">6.4 km</span></div></div><!-- Location Item 2: Bole Airport --><div class="bg-surface-container-lowest rounded-2xl p-3.5 border border-outline-variant/30 shadow-sm flex items-center justify-between active:bg-surface-container-low transition-colors cursor-pointer"><div class="flex items-center gap-3 min-w-0"><div class="w-10 h-10 rounded-xl bg-secondary-fixed flex items-center justify-center text-secondary shrink-0"><span class="material-symbols-outlined text-[20px]">local_airport</span></div><div class="flex flex-col min-w-0"><span class="font-body-md-medium text-[15px] font-bold text-on-surface truncate">Bole Int'l Airport (ADD)</span><span class="font-label-md text-outline truncate text-[12px]">Terminal 2 • International Departures</span></div></div><div class="flex flex-col items-end shrink-0 pl-2"><span class="font-body-md-medium text-[14px] font-bold text-on-surface">12 min</span><span class="font-label-sm text-[11px] text-outline font-medium">4.1 km</span></div></div><!-- Location Item 3: Mexico Square --><div class="bg-surface-container-lowest rounded-2xl p-3.5 border border-outline-variant/30 shadow-sm flex items-center justify-between active:bg-surface-container-low transition-colors cursor-pointer"><div class="flex items-center gap-3 min-w-0"><div class="w-10 h-10 rounded-xl bg-surface-container flex items-center justify-center text-on-surface-variant shrink-0"><span class="material-symbols-outlined text-[20px]">location_on</span></div><div class="flex flex-col min-w-0"><span class="font-body-md-medium text-[15px] font-bold text-on-surface truncate">Mexico Square</span><span class="font-label-md text-outline truncate text-[12px]">Genet Hotel Area • Kirkos Sub City</span></div></div><div class="flex flex-col items-end shrink-0 pl-2"><span class="font-body-md-medium text-[14px] font-bold text-on-surface">22 min</span><span class="font-label-sm text-[11px] text-outline font-medium">8.3 km</span></div></div><!-- Location Item 4: CMC Roundabout --><div class="bg-surface-container-lowest rounded-2xl p-3.5 border border-outline-variant/30 shadow-sm flex items-center justify-between active:bg-surface-container-low transition-colors cursor-pointer"><div class="flex items-center gap-3 min-w-0"><div class="w-10 h-10 rounded-xl bg-surface-container flex items-center justify-center text-on-surface-variant shrink-0"><span class="material-symbols-outlined text-[20px]">apartment</span></div><div class="flex flex-col min-w-0"><span class="font-body-md-medium text-[15px] font-bold text-on-surface truncate">CMC Roundabout</span><span class="font-label-md text-outline truncate text-[12px]">Near Tsehay Real Estate &amp; St. Michael</span></div></div><div class="flex flex-col items-end shrink-0 pl-2"><span class="font-body-md-medium text-[14px] font-bold text-on-surface">30 min</span><span class="font-label-sm text-[11px] text-outline font-medium">11.5 km</span></div></div><!-- Visual City Landmark Context Banner --><div class="mt-2 rounded-2xl overflow-hidden relative shadow-sm border border-outline-variant/30"><div class="w-full h-24 bg-cover bg-center" data-alt="Modern skyline of Addis Ababa, Ethiopia during sunny golden hour with the Commercial Bank of Ethiopia headquarter tower standing proudly in background, soft sunlight reflection, clean modern vibe" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCKhHh_y7mFPtWSCAxvt-K18x1WfNb-XbchMypFQzH6iS1rkG0bLJ5GJlhx0Ws90lOVdfnfcSbP6SoFNOyaIo6hURKUoUGSziH84uHlJs2pzGoGvHa6L6ZpN1R661psnf4TOqO7II3fNKATohCenLonU5SbaQUhDOOQzOHgyiqCCQgp57cQ5kN3SfRTVBNFYBRuUM5CBqC6PCpu__1CvTsug6hi3fqqlB_n_pQXHniFcVODNVIIWWQU9g')"></div><div class="absolute inset-0 bg-gradient-to-r from-on-background/90 via-on-background/60 to-transparent flex items-center px-4"><div class="flex flex-col"><div class="flex items-center gap-1.5 text-tertiary-fixed"><span class="material-symbols-outlined text-[16px]">verified</span><span class="font-label-sm text-[11px] uppercase tracking-wider font-bold">Live Dispatch Ready</span></div><span class="font-headline-sm text-[17px] font-bold text-surface-container-lowest">840+ Zemen Drivers Active</span><span class="font-label-md text-[12px] text-surface-variant font-medium">Average arrival under 4 minutes across Bole</span></div></div></div></div><!-- Persistent Floating Bottom Action --><div class="fixed bottom-0 left-0 right-0 p-4 bg-gradient-to-t from-surface via-surface/95 to-transparent flex flex-col items-center gap-2 pointer-events-none"><button class="pointer-events-auto w-full max-w-[480px] h-[52px] rounded-xl bg-primary hover:bg-primary-container text-on-primary shadow-[0_8px_24px_rgba(24,82,232,0.35)] flex items-center justify-center gap-2 font-body-lg-medium text-[15px] font-bold active:scale-[0.99] transition-all" type="button"><span class="material-symbols-outlined text-[20px]">map</span><span class="">Choose location on map</span></button></div></div><script>document.querySelectorAll('.cursor-pointer').forEach(item => { item.addEventListener('click', () => { const destinationTitle = item.querySelector('.truncate')?.textContent; const input = document.getElementById('destination-input'); if (input && destinationTitle) { input.value = destinationTitle; } }); });</script></main>

</body></html>

<!-- ZemenGo - Ride Options & Fare Breakdown -->
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"><meta content="mobile_blank" name="shell-type"><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script></head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen pt-safe pb-safe"><main class="flex flex-col relative w-full h-full bg-surface flex-1"><div class="w-full flex items-center justify-between px-6 pt-3 pb-2 select-none relative z-30 bg-surface"><div class="text-[14px] font-bold tracking-tight text-on-surface">9:41</div><div class="w-28 h-6 bg-on-background rounded-full mx-auto flex items-center justify-center gap-1.5 px-2"><div class="w-2.5 h-2.5 rounded-full bg-tertiary-fixed-dim animate-pulse"></div><div class="w-2 h-2 rounded-full bg-surface-container-highest/40"></div></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-[16px]">signal_cellular_4_bar</span><span class="material-symbols-outlined text-[16px]">wifi</span><span class="material-symbols-outlined text-[18px]">battery_full</span></div></div><div class="flex flex-col w-full relative">
<!-- Top Map Section (Route Preview Bole -> Kazanchis) -->
<div class="relative px-4 pt-1 pb-3"><div class="relative w-full h-56 rounded-2xl overflow-hidden shadow-sm border border-outline-variant/30"><div class="w-full h-full bg-cover bg-center" data-location="Bole Medhanealem to Kazanchis, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCMGU1QhU7s5koQci-sTBVl6hQWhE5qo0HEP9eQwxtnPEWH_VwvaXzi5iSpYfLejCIUaKZLYqcK9zwBkSo5WaNJDeAMV4bQvDqSgQYDtaMP--HaF_zeTzdmSrx6UqfkJM2bl2tuA_ACbLAXsOfC7ySmLlk352E09zR_ghkvUE1f-N5h4aAa9zM5PjDuP5TLQKz2IPoVTFNNn_d4CaSwH5Ku4eAM1Go5XpjLb5CsY1sEop2gYGGdjCor2g')"></div><div class="absolute inset-0 bg-gradient-to-b from-on-background/20 via-transparent to-on-background/30 pointer-events-none"></div><div class="absolute top-3 left-3 right-3 flex items-center justify-between z-10"><button class="w-9 h-9 rounded-full bg-surface-container-lowest/95 backdrop-blur-md text-on-surface shadow-md flex items-center justify-center transition-transform active:scale-95 border border-outline-variant/20"><span class="material-symbols-outlined text-[18px]">arrow_back</span></button><div class="flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-lowest/95 backdrop-blur-md shadow-md text-on-surface border border-outline-variant/20"><span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span><span class="font-body-md-medium text-label-md">6.4 km</span><span class="text-outline-variant font-label-md">•</span><span class="font-headline-sm text-label-md text-primary font-bold">18 min</span></div><button class="w-9 h-9 rounded-full bg-surface-container-lowest/95 backdrop-blur-md text-on-surface shadow-md flex items-center justify-center transition-transform active:scale-95 border border-outline-variant/20"><span class="material-symbols-outlined text-[18px]">my_location</span></button></div><div class="absolute bottom-3 left-3 flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-surface-container-lowest/90 backdrop-blur-md text-on-surface text-label-sm shadow-sm border border-outline-variant/30"><span class="w-2 h-2 rounded-full bg-tertiary"></span><span class="font-body-md-medium">Bole Medhanealem</span><span class="material-symbols-outlined text-[14px] text-outline">arrow_forward</span><span class="font-body-md-medium text-primary">Kazanchis</span></div></div></div>
<!-- Bottom Sheet (Ride Options & Fare Breakdown) -->
<div class="relative w-full bg-surface-container-lowest rounded-t-[28px] shadow-2xl pt-3 pb-8 px-4 flex flex-col z-20">
<!-- Drag Handle -->
<div class="w-12 h-1.5 bg-outline-variant/60 rounded-full mx-auto mb-4"></div>
<!-- Sheet Header -->
<div class="flex items-center justify-between mb-4">
<div>
<h1 class="font-headline-md text-headline-md text-on-surface tracking-tight">Choose a Ride</h1>
<p class="font-body-md text-label-md text-on-surface-variant">Instant dispatch in Addis Ababa</p>
</div>
<button class="flex items-center gap-1 px-3 py-1.5 rounded-full bg-surface-container-high text-primary font-body-md-medium text-label-md transition-colors active:bg-primary-fixed" id="toggle-breakdown-btn">
<span class="material-symbols-outlined text-[16px]">receipt_long</span>
<span class="">Breakdown</span>
</button>
</div>
<!-- Vehicle Class Selection Cards -->
<div class="flex flex-col gap-2.5 mb-4" id="vehicle-list">
<!-- 1. Economy (Active State) -->
<div class="vehicle-card group relative p-3 rounded-2xl bg-surface-container-low transition-all duration-200 cursor-pointer shadow-sm selected-card border-2 border-primary" data-price="120" data-vehicle="Economy"><div class="absolute top-3 right-3 flex items-center gap-1.5"><span class="w-5 h-5 rounded-full bg-primary text-on-primary flex items-center justify-center check-badge shadow-sm"><span class="material-symbols-outlined text-[13px]">check</span></span></div><div class="flex items-center gap-3"><div class="w-14 h-14 rounded-xl bg-surface-container-lowest flex items-center justify-center flex-shrink-0 overflow-hidden p-1 shadow-sm border border-outline-variant/30"><img class="w-full h-full object-contain" data-alt="Modern compact white hatchback Suzuki Dzire city taxi in clean Addis Ababa urban background studio lighting vibrant angle" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBAYbK1tzcvc0dPK16PKVIDXGyhQb5bjyaDzc8dN-8jn_jFp6nF_bOWUWfZzIc7H9UAf7Zl_y8XS22fF-6dgQQ2QVAWyFzhQu2CdZ-_AbhcLzmsovxqAsLWeGOsj2Wi0C3kLjHtkFgtiZxzFDKkl_O6d5NMJr3AaweGNl_8SvJbKDYRNjatmXWDffXTRnTDyUWcMAgGo_pnM0yKDvcPWjfRrE0ZUwEnIhoWA3xQxfjfF84ZHeS0wfdO8A"></div><div class="flex-1 min-w-0 pr-8"><div class="flex items-center gap-1.5"><span class="font-headline-sm text-body-lg-medium text-on-surface font-bold">Economy</span><span class="flex items-center gap-0.5 text-on-surface-variant text-label-sm bg-surface-container px-1.5 py-0.5 rounded-full font-medium"><span class="material-symbols-outlined text-[12px]">person</span>4</span><span class="px-1.5 py-0.2 rounded bg-tertiary-fixed text-on-tertiary-fixed text-[10px] font-bold">3 min</span></div><p class="font-body-md text-label-sm text-on-surface-variant truncate mt-0.5">Toyota Vitz • Suzuki Dzire</p></div><div class="text-right flex-shrink-0"><div class="font-currency-display text-currency-display text-primary font-extrabold">120 <span class="font-body-md text-label-sm font-semibold text-on-surface">ETB</span></div><div class="font-body-md text-[11px] text-outline line-through">145 ETB</div></div></div></div>
<!-- 2. Comfort -->
<div class="vehicle-card group relative p-3 rounded-2xl bg-surface-container-lowest transition-all duration-200 cursor-pointer shadow-sm hover:bg-surface-container-low border border-outline-variant/30" data-price="210" data-vehicle="Comfort"><div class="flex items-center gap-3"><div class="w-14 h-14 rounded-xl bg-surface-container flex items-center justify-center flex-shrink-0 overflow-hidden p-1 border border-outline-variant/20"><img class="w-full h-full object-contain" data-alt="Sleek midnight black Toyota Corolla executive sedan side profile polished studio shot crisp reflection" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDkdpRxRDwqIYdvu8U91lNQnGBjIm98A2QuXbc-gW0ICz70ftuIE_j8X6Do1Z3knEB8y6rMZ1umFMoAUKlhUenmwxDBUbYwrYLDwpHZOYMPfnJGvSuPGIHaOgtJlM8x2XNoixJZn6dCBfi4EVTFHbLTuS-IHdjt0de4Hjx09EGKR7wtfOTU4nSPdlqvAtyI8MunjZpUkPwSsfoBHLVg7-9kv6dpviY7BGXyGKxDgdAvz9XvSLJMXvK6TA"></div><div class="flex-1 min-w-0 pr-2"><div class="flex items-center gap-1.5"><span class="font-headline-sm text-body-lg-medium text-on-surface font-semibold">Comfort</span><span class="flex items-center gap-0.5 text-on-surface-variant text-label-sm bg-surface-container-highest px-1.5 py-0.5 rounded-full"><span class="material-symbols-outlined text-[12px]">person</span>4</span><span class="px-1.5 py-0.2 rounded bg-surface-container-highest text-on-surface-variant text-[10px] font-bold">5 min</span></div><p class="font-body-md text-label-sm text-on-surface-variant truncate mt-0.5">Toyota Corolla • Elantra • AC</p></div><div class="text-right flex-shrink-0"><div class="font-currency-display text-currency-display text-on-surface font-bold">210 <span class="font-body-md text-label-sm text-on-surface-variant">ETB</span></div><div class="font-body-md text-label-sm text-tertiary font-medium">Spacious</div></div></div></div>
<!-- 3. XL Minivan -->
<div class="vehicle-card group relative p-3 rounded-2xl bg-surface-container-lowest transition-all duration-200 cursor-pointer shadow-sm hover:bg-surface-container-low border border-outline-variant/30" data-price="340" data-vehicle="XL Minivan"><div class="flex items-center gap-3"><div class="w-14 h-14 rounded-xl bg-surface-container flex items-center justify-center flex-shrink-0 overflow-hidden p-1 border border-outline-variant/20"><img class="w-full h-full object-contain" data-alt="White commercial passenger minivan Toyota HiAce microbus high roof side view realistic bright studio daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAU9bDaSlnNbJ5xUS19T8QqnKNC2m4H40HdhGP4tD1ostBe6oGddwa0IFc4p6GQ9YnQViDh8I5RwJd2_-QOtMoppp2iO9dBKgbiPf2P7pvBl5glrDydzOONcg2b1VPFNj3EjQMroPLqVImP16zZ1F7T5EyctpLS4HrXxqQyccqqx2HSRBSUcSxmes5wqcVFi3s9luGFsv5zUWu8WdMKXRzV-O5a9F-GnMrVtksiWBbtB2uAYyMpIhUu0Q"></div><div class="flex-1 min-w-0 pr-2"><div class="flex items-center gap-1.5"><span class="font-headline-sm text-body-lg-medium text-on-surface font-semibold">XL Minivan</span><span class="flex items-center gap-0.5 text-on-surface-variant text-label-sm bg-surface-container-highest px-1.5 py-0.5 rounded-full"><span class="material-symbols-outlined text-[12px]">group</span>6</span><span class="px-1.5 py-0.2 rounded bg-surface-container-highest text-on-surface-variant text-[10px] font-bold">7 min</span></div><p class="font-body-md text-label-sm text-on-surface-variant truncate mt-0.5">Toyota HiAce • Large luggage</p></div><div class="text-right flex-shrink-0"><div class="font-currency-display text-currency-display text-on-surface font-bold">340 <span class="font-body-md text-label-sm text-on-surface-variant">ETB</span></div><div class="font-body-md text-label-sm text-outline font-medium">Group Ride</div></div></div></div>
<!-- 4. Addis Lada Taxi -->
<div class="vehicle-card group relative p-3 rounded-2xl bg-surface-container-lowest transition-all duration-200 cursor-pointer shadow-sm hover:bg-surface-container-low border border-outline-variant/30" data-price="120" data-vehicle="Addis Lada"><div class="flex items-center gap-3"><div class="w-14 h-14 rounded-xl bg-secondary-fixed/40 flex items-center justify-center flex-shrink-0 overflow-hidden p-1 border border-outline-variant/20"><img class="w-full h-full object-contain" data-alt="Classic Ethiopian blue and white heritage Lada taxi sedan vintage vehicle iconic Addis Ababa public transit clean angle" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAolGOuZ9QZ0QyHNhBtG77cby49tJ3-p-bq6EzyfgejRVqKhiaqDDVxWuR0jo8GhuovGbUYT41IN4lqHr925UvtN62rx-6KwNcC6rx5oYxrZPYYn0pvfuegnXXUr1HFk6o8hOo2oUAUIaBKngwJyh2XyuNiT2ll4BY-Ap8Xzr7nJcoUbNdAPe4L6bJsacLo9njz1rAvXj1alYuokH14M9D3CKuMFJXSF5r9kQMGoFgMCLUWnvrZnqoTFQ"></div><div class="flex-1 min-w-0 pr-2"><div class="flex items-center gap-1.5"><span class="font-headline-sm text-body-lg-medium text-on-surface font-semibold">Addis Lada</span><span class="flex items-center gap-0.5 text-on-surface-variant text-label-sm bg-surface-container-highest px-1.5 py-0.5 rounded-full"><span class="material-symbols-outlined text-[12px]">person</span>4</span><span class="px-1.5 py-0.2 rounded bg-tertiary-fixed text-on-tertiary-fixed text-[10px] font-bold">2 min</span></div><p class="font-body-md text-label-sm text-on-surface-variant truncate mt-0.5">Classic Blue &amp; White Sedan</p></div><div class="text-right flex-shrink-0"><div class="font-currency-display text-currency-display text-on-surface font-bold">120 <span class="font-body-md text-label-sm text-on-surface-variant">ETB</span></div><div class="font-body-md text-label-sm text-secondary font-medium">Fastest</div></div></div></div>
</div>
<!-- Detailed Fare Breakdown (Accordion Drawer) -->
<div class="mb-4 bg-surface-container-lowest rounded-2xl p-4 transition-all duration-300 border border-outline-variant/30 shadow-sm" id="breakdown-panel"><div class="flex items-center justify-between pb-3 mb-2.5 border-b border-outline-variant/20"><div class="flex items-center gap-2"><span class="material-symbols-outlined text-[18px] text-primary">receipt_long</span><span class="font-headline-sm text-body-md-medium text-on-surface font-bold">Fare Estimate Breakdown</span></div><span class="text-label-sm px-2.5 py-0.5 rounded-full bg-tertiary-fixed text-on-tertiary-fixed font-bold flex items-center gap-1"><span class="material-symbols-outlined text-[12px]">check_circle</span>ADDIS15 Applied</span></div><div class="flex flex-col gap-2 text-label-md text-on-surface-variant"><div class="flex justify-between items-center"><span class="flex items-center gap-2"><span class="material-symbols-outlined text-[15px] text-outline">flag</span><span class="">Base Fare</span></span><span class="font-body-md-medium text-on-surface font-semibold">50.00 ETB</span></div><div class="flex justify-between items-center"><span class="flex items-center gap-2"><span class="material-symbols-outlined text-[15px] text-outline">straighten</span><span class="">Distance (6.4 km @ 10 ETB/km)</span></span><span class="font-body-md-medium text-on-surface font-semibold">64.00 ETB</span></div><div class="flex justify-between items-center"><span class="flex items-center gap-2"><span class="material-symbols-outlined text-[15px] text-outline">schedule</span><span class="">Est. Time (18 mins @ 1.5 ETB/min)</span></span><span class="font-body-md-medium text-on-surface font-semibold">27.00 ETB</span></div><div class="flex justify-between items-center text-tertiary font-body-md-medium pt-1 border-t border-dashed border-outline-variant/30"><span class="flex items-center gap-2 font-semibold"><span class="material-symbols-outlined text-[15px]">redeem</span><span class="">Special Promo ADDIS15 (-15%)</span></span><span class="font-bold">-21.00 ETB</span></div></div><div class="mt-3 pt-2.5 flex items-center justify-between border-t border-outline-variant/20"><div><div class="font-body-md text-label-sm text-on-surface font-bold">Final Guaranteed Price</div><div class="text-[11px] text-outline">No surge or rain multiplier active</div></div><div class="text-right"><span class="font-currency-display text-headline-md text-primary font-extrabold" id="total-price-text">120 ETB</span></div></div></div>
<!-- Payment Selector Bar -->
<div class="flex items-center justify-between p-3 rounded-2xl bg-surface-container-lowest border border-outline-variant/30 mb-4 shadow-sm"><div class="flex items-center gap-2.5 min-w-0"><div class="w-10 h-10 rounded-xl bg-secondary-fixed text-on-secondary-fixed flex items-center justify-center flex-shrink-0 shadow-sm"><span class="material-symbols-outlined text-[20px]">account_balance_wallet</span></div><div class="truncate"><div class="flex items-center gap-1.5"><span class="font-body-md-medium text-body-md text-on-surface font-bold">Telebirr (Primary)</span><span class="w-2 h-2 rounded-full bg-tertiary animate-pulse"></span></div><div class="font-body-md text-label-sm text-on-surface-variant truncate font-medium">Bal: ETB 1,450.00 • Instant Pay</div></div></div><button class="px-3.5 py-1.5 rounded-full bg-surface-container-high text-primary font-body-md-medium text-label-md hover:bg-primary-fixed transition-colors active:scale-95 flex-shrink-0 font-bold border border-primary/20">Switch</button></div>
<!-- Confirm Ride Primary Button -->
<button class="w-full h-14 bg-primary text-on-primary rounded-xl font-headline-sm text-headline-sm flex items-center justify-center gap-2 shadow-lg hover:bg-primary/95 active:scale-[0.99] transition-all font-bold" id="book-cta"><span id="cta-label" class="">Select Economy (120 ETB)</span><span class="material-symbols-outlined text-[20px]">arrow_forward</span></button>
<!-- Trust Footer -->
<div class="mt-3 flex items-center justify-center gap-1.5 text-on-surface-variant font-body-md text-label-sm">
<span class="material-symbols-outlined text-[14px] text-tertiary">verified_user</span>
<span class="">Safe rides • Real-time GPS Tracking • 24/7 Addis Support</span>
</div>
</div>
</div>
<script>
  (function() {
    const cards = document.querySelectorAll('.vehicle-card');
    const ctaLabel = document.getElementById('cta-label');
    const totalPriceText = document.getElementById('total-price-text');
    const toggleBreakdownBtn = document.getElementById('toggle-breakdown-btn');
    const breakdownPanel = document.getElementById('breakdown-panel');

    let currentSelectedVehicle = 'Economy';
    let currentPrice = '120';

    cards.forEach(card => {
      card.addEventListener('click', () => {
        cards.forEach(c => {
          c.classList.remove('selected-card', 'bg-surface-container-low');
          c.classList.add('bg-surface-container-lowest');
          const badge = c.querySelector('.check-badge');
          if (badge) badge.parentElement.remove();
        });

        card.classList.add('selected-card', 'bg-surface-container-low');
        card.classList.remove('bg-surface-container-lowest');

        // Add check badge
        const badgeContainer = document.createElement('div');
        badgeContainer.className = 'absolute top-3 right-3 flex items-center gap-1.5';
        badgeContainer.innerHTML = `
          <span class="w-5 h-5 rounded-full bg-primary text-on-primary flex items-center justify-center check-badge">
            <span class="material-symbols-outlined text-[14px]">check</span>
          </span>
        `;
        card.appendChild(badgeContainer);

        currentSelectedVehicle = card.getAttribute('data-vehicle');
        currentPrice = card.getAttribute('data-price');

        ctaLabel.textContent = `Select ${currentSelectedVehicle} (${currentPrice} ETB)`;
        totalPriceText.textContent = `${currentPrice} ETB`;
      });
    });

    toggleBreakdownBtn.addEventListener('click', () => {
      breakdownPanel.classList.toggle('hidden');
    });

})();
</script></main>

</body></html>

<!-- ZemenGo - Map Pin Picker -->
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"><meta content="mobile_blank" name="shell-type"><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script></head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen pt-safe pb-safe"><main class="flex flex-col relative w-full h-full bg-surface flex-1"><div class="flex flex-col w-full relative select-none">
<!-- Map Background Canvas -->
<div class="relative w-full h-[660px] overflow-hidden bg-surface-container-low">
<!-- Static / Interactive map asset -->
<div class="absolute inset-0 w-full h-full bg-cover bg-center" data-location="Bole Medhanealem, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuC9plKtmiGzdVC7EL_vjTllq-BDerfmwkeJ8RuWghHCshOOaskPGNQBfMNw3BWx4Unt3iGFGKsCzufn3xwFcRuEXDzObb2hiZdVKe_xmRbOJQYZ9vI-tucmSvE-_VBKw2BAL4-lswsCmT0g_50DAFHkGgkTWFXEHqBeexi1JtY2kce3t3pC6oPA5-pUYWB2zoSoluBb0JdrRFAR-BK2_yDzLe2cweTmoPgN6rSvcx7afcLWhVhIvDfWSw')"></div>
<!-- Stylized Map Texture Overlays (Urban geometry mimicry) -->
<div class="absolute inset-0 pointer-events-none opacity-40 bg-gradient-to-b from-surface/60 via-transparent to-surface/40"></div>
<!-- Floating Top Navigation & Search Bar -->
<div class="absolute top-0 left-0 right-0 z-30 pt-3 px-6 pb-2 flex items-center justify-between text-on-surface pointer-events-none"><span class="font-label-md text-label-md font-semibold">9:41</span><div class="w-24 h-4 bg-on-surface rounded-full flex items-center justify-center"><div class="w-2 h-2 rounded-full bg-surface-container-high/20 mr-1"></div></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-[14px]">signal_cellular_alt</span><span class="material-symbols-outlined text-[14px]">wifi</span><span class="material-symbols-outlined text-[16px]">battery_full</span></div></div><div class="absolute top-12 left-4 right-4 z-20 flex items-center gap-2"><button aria-label="Go back" class="w-11 h-11 rounded-full bg-surface-container-lowest/95 backdrop-blur-md text-on-surface shadow-md flex items-center justify-center active:scale-95 transition-transform duration-150" type="button"><span class="material-symbols-outlined text-[20px]">arrow_back</span></button><div class="flex-1 h-11 bg-surface-container-lowest/95 backdrop-blur-md rounded-full shadow-md px-3.5 flex items-center gap-2.5 min-w-0"><div class="w-7 h-7 rounded-full bg-primary/10 flex items-center justify-center text-primary shrink-0"><span class="material-symbols-outlined text-[16px]" style="font-variation-settings: 'FILL' 1;">my_location</span></div><div class="flex flex-col min-w-0 justify-center"><div class="flex items-center gap-1.5"><span class="font-label-sm text-[10px] text-primary font-bold uppercase tracking-wider">Pickup Spot</span><span class="w-1 h-1 rounded-full bg-outline-variant"></span><span class="font-label-sm text-[10px] text-tertiary font-semibold">Accurate</span></div><span class="font-body-md-medium text-[13px] text-on-surface font-semibold truncate leading-tight">Bole Medhanealem Road</span></div></div><button aria-label="Toggle map layers" class="w-11 h-11 rounded-full bg-surface-container-lowest/95 backdrop-blur-md text-on-surface shadow-md flex items-center justify-center active:scale-95 transition-transform duration-150" type="button"><span class="material-symbols-outlined text-[20px]">layers</span></button></div>
<!-- Urban Area Badges on Map (Addis Ababa Landmarks) -->
<div class="absolute top-24 left-6 pointer-events-none z-10 bg-surface-container-lowest/85 backdrop-blur-sm rounded-full px-3 py-1 shadow-sm flex items-center gap-1.5">
<span class="w-2 h-2 rounded-full bg-tertiary-container animate-pulse"></span>
<span class="font-label-sm text-label-sm text-on-surface font-semibold">Meskel Sq. 3.2 km</span>
</div>
<div class="absolute top-36 right-6 pointer-events-none z-10 bg-surface-container-lowest/85 backdrop-blur-sm rounded-full px-3 py-1 shadow-sm flex items-center gap-1.5">
<span class="material-symbols-outlined text-secondary text-[14px]">local_taxi</span>
<span class="font-label-sm text-label-sm text-on-surface font-semibold">Kazanchis (6 cabs)</span>
</div>
<!-- Nearby Animated Taxi Cabs -->
<div class="absolute top-1/3 left-16 z-10 p-1.5 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center transform -rotate-12 transition-all duration-700 animate-bounce">
<span class="material-symbols-outlined text-primary text-[18px]" style="font-variation-settings: 'FILL' 1;">local_taxi</span>
</div>
<div class="absolute top-1/2 right-14 z-10 p-1.5 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center transform rotate-45">
<span class="material-symbols-outlined text-secondary text-[18px]" style="font-variation-settings: 'FILL' 1;">directions_car</span>
</div>
<!-- Center Pinpoint Target with Animated Pulse Rings -->
<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 z-20 flex flex-col items-center pointer-events-none pb-9">
<!-- Tooltip Bubble -->
<div class="mb-2 bg-on-surface text-surface-bright px-3.5 py-1.5 rounded-full shadow-lg flex items-center gap-1.5 transform hover:scale-105 transition-transform duration-200">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary-fixed animate-ping"></span>
<span class="font-label-sm text-label-sm font-semibold tracking-wide">Set pickup here</span>
</div>
<!-- Main Marker Pin Icon -->
<div class="relative flex items-center justify-center">
<!-- Concentric Radial Glow Waves -->
<span class="absolute w-20 h-20 rounded-full bg-primary/20 animate-ping opacity-75"></span>
<span class="absolute w-12 h-12 rounded-full bg-primary-fixed/40"></span>
<div class="relative w-11 h-11 rounded-full bg-primary text-on-primary shadow-xl flex items-center justify-center">
<span class="material-symbols-outlined text-[24px]">location_on</span>
</div>
</div>
<!-- Pin Base Shadow Peg -->
<div class="w-3 h-1.5 bg-on-surface/40 rounded-full blur-[1px] -mt-0.5"></div>
</div>
<!-- Right Floating Map Controls -->
<div class="absolute bottom-6 right-4 z-20 flex flex-col items-center gap-2.5">
<!-- Re-center GPS Button -->
<button aria-label="Re-center location" class="w-12 h-12 rounded-full bg-surface-container-lowest text-primary shadow-md flex items-center justify-center active:scale-95 transition-all duration-150" id="recenter-btn" type="button">
<span class="material-symbols-outlined text-[24px]">gps_fixed</span>
</button>
<!-- Zoom Controls Stack -->
<div class="flex flex-col rounded-full bg-surface-container-lowest shadow-md overflow-hidden">
<button aria-label="Zoom in" class="w-12 h-11 text-on-surface flex items-center justify-center active:bg-surface-container-high transition-colors" id="zoom-in" type="button">
<span class="material-symbols-outlined text-[20px]">add</span>
</button>
<div class="h-[1px] w-6 self-center bg-surface-variant"></div>
<button aria-label="Zoom out" class="w-12 h-11 text-on-surface flex items-center justify-center active:bg-surface-container-high transition-colors" id="zoom-out" type="button">
<span class="material-symbols-outlined text-[20px]">remove</span>
</button>
</div>
</div>
</div>
<!-- Bottom Sheet Card Overlay -->
<div class="relative -mt-6 z-30 w-full bg-surface-container-lowest rounded-t-3xl shadow-xl px-5 pt-3 pb-6 flex flex-col gap-4">
<!-- Top Grab Handle -->
<div class="w-10 h-1.5 rounded-full bg-outline-variant/60 self-center"></div>
<!-- Live Pick-up Details Header -->
<div class="flex items-start justify-between gap-3 pt-1">
<div class="flex items-start gap-3 min-w-0">
<div class="w-10 h-10 rounded-2xl bg-primary-fixed flex items-center justify-center text-primary shrink-0 mt-0.5">
<span class="material-symbols-outlined text-[22px]">pin_drop</span>
</div>
<div class="flex flex-col min-w-0">
<div class="flex items-center gap-2">
<h1 class="font-headline-sm text-headline-sm text-on-surface truncate">Bole Medhanealem</h1>
<span class="px-2 py-0.5 rounded-md bg-secondary-fixed text-on-secondary-fixed font-label-sm text-label-sm uppercase tracking-wide">Accurate</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">Cameroon St, in front of Morning Star Mall gate</p>
<span class="font-label-sm text-label-sm text-tertiary flex items-center gap-1 mt-0.5">
<span class="material-symbols-outlined text-[14px]">electric_bolt</span> Addressed in Bole Sub-city, Zone 03
          </span>
</div>
</div>
<!-- Change/Edit Text Button -->
<button class="px-2.5 py-1 rounded-lg bg-surface-container-high text-primary font-label-md text-label-md active:bg-surface-variant transition-colors" type="button">
        Edit
      </button>
</div>
<!-- Micro Pickup Refinement Tags -->
<div class="flex flex-col gap-1.5">
<label class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Exact Driver Meeting Spot</label>
<div class="flex items-center gap-2 overflow-x-auto no-scrollbar py-0.5" id="tag-container"><button class="tag-chip px-4 py-2 rounded-full bg-primary text-on-primary font-label-md text-label-md flex items-center gap-1.5 shadow-sm whitespace-nowrap active:scale-95 transition-all" type="button"><span class="material-symbols-outlined text-[16px]">door_front</span><span class="">Doorstep</span></button><button class="tag-chip px-4 py-2 rounded-full bg-surface-container text-on-surface-variant font-label-md text-label-md flex items-center gap-1.5 whitespace-nowrap active:scale-95 transition-all" type="button"><span class="material-symbols-outlined text-[16px]">alt_route</span><span class="">Main Road Side</span></button><button class="tag-chip px-4 py-2 rounded-full bg-surface-container text-on-surface-variant font-label-md text-label-md flex items-center gap-1.5 whitespace-nowrap active:scale-95 transition-all" type="button"><span class="material-symbols-outlined text-[16px]">signpost</span><span class="">Corner Crossroad</span></button><button class="tag-chip px-4 py-2 rounded-full bg-surface-container text-on-surface-variant font-label-md text-label-md flex items-center gap-1.5 whitespace-nowrap active:scale-95 transition-all" type="button"><span class="material-symbols-outlined text-[16px]">local_parking</span><span class="">Mall Parking</span></button></div>
</div>
<!-- Trust / Safety Note Strip -->
<div class="px-3.5 py-2.5 rounded-xl bg-surface-container-low flex items-center justify-between">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-primary text-[18px]">verified_user</span>
<span class="font-label-md text-label-md text-on-surface">ZemenGo verified safe boarding zone</span>
</div>
<span class="font-label-sm text-label-sm text-outline font-semibold">ETB 0 Surcharge</span>
</div>
<!-- Primary Action Button: Confirm Location -->
<button class="w-full h-[52px] bg-primary-container text-on-primary rounded-2xl font-headline-sm text-[16px] font-bold flex items-center justify-center gap-2 shadow-lg shadow-primary/30 active:scale-[0.99] transition-all duration-150" id="confirm-btn" type="button"><span class="">Confirm Location</span><span class="material-symbols-outlined text-[20px]">arrow_forward</span></button>
</div>
</div>
<script>
  // Quick interaction logic for tag pills
  const tags = document.querySelectorAll('.tag-chip');
  tags.forEach(tag => {
    tag.addEventListener('click', () => {
      tags.forEach(t => {
        t.className = 'tag-chip px-3.5 py-2 rounded-xl bg-surface-container text-on-surface-variant font-label-md text-label-md flex items-center gap-1.5 whitespace-nowrap active:scale-95 transition-all';
      });
      tag.className = 'tag-chip px-3.5 py-2 rounded-xl bg-primary text-on-primary font-label-md text-label-md flex items-center gap-1.5 shadow-sm whitespace-nowrap active:scale-95 transition-all';
    });
  });

// Re-center button micro-interaction
const recenter = document.getElementById('recenter-btn');
if (recenter) {
recenter.addEventListener('click', () => {
recenter.classList.add('rotate-45');
setTimeout(() => recenter.classList.remove('rotate-45'), 300);
});
}
</script></main>

</body></html>

<!-- ZemenGo - Pickup Location Selection -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen"><header class="fixed top-0 w-full z-50 bg-surface/85 backdrop-blur-xl pt-safe shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="h-16 px-space-sm flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Back" class="w-11 h-11 flex items-center justify-center rounded-full hover:bg-surface-container transition-colors" onclick="window.history.back()"><span class="material-symbols-outlined text-on-surface text-[22px]">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm text-on-surface">Pickup Location Selection</h1></div><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div></header><main class="flex flex-col relative w-full pt-16 bg-surface flex-1"><div class="flex flex-col w-full pb-safe">
<!-- Map Preview Snippet & Current Spot HUD -->
<div class="relative w-full px-space-md pt-space-xs">
<div class="relative w-full h-36 rounded-xl overflow-hidden shadow-sm bg-surface-container" data-location="Bole Medhanealem, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuA9_JvIii0_YuKgjLqCh-_H2bzb9mMtWPclEPc5gi1qWyh5f43XFeaTIs4Mcm6NWk1ztRErVoQXo3e6tx0M8igv2Cu1zkYzJkz3bcQ-Bg0ojioeh8EAwarfv4mkfqp7pS1uU0O0t6jCbWwjQt2Jtn1lpvFURTEd-StMKOugv40NIhB4AFLgHcOVsmzXRN5ed8pcWkjYS5heF2h9-Gpvc6O1uiQBo0re_8SIfazebV4JoI0o7BTyrR7hTQ')">
<!-- Gradient Map Overlays -->
<div class="absolute inset-0 bg-gradient-to-t from-inverse-surface/60 via-transparent to-black/20"></div>
<!-- Pulse Radar for Active GPS -->
<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 flex items-center justify-center">
<span class="absolute w-12 h-12 rounded-full bg-primary/25 animate-ping"></span>
<div class="relative w-8 h-8 rounded-full bg-primary flex items-center justify-center shadow-lg">
<span class="w-3 h-3 rounded-full bg-on-primary"></span>
</div>
</div>
<!-- Addis City Tag Overlay -->
<div class="absolute bottom-2 left-3 flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-inverse-surface/80 backdrop-blur-md text-inverse-on-surface">
<span class="material-symbols-outlined text-[14px] text-tertiary-fixed">satellite_alt</span>
<span class="font-label-sm text-label-sm tracking-wide">GPS Accurate • ±3m</span>
</div>
<button aria-label="Center current location" class="absolute top-2 right-2 w-9 h-9 rounded-full bg-surface-container-lowest/95 backdrop-blur-sm text-primary flex items-center justify-center shadow-md active:scale-95 transition-transform" id="recenterBtn">
<span class="material-symbols-outlined text-[20px]">my_location</span>
</button>
</div>
</div>
<!-- Interactive Search & Destination Card -->
<div class="px-space-md pt-space-sm pb-space-xs">
<div class="bg-surface-container-lowest rounded-xl p-space-sm shadow-md flex flex-col gap-3">
<!-- Search Field: Pickup -->
<div class="relative flex items-center gap-space-xs bg-surface-container-low rounded-lg px-3 py-2.5">
<div class="w-3.5 h-3.5 rounded-full bg-tertiary flex items-center justify-center shrink-0 ring-4 ring-tertiary/15">
<span class="w-1.5 h-1.5 rounded-full bg-on-tertiary"></span>
</div>
<div class="flex flex-col flex-1 min-w-0 pr-1">
<span class="font-label-sm text-label-sm text-tertiary uppercase tracking-wider">Pickup Point</span>
<input class="bg-transparent border-0 p-0 font-body-md-medium text-body-md-medium text-on-surface focus:outline-none w-full truncate" id="pickupInput" placeholder="Enter pickup address..." type="text" value="Bole Medhanealem (Edna Mall)"/>
</div>
<div class="flex items-center gap-1 shrink-0">
<button aria-label="Clear pickup" class="w-7 h-7 rounded-full hover:bg-surface-container-high flex items-center justify-center text-on-surface-variant transition-colors" id="clearPickup">
<span class="material-symbols-outlined text-[18px]">cancel</span>
</button>
<div class="w-px h-4 bg-outline-variant/40"></div>
<button aria-label="Locate me" class="w-7 h-7 rounded-full text-primary hover:bg-surface-container-high flex items-center justify-center transition-colors">
<span class="material-symbols-outlined text-[18px]">near_me</span>
</button>
</div>
</div>
<!-- Destination Teaser Slot -->
<div class="relative flex items-center gap-space-xs bg-surface-container-lowest rounded-lg px-3 py-2 text-on-surface-variant/80">
<div class="w-3 h-3 rounded-xs bg-primary-container shrink-0"></div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Where are you heading in Addis?</span>
<span class="material-symbols-outlined ml-auto text-[18px] text-outline">search</span>
</div>
<!-- Quick Action Pills -->
<div class="flex items-center gap-2 pt-1 overflow-x-auto">
<button class="flex items-center gap-1.5 px-3 py-2 rounded-full bg-primary-fixed text-on-primary-fixed hover:bg-primary-fixed-dim transition-colors shrink-0 active:scale-95">
<span class="material-symbols-outlined text-[18px]">map</span>
<span class="font-label-md text-label-md">Set on Map</span>
</button>
<button class="flex items-center gap-1.5 px-3 py-2 rounded-full bg-surface-container text-on-surface-variant hover:bg-surface-container-high transition-colors shrink-0 active:scale-95">
<span class="material-symbols-outlined text-[18px] text-primary">bookmark</span>
<span class="font-label-md text-label-md">Saved Places</span>
</button>
<button class="flex items-center gap-1.5 px-3 py-2 rounded-full bg-surface-container text-on-surface-variant hover:bg-surface-container-high transition-colors shrink-0 active:scale-95">
<span class="material-symbols-outlined text-[18px] text-secondary">explore</span>
<span class="font-label-md text-label-md">Landmarks</span>
</button>
</div>
</div>
</div>
<!-- Telebirr & CBE Quick Ride Notice -->
<div class="px-space-md py-space-xs">
<div class="bg-surface-container-high rounded-xl px-space-sm py-2.5 flex items-center justify-between">
<div class="flex items-center gap-2">
<div class="w-7 h-7 rounded-full bg-tertiary-container flex items-center justify-center text-on-tertiary-container">
<span class="material-symbols-outlined text-[16px]">bolt</span>
</div>
<span class="font-label-md text-label-md text-on-surface">Instant Telebirr &amp; Cash pickups ready</span>
</div>
<span class="font-label-sm text-label-sm text-primary uppercase font-bold tracking-wider">• 4 min away</span>
</div>
</div>
<!-- Frequent & Saved Locations Section -->
<div class="px-space-md pt-space-xs">
<div class="flex items-center justify-between pb-2">
<h2 class="font-headline-sm text-headline-sm text-on-surface">Saved Places</h2>
<button class="font-label-md text-label-md text-primary hover:underline">Manage</button>
</div>
<div class="flex flex-col gap-2">
<!-- Item 1: Home -->
<button class="location-item w-full flex items-center gap-space-sm p-space-sm bg-surface-container-lowest rounded-xl shadow-sm hover:bg-surface-container-low transition-all text-left active:scale-[0.99]">
<div class="w-10 h-10 rounded-full bg-primary-fixed flex items-center justify-center shrink-0 text-on-primary-fixed">
<span class="material-symbols-outlined text-[20px]">home</span>
</div>
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Home</span>
<span class="font-label-sm text-label-sm text-on-surface-variant shrink-0">1.2 km</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Bole Atlas, Djibouti St, House 412</span>
</div>
<span class="material-symbols-outlined text-outline text-[18px] shrink-0">arrow_forward_ios</span>
</button>
<!-- Item 2: Work -->
<button class="location-item w-full flex items-center gap-space-sm p-space-sm bg-surface-container-lowest rounded-xl shadow-sm hover:bg-surface-container-low transition-all text-left active:scale-[0.99]">
<div class="w-10 h-10 rounded-full bg-secondary-fixed flex items-center justify-center shrink-0 text-on-secondary-fixed">
<span class="material-symbols-outlined text-[20px]">corporate_fare</span>
</div>
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Work</span>
<span class="font-label-sm text-label-sm text-on-surface-variant shrink-0">4.5 km</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Kazanchis, UNECA Conference Area, Office 304</span>
</div>
<span class="material-symbols-outlined text-outline text-[18px] shrink-0">arrow_forward_ios</span>
</button>
<!-- Item 3: Favorite Cafe -->
<button class="location-item w-full flex items-center gap-space-sm p-space-sm bg-surface-container-lowest rounded-xl shadow-sm hover:bg-surface-container-low transition-all text-left active:scale-[0.99]">
<div class="w-10 h-10 rounded-full bg-tertiary-fixed flex items-center justify-center shrink-0 text-on-tertiary-fixed">
<span class="material-symbols-outlined text-[20px]">local_cafe</span>
</div>
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Tomoca Coffee</span>
<span class="font-label-sm text-label-sm text-on-surface-variant shrink-0">6.1 km</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Sarbet (Old Airport Road, Addis Ababa)</span>
</div>
<span class="material-symbols-outlined text-outline text-[18px] shrink-0">arrow_forward_ios</span>
</button>
</div>
</div>
<!-- Recent Pickups -->
<div class="px-space-md pt-space-lg pb-space-xl">
<div class="flex items-center justify-between pb-2">
<h2 class="font-headline-sm text-headline-sm text-on-surface">Recent Pickups</h2>
<span class="font-label-sm text-label-sm text-outline">Past 7 days</span>
</div>
<div class="flex flex-col gap-2">
<!-- Recent 1 -->
<button class="location-item w-full flex items-center gap-space-sm p-space-sm bg-surface-container-lowest rounded-xl shadow-sm hover:bg-surface-container-low transition-all text-left active:scale-[0.99]">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center shrink-0 text-on-surface-variant">
<span class="material-symbols-outlined text-[20px]">history</span>
</div>
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Meskel Square</span>
<span class="font-label-sm text-label-sm text-outline shrink-0">2 days ago</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Underpass Plaza • Near Stadium Red Terror Museum</span>
</div>
<span class="material-symbols-outlined text-outline text-[18px] shrink-0">arrow_forward_ios</span>
</button>
<!-- Recent 2 -->
<button class="location-item w-full flex items-center gap-space-sm p-space-sm bg-surface-container-lowest rounded-xl shadow-sm hover:bg-surface-container-low transition-all text-left active:scale-[0.99]">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center shrink-0 text-on-surface-variant">
<span class="material-symbols-outlined text-[20px]">flight_takeoff</span>
</div>
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Bole International Airport</span>
<span class="font-label-sm text-label-sm text-outline shrink-0">5 days ago</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Terminal 2 Arrivals (Door 4 Passenger Curb)</span>
</div>
<span class="material-symbols-outlined text-outline text-[18px] shrink-0">arrow_forward_ios</span>
</button>
<!-- Recent 3 -->
<button class="location-item w-full flex items-center gap-space-sm p-space-sm bg-surface-container-lowest rounded-xl shadow-sm hover:bg-surface-container-low transition-all text-left active:scale-[0.99]">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center shrink-0 text-on-surface-variant">
<span class="material-symbols-outlined text-[20px]">history</span>
</div>
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface truncate">Piassa, Churchill Ave</span>
<span class="font-label-sm text-label-sm text-outline shrink-0">Last week</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant truncate">Adjacent to Taitu Hotel Heritage Quarter</span>
</div>
<span class="material-symbols-outlined text-outline text-[18px] shrink-0">arrow_forward_ios</span>
</button>
</div>
</div>
<!-- Persistent Floating Confirmation Bar -->
<div class="sticky bottom-0 w-full px-space-md pb-4 pt-2 bg-gradient-to-t from-surface via-surface/95 to-transparent">
<button class="w-full h-[52px] bg-primary-container hover:bg-primary text-on-primary rounded-xl font-body-lg-medium text-body-lg-medium flex items-center justify-center gap-2 shadow-lg active:scale-[0.99] transition-all" id="confirmPickupBtn">
<span>Confirm Bole Pickup</span>
<span class="material-symbols-outlined text-[20px]">arrow_forward</span>
</button>
<p class="font-label-sm text-label-sm text-outline text-center pt-2">
      Driver will arrive directly at designated passenger loading curb
    </p>
</div>
</div>
<script>
  (function() {
    const pickupInput = document.getElementById('pickupInput');
    const clearBtn = document.getElementById('clearPickup');
    const confirmBtn = document.getElementById('confirmPickupBtn');
    const recenterBtn = document.getElementById('recenterBtn');
    const locationItems = document.querySelectorAll('.location-item');

    if (clearBtn && pickupInput) {
      clearBtn.addEventListener('click', function() {
        pickupInput.value = '';
        pickupInput.focus();
      });
    }

    if (recenterBtn && pickupInput) {
      recenterBtn.addEventListener('click', function() {
        pickupInput.value = 'Bole Medhanealem (Edna Mall)';
      });
    }

    locationItems.forEach(item => {
      item.addEventListener('click', function() {
        const title = this.querySelector('.font-body-md-medium');
        if (title && pickupInput) {
          pickupInput.value = title.textContent.trim();
          if (confirmBtn) {
            confirmBtn.querySelector('span').textContent = 'Confirm ' + title.textContent.trim() + ' Pickup';
          }
        }
      });
    });

})();
</script></main></body></html>

<!-- ZemenGo - Active En-Route Trip -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
</head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen pt-safe pb-safe"><main class="flex flex-col relative w-full h-full bg-surface flex-1"><div class="flex flex-col w-full relative select-none">
<!-- Map Background Surface Area with Route Simulation -->
<div class="relative w-full h-[360px] overflow-hidden bg-surface-container-low" data-location="Addis Ababa, Bole to Kazanchis" style="">
<!-- Simulated Stylized Map Canvas Layers -->
<div class="absolute inset-0 bg-[#e5ecf5] pointer-events-none">
<!-- Major Street Grids and Intersections (SVG Graphic Overlay) -->
<svg class="w-full h-full object-cover opacity-90" fill="none" viewbox="0 0 400 360" xmlns="http://www.w3.org/2000/svg">
<!-- City Blocks / Landmarks -->
<rect fill="#dce6f2" height="90" rx="12" width="120" x="20" y="30"></rect>
<rect fill="#e1eaf5" height="70" rx="12" width="200" x="170" y="20"></rect>
<rect fill="#dce6f2" height="110" rx="12" width="140" x="230" y="110"></rect>
<rect fill="#e1eaf5" height="150" rx="14" width="140" x="30" y="170"></rect>
<circle cx="210" cy="180" fill="#d2deed" r="34"></circle> <!-- Meskel Square Roundabout Area -->
<!-- Secondary Arteries -->
<path d="M-10 140 H420" stroke="#ffffff" stroke-linecap="round" stroke-width="12"></path>
<path d="M120 -20 V380" stroke="#ffffff" stroke-width="10"></path>
<path d="M290 -10 V380" stroke="#ffffff" stroke-width="8"></path>
<!-- Live Trip Route Polyline: Bole Medhanealem -> Meskel Square -> Kazanchis -->
<!-- Completed / Past section (muted) -->
<path d="M50 340 L100 280 L160 230" opacity="0.6" stroke="#94A3B8" stroke-linecap="round" stroke-linejoin="round" stroke-width="7"></path>
<!-- Current Live Segment: Smooth Flow (Primary Electric Blue) -->
<path d="M160 230 L210 180" stroke="#1852e8" stroke-linecap="round" stroke-linejoin="round" stroke-width="7"></path>
<!-- Meskel Square Underpass Congestion Slice (Amber/Orange Alert) -->
<path d="M210 180 L235 150" stroke="#f59e0b" stroke-linecap="round" stroke-linejoin="round" stroke-width="7"></path>
<!-- Approaching Kazanchis / Menelik II Ave (Green/Swift Flow Segment) -->
<path d="M235 150 L270 100 L320 60" stroke="#1852e8" stroke-linecap="round" stroke-linejoin="round" stroke-width="7"></path>
<!-- Destination Pin Target (Kazanchis - UNECA Gate) -->
<circle cx="320" cy="60" fill="#1852e8" fill-opacity="0.2" r="14"></circle>
<circle cx="320" cy="60" fill="#1852e8" r="7"></circle>
<circle cx="320" cy="60" fill="#ffffff" r="3"></circle>
</svg>
</div>
<!-- Active Moving Car Marker Heading Northwest -->
<div class="absolute left-[154px] top-[218px] transform -translate-x-1/2 -translate-y-1/2 rotate-[-42deg] z-10 filter drop-shadow-md transition-all duration-700">
<div class="relative flex items-center justify-center">
<!-- Pulse radar ring -->
<div class="absolute w-12 h-12 bg-primary-container/20 rounded-full animate-ping"></div>
<!-- Vehicle Token Disc -->
<div class="w-10 h-10 bg-primary-container rounded-full flex items-center justify-center shadow-lg border-2 border-white">
<span class="material-symbols-outlined text-white text-[22px]">navigation</span>
</div>
</div>
</div>
<!-- Live Floating Map Speedometer HUD (Level 2 Elevation) -->
<div class="absolute left-4 bottom-5 z-20 flex flex-col items-center justify-center bg-surface-container-lowest/95 backdrop-blur-md rounded-2xl px-3 py-2 shadow-md">
<span class="font-currency-display text-currency-display text-on-surface leading-tight">38</span>
<span class="font-label-sm text-label-sm text-outline tracking-wider uppercase">km/h</span>
</div>
<!-- Floating Map Control Stack (SOS, Recenter, Layer, Audio) -->
<div class="absolute right-4 bottom-5 z-20 flex flex-col items-center gap-2">
<!-- Quick Map Center -->
<button aria-label="Recenter map" class="w-11 h-11 bg-surface-container-lowest text-on-surface rounded-full flex items-center justify-center shadow-md active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[20px]">my_location</span>
</button>
<!-- Traffic Layers Toggle -->
<button aria-label="Toggle traffic view" class="w-11 h-11 bg-surface-container-lowest text-primary rounded-full flex items-center justify-center shadow-md active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[20px]">traffic</span>
</button>
</div>
</div>
<!-- Top Floating Turn-by-Turn Navigation Header (Overlaps Map) -->
<div class="absolute top-2 inset-x-3 z-30 flex flex-col gap-2">
<!-- Primary Maneuver & ETA Capsule Bar -->
<div class="bg-surface-container-lowest/95 backdrop-blur-md rounded-2xl p-3.5 shadow-lg flex items-center justify-between gap-3">
<!-- Green Navigation Turn Indicator -->
<div class="w-12 h-12 bg-tertiary-fixed rounded-xl flex items-center justify-center text-on-tertiary-fixed flex-shrink-0">
<span class="material-symbols-outlined text-[28px] font-bold">turn_right</span>
</div>
<!-- Turn & ETA Metadata -->
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-baseline gap-2">
<span class="font-headline-md text-headline-md text-primary-container tracking-tight">12 min</span>
<span class="font-body-md-medium text-body-md-medium text-on-surface-variant truncate">4.8 km left</span>
</div>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">
          In 400m, turn right onto <span class="font-bold">Menelik II Ave</span>
</p>
</div>
<!-- Quick Mute / Audio Directive Toggle -->
<button aria-label="Trip Audio Guide" class="w-10 h-10 bg-surface-container-high text-on-surface-variant rounded-full flex items-center justify-center active:scale-90 transition-transform" id="audio-toggle-btn">
<span class="material-symbols-outlined text-[20px]">volume_up</span>
</button>
</div>
<!-- Live Sub-status Ticker Strip -->
<div class="bg-surface-container-highest/90 backdrop-blur-md rounded-xl px-3 py-1.5 flex items-center justify-between shadow-sm">
<div class="flex items-center gap-2 min-w-0">
<span class="inline-block w-2 h-2 rounded-full bg-tertiary animate-pulse"></span>
<span class="font-label-md text-label-md text-on-surface-variant truncate">
          Estimated dropoff <strong class="text-on-surface">10:42 AM</strong> • Light traffic at Meskel Underpass
        </span>
</div>
<span class="font-label-sm text-label-sm text-primary uppercase font-bold tracking-wider ml-2">Live</span>
</div>
</div>
<!-- Persistent Dynamic Live Trip Card (Level 3 Dynamic Bottom Tray) -->
<div class="bg-surface-container-lowest rounded-t-[28px] shadow-2xl p-4 flex flex-col gap-4 z-20 mt-[-18px]">
<!-- Sheet Drag Handle Accent -->
<div class="w-12 h-1.5 bg-outline-variant/60 rounded-full mx-auto -mt-1"></div>
<!-- Active Route Overview Strip -->
<div class="flex items-start gap-3 bg-surface-container-low rounded-2xl p-3">
<div class="flex flex-col items-center justify-between py-1 self-stretch">
<span class="material-symbols-outlined text-[18px] text-tertiary" style="font-variation-settings: 'FILL' 1;">trip_origin</span>
<div class="w-0.5 h-6 bg-outline-variant"></div>
<span class="material-symbols-outlined text-[20px] text-primary-container" style="font-variation-settings: 'FILL' 1;">location_on</span>
</div>
<div class="flex flex-col flex-1 justify-between gap-1.5 min-w-0">
<div class="flex items-center justify-between min-w-0">
<p class="font-body-md text-body-md text-on-surface-variant truncate">Bole Medhanealem (Pickup)</p>
<span class="font-label-sm text-label-sm text-outline">10:28 AM</span>
</div>
<div class="flex items-center justify-between min-w-0">
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate font-bold">Kazanchis, Menelik II Avenue</p>
<button class="font-label-md text-label-md text-primary font-bold hover:underline shrink-0">Edit</button>
</div>
</div>
</div>
<!-- Driver & Vehicle Profile HUD -->
<div class="flex items-center justify-between gap-3 bg-surface rounded-2xl p-3.5">
<!-- Driver Photo with Rating Badge Overlay -->
<div class="relative flex-shrink-0">
<img alt="Dawit Tadesse - Verified ZemenGo Driver" class="w-14 h-14 rounded-full object-cover shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCMJi5VBXTPpKry5jOQ1Ptq_jN82a2z38hq1id1i8Y7laadjbGV9bFud84cNQypyRanG7mFq5IjB1haBlufwGUqIwvCq87nqDv9-IAt20KXhh9VL7baEI9pXeJdeuieH0lWFpAPUYjmPQR04sUVwJECNiysWLmaghqzyNv2wpRmv_5TCny--iZiz0vCSBMKmyXyN5yhO3Z4whZ7zRRY_yu6r9yB9QZqaa5al3Vl2jJpORm4rSD61QIeEw"/>
<div class="absolute -bottom-1 -right-1 bg-surface-container-lowest text-on-surface px-1.5 py-0.5 rounded-full flex items-center gap-0.5 shadow">
<span class="material-symbols-outlined text-amber-500 text-[13px]" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-sm text-label-sm font-bold">4.94</span>
</div>
</div>
<!-- Identity & Car Details -->
<div class="flex flex-col flex-1 min-w-0">
<div class="flex items-center gap-1.5">
<h2 class="font-headline-sm text-headline-sm text-on-surface truncate">Dawit Tadesse</h2>
<span class="material-symbols-outlined text-primary-container text-[18px]" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">White Toyota Corolla 2021</p>
<!-- Industrial High-Visibility License Plate Badge -->
<div class="inline-flex items-center gap-1.5 mt-1 bg-surface-container px-2 py-0.5 rounded-md w-fit">
<span class="font-label-sm text-label-sm text-on-surface tracking-wider font-extrabold uppercase">Code 03 • A42981 ET</span>
</div>
</div>
<!-- Quick Action Circular Buttons (Call & In-app Chat) -->
<div class="flex items-center gap-2 flex-shrink-0">
<button aria-label="Call Driver" class="w-11 h-11 rounded-full bg-primary-fixed text-on-primary-fixed flex items-center justify-center active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[20px]">call</span>
</button>
<button aria-label="Message Driver" class="w-11 h-11 rounded-full bg-surface-container text-on-surface flex items-center justify-center active:scale-95 transition-transform relative">
<span class="material-symbols-outlined text-[20px]">chat</span>
<span class="absolute top-2 right-2 w-2 h-2 rounded-full bg-primary-container"></span>
</button>
</div>
</div>
<!-- Live Trip Security & Route Adjustments Action Bar -->
<div class="grid grid-cols-3 gap-2">
<!-- High Priority SOS Button -->
<button class="flex flex-col items-center justify-center gap-1 bg-error-container text-on-error-container py-2.5 px-2 rounded-xl active:scale-95 transition-all">
<div class="w-8 h-8 rounded-full bg-error text-on-error flex items-center justify-center shadow-sm">
<span class="material-symbols-outlined text-[18px]">emergency</span>
</div>
<span class="font-label-sm text-label-sm font-bold uppercase tracking-wider">SOS 991</span>
</button>
<!-- Share Live Journey -->
<button class="flex flex-col items-center justify-center gap-1 bg-surface-container-low text-on-surface py-2.5 px-2 rounded-xl active:scale-95 transition-all">
<div class="w-8 h-8 rounded-full bg-surface-container text-primary-container flex items-center justify-center">
<span class="material-symbols-outlined text-[18px]">share_location</span>
</div>
<span class="font-label-sm text-label-sm font-bold tracking-tight">Share Trip</span>
</button>
<!-- Add Route Stop -->
<button class="flex flex-col items-center justify-center gap-1 bg-surface-container-low text-on-surface py-2.5 px-2 rounded-xl active:scale-95 transition-all">
<div class="w-8 h-8 rounded-full bg-surface-container text-on-surface flex items-center justify-center">
<span class="material-symbols-outlined text-[18px]">add_location_alt</span>
</div>
<span class="font-label-sm text-label-sm font-bold tracking-tight">Add Stop</span>
</button>
</div>
<!-- Payment Status Strip -->
<div class="flex items-center justify-between bg-surface-container-low rounded-xl px-3.5 py-3">
<div class="flex items-center gap-2.5">
<!-- Telebirr Micro Badge -->
<div class="w-7 h-7 rounded-lg bg-[#E0F2FE] text-[#0077B6] flex items-center justify-center font-bold text-[11px] shadow-sm">
          tb
        </div>
<div class="flex flex-col">
<span class="font-body-md-medium text-body-md-medium text-on-surface font-bold">120.00 ETB</span>
<span class="font-label-sm text-label-sm text-tertiary flex items-center gap-1 font-semibold">
<span class="material-symbols-outlined text-[14px]">verified</span> Pre-authorized Telebirr
          </span>
</div>
</div>
<button class="text-primary font-label-md text-label-md font-bold px-2 py-1 rounded-lg bg-surface-container hover:bg-surface-container-high transition-colors">
        Receipt Details
      </button>
</div>
<!-- Safety Micro-Utility Modules & Audio Recording Active State -->
<div class="flex items-center justify-between p-3 rounded-xl bg-surface-container">
<div class="flex items-center gap-2.5">
<span class="material-symbols-outlined text-tertiary text-[20px]" style="font-variation-settings: 'FILL' 1;">shield</span>
<div class="flex flex-col">
<span class="font-body-md-medium text-body-md-medium text-on-surface">RideCheck™ &amp; Audio Protection</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">Encrypted audio verification is active</span>
</div>
</div>
<label class="relative inline-flex items-center cursor-pointer">
<input checked="" class="sr-only peer" id="safety-audio-toggle" type="checkbox"/>
<div class="w-9 h-5 bg-surface-dim peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-4 after:w-4 after:transition-all peer-checked:bg-primary-container"></div>
</label>
</div>
<!-- Primary Footer Split-Fare CTA Option -->
<button class="w-full h-[50px] bg-secondary-fixed text-on-secondary-fixed rounded-xl font-headline-sm text-headline-sm flex items-center justify-center gap-2 shadow-sm active:scale-[0.99] transition-transform">
<span class="material-symbols-outlined text-[20px]">group</span>
<span>Split Fare with Friends</span>
</button>
</div>
</div>
<script>
  (function initActiveTripInteractions() {
    // Audio guide quick toggle
    const audioBtn = document.getElementById('audio-toggle-btn');
    if (audioBtn) {
      let isMuted = false;
      audioBtn.addEventListener('click', () => {
        isMuted = !isMuted;
        const icon = audioBtn.querySelector('.material-symbols-outlined');
        if (icon) {
          icon.textContent = isMuted ? 'volume_off' : 'volume_up';
        }
        audioBtn.classList.toggle('bg-primary-container', isMuted);
        audioBtn.classList.toggle('text-white', isMuted);
      });
    }

    // Interactive feedback for safety switch
    const safetyToggle = document.getElementById('safety-audio-toggle');
    if (safetyToggle) {
      safetyToggle.addEventListener('change', (e) => {
        const statusText = e.target.closest('div').querySelector('.font-label-sm');
        if (statusText) {
          statusText.textContent = e.target.checked
            ? 'Encrypted audio verification is active'
            : 'Audio monitoring paused for privacy';
        }
      });
    }

})();
</script></main></body></html>

<!-- ZemenGo - Driver Arriving -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
</head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen pt-safe pb-safe"><main class="flex flex-col relative w-full h-full bg-surface flex-1"><div class="flex flex-col w-full relative select-none">
<!-- Interactive Map View Layer -->
<div class="relative w-full h-[360px] overflow-hidden">
<!-- Live Map Canvas -->
<div class="w-full h-full bg-cover bg-center" data-location="Bole Medhanealem, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDWkWTTrTQ-E8wdR5BQsfvvI1GUyDYUxRN1u8TEzNR0PKPPzkfjPA8A_L75oUQibFGemNcRN7m1gwaVPcqWdX_UJ58C_5XCp5Chv13m2qYZc-q9VnD4xGbBWQh5lsan8SKaFFb9BUd3SpSvbaaEORts8RvMoYMMsIKzwyoZxoFbpPChZ8YaLz-z1p0hjRnmUwR-rT_fCJQf9AZxO6xwDGRRsIQ6Tg-yZSiVCpvvVIRggLmFKRzl5Q3Lkg')"></div>
<!-- Directional subtle vignette / soft gradient for map HUD readability -->
<div class="absolute inset-0 bg-gradient-to-b from-inverse-surface/40 via-transparent to-surface/90 pointer-events-none"></div>
<!-- Floating Top Dynamic Island / Arrival Pill -->
<div class="absolute top-3 inset-x-4 flex flex-col gap-2 z-20">
<!-- Status Pill -->
<div class="bg-surface-container-lowest/95 backdrop-blur-md px-4 py-2.5 rounded-full shadow-lg flex items-center justify-between">
<div class="flex items-center gap-2.5">
<span class="relative flex h-3 w-3">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-tertiary-fixed-dim opacity-75"></span>
<span class="relative inline-flex rounded-full h-3 w-3 bg-tertiary"></span>
</span>
<div class="flex flex-col">
<span class="font-headline-sm text-headline-sm text-on-surface leading-tight">Dawit has arrived!</span>
<span class="font-label-sm text-label-sm text-outline">Bole Medhanealem • Edna Mall Bay</span>
</div>
</div>
<div class="flex items-center gap-1.5 px-2.5 py-1 bg-surface-container-high rounded-full">
<span class="material-symbols-outlined text-primary text-[16px]">timer</span>
<span class="font-label-sm text-label-sm text-primary font-bold" id="waiting-timer">02:45</span>
</div>
</div>
<!-- Quick Guidance Banner -->
<div class="bg-inverse-surface/90 backdrop-blur-sm px-3.5 py-1.5 rounded-xl shadow-md flex items-center justify-between text-inverse-on-surface">
<div class="flex items-center gap-2 min-w-0">
<span class="material-symbols-outlined text-tertiary-fixed text-[18px]">verified_user</span>
<p class="font-body-md text-body-md truncate text-inverse-on-surface">Look for white Corolla with hazards on</p>
</div>
<span class="font-label-sm text-label-sm text-secondary-fixed shrink-0">Safe Pick</span>
</div>
</div>
<!-- Map Overlays: Vehicle & Pickup Pin Micro-Graphics -->
<div class="absolute inset-0 pointer-events-none flex items-center justify-center">
<!-- Pickup Pulse Ring Anchor -->
<div class="relative flex items-center justify-center">
<!-- Passenger blue radar ring -->
<div class="w-20 h-20 bg-primary/15 rounded-full animate-ping absolute"></div>
<div class="w-10 h-10 bg-primary/25 rounded-full flex items-center justify-center shadow-md">
<div class="w-4 h-4 bg-primary rounded-full shadow-sm"></div>
</div>
<!-- Car Position Marker (Adjacent, arriving) -->
<div class="absolute -top-12 -right-10 flex flex-col items-center">
<div class="relative bg-surface-container-lowest px-2.5 py-1 rounded-full shadow-md flex items-center gap-1">
<span class="material-symbols-outlined text-primary text-[14px]">directions_car</span>
<span class="font-label-sm text-label-sm text-on-surface">Here Now</span>
</div>
<!-- Vehicle Directional Pointer -->
<div class="w-7 h-7 bg-primary text-on-primary rounded-full shadow-lg flex items-center justify-center -mt-1 transform rotate-45">
<span class="material-symbols-outlined text-[18px]">navigation</span>
</div>
</div>
</div>
</div>
<!-- Map Floating Controls (Recenter & SOS) -->
<div class="absolute right-4 bottom-5 flex flex-col gap-2.5 z-10">
<button aria-label="Re-center map" class="w-11 h-11 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-on-surface active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[22px]">my_location</span>
</button>
<button aria-label="Emergency SOS" class="w-11 h-11 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-error active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[22px]" style="font-variation-settings: 'FILL' 1;">shield</span>
</button>
</div>
</div>
<!-- Bottom Sheet HUD Container -->
<div class="relative -mt-4 bg-surface-container-lowest rounded-t-3xl shadow-2xl px-4 pt-2.5 pb-6 flex flex-col gap-4 z-30">
<!-- Grabber Handle -->
<div class="w-10 h-1 bg-surface-container-highest rounded-full mx-auto my-1"></div>
<!-- License Plate & Car Spotlight Banner (Super High Readability) -->
<div class="bg-surface-container-low rounded-2xl p-3.5 flex items-center justify-between shadow-sm">
<div class="flex flex-col gap-1 min-w-0">
<div class="flex items-center gap-2">
<span class="px-2 py-0.5 bg-inverse-surface text-inverse-on-surface font-label-sm text-label-sm rounded uppercase font-bold tracking-wider">
            Code 03
          </span>
<span class="font-headline-md text-headline-md text-on-surface font-extrabold tracking-wide">
            A42981 ET
          </span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">
          White Toyota Corolla 2021 • Standard Sedan
        </p>
</div>
<!-- Vehicle Image Preview Frame -->
<div class="relative w-20 h-14 bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm shrink-0 flex items-center justify-center">
<img class="w-full h-full object-cover" data-alt="Side profile perspective of a pristine white Toyota Corolla sedan parked cleanly in daylight with metallic highlights, modern automobile studio photography" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCx0RaXkt53SCFanB-eFP0CfRITFjuxicuqZUZ-9vWvHpxNFQWnrk5sAsY2e8GZ5DhXtoSq2U31-wLYg4-qE1SGMzueq9AoPHNIWieLv6hfbLp-tKC9B1RIVj7OBQ-kj7Dl9u_XoeGgb3IwTEoezrcSsYtCUQya4x7qNDxECKGLgIQAK_bBMLNQfax9aAGWGuOOc0tl6SiQcL42ECy9xUwo3927wojv4nKGLJO9nXrYXv-7wyvOt306Cw"/>
</div>
</div>
<!-- Driver Dossier & Verification Code Row -->
<div class="flex items-center justify-between gap-3">
<!-- Driver Details -->
<div class="flex items-center gap-3 min-w-0">
<div class="relative shrink-0">
<img alt="Dawit Tadesse profile photo" class="w-14 h-14 rounded-full object-cover shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCMJi5VBXTPpKry5jOQ1Ptq_jN82a2z38hq1id1i8Y7laadjbGV9bFud84cNQypyRanG7mFq5IjB1haBlufwGUqIwvCq87nqDv9-IAt20KXhh9VL7baEI9pXeJdeuieH0lWFpAPUYjmPQR04sUVwJECNiysWLmaghqzyNv2wpRmv_5TCny--iZiz0vCSBMKmyXyN5yhO3Z4whZ7zRRY_yu6r9yB9QZqaa5al3Vl2jJpORm4rSD61QIeEw"/>
<div class="absolute -bottom-1 -right-1 bg-surface-container-lowest rounded-full px-1.5 py-0.5 shadow-sm flex items-center gap-0.5">
<span class="material-symbols-outlined text-secondary-container text-[12px]" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-sm text-label-sm text-on-surface font-bold">4.92</span>
</div>
</div>
<div class="flex flex-col min-w-0">
<div class="flex items-center gap-1.5">
<span class="font-headline-sm text-headline-sm text-on-surface truncate">Dawit Tadesse</span>
<span class="material-symbols-outlined text-primary text-[18px]" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">3,480 completed trips</p>
</div>
</div>
<!-- Start PIN Highlight Box -->
<div class="bg-surface-container-high px-3.5 py-2 rounded-2xl flex flex-col items-center shrink-0 shadow-sm">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider">Start PIN</span>
<span class="font-currency-display text-currency-display text-primary tracking-widest font-extrabold">4892</span>
</div>
</div>
<!-- Local Quick Message Chips -->
<div class="flex items-center gap-2 overflow-x-auto pb-1 no-scrollbar">
<button class="px-3 py-1.5 bg-surface-container-low text-on-surface-variant rounded-full font-label-md text-label-md shrink-0 active:bg-primary active:text-on-primary transition-colors flex items-center gap-1" onclick="sendQuickMessage('I see you!')">
<span class="material-symbols-outlined text-[15px]">visibility</span>
        I see you!
      </button>
<button class="px-3 py-1.5 bg-surface-container-low text-on-surface-variant rounded-full font-label-md text-label-md shrink-0 active:bg-primary active:text-on-primary transition-colors flex items-center gap-1" onclick="sendQuickMessage('I am wearing a blue jacket')">
<span class="material-symbols-outlined text-[15px]">man</span>
        Wearing blue jacket
      </button>
<button class="px-3 py-1.5 bg-surface-container-low text-on-surface-variant rounded-full font-label-md text-label-md shrink-0 active:bg-primary active:text-on-primary transition-colors flex items-center gap-1" onclick="sendQuickMessage('At Edna Mall gate')">
<span class="material-symbols-outlined text-[15px]">storefront</span>
        At Edna Mall gate
      </button>
</div>
<!-- Quick Communication Action Grid -->
<div class="grid grid-cols-4 gap-2.5">
<!-- Call Action -->
<a class="col-span-2 py-3 px-4 bg-primary text-on-primary rounded-xl font-headline-sm text-headline-sm flex items-center justify-center gap-2 shadow-md active:opacity-95 transition-opacity" href="tel:+251911000000">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">phone_in_talk</span>
<span>Call Driver</span>
</a>
<!-- Chat Action -->
<button class="col-span-1 py-3 bg-surface-container-low text-primary rounded-xl font-headline-sm text-headline-sm flex flex-col items-center justify-center gap-0.5 shadow-sm active:bg-surface-container-high transition-colors">
<span class="material-symbols-outlined text-[20px]">chat</span>
<span class="font-label-sm text-label-sm">Chat</span>
</button>
<!-- Safety Share -->
<button class="col-span-1 py-3 bg-surface-container-low text-on-surface rounded-xl font-headline-sm text-headline-sm flex flex-col items-center justify-center gap-0.5 shadow-sm active:bg-surface-container-high transition-colors">
<span class="material-symbols-outlined text-[20px]">share_location</span>
<span class="font-label-sm text-label-sm">Share</span>
</button>
</div>
<!-- Ride Settlement & Destination Summary -->
<div class="bg-surface-container-low/70 rounded-2xl p-3 flex flex-col gap-2.5">
<div class="flex items-center justify-between">
<div class="flex items-center gap-2">
<!-- Telebirr Localized Badge -->
<div class="flex items-center gap-1 px-2.5 py-1 bg-surface-container-lowest rounded-full shadow-sm">
<span class="w-2.5 h-2.5 rounded-full bg-secondary"></span>
<span class="font-label-sm text-label-sm text-secondary font-bold">telebirr</span>
</div>
<span class="font-body-md text-body-md text-on-surface-variant">Auto-Pay linked</span>
</div>
<div class="flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm text-on-surface font-extrabold">120.00</span>
<span class="font-label-sm text-label-sm text-outline">ETB</span>
</div>
</div>
<!-- Destination micro-preview -->
<div class="flex items-center gap-2 pt-2 border-t-0 text-on-surface-variant">
<span class="material-symbols-outlined text-primary text-[18px]">location_on</span>
<span class="font-body-md text-body-md truncate">Drop-off: Kazanchis, UNECA Conference Center</span>
</div>
</div>
<!-- Secondary Emergency & Cancellation Links -->
<div class="flex items-center justify-between pt-1 px-1">
<button class="font-label-md text-label-md text-error flex items-center gap-1 hover:underline">
<span class="material-symbols-outlined text-[16px]">cancel</span>
        Cancel ride
      </button>
<button class="font-label-md text-label-md text-outline flex items-center gap-1 hover:underline">
<span class="material-symbols-outlined text-[16px]">help_center</span>
        Driver cannot find me
      </button>
</div>
</div>
</div>
<script>
  // Countdown interaction for free waiting time
  (function() {
    let secondsLeft = 165;
    const timerElem = document.getElementById('waiting-timer');
    if (!timerElem) return;

    const interval = setInterval(() => {
      if (secondsLeft <= 0) {
        timerElem.textContent = 'Paid Wait';
        clearInterval(interval);
        return;
      }
      secondsLeft--;
      const mins = Math.floor(secondsLeft / 60);
      const secs = secondsLeft % 60;
      timerElem.textContent = `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
    }, 1000);

})();

function sendQuickMessage(text) {
alert('Message sent to Dawit: "' + text + '"');
}
</script></main></body></html>

<!-- ZemenGo - Driver Assigned -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100vw;margin:0;padding:0;font-family:'Plus Jakarta Sans',sans-serif;}body{overscroll-behavior:none;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"inverse-on-surface":"#eef0ff","tertiary-fixed":"#6ffbbe","on-primary-fixed":"#001551","on-error-container":"#93000a","on-primary-fixed-variant":"#0039b4","inverse-surface":"#283044","surface-variant":"#dae2fd","tertiary":"#005539","outline-variant":"#c3c5d8","on-tertiary":"#ffffff","primary":"#003cbb","surface-bright":"#faf8ff","surface-container-highest":"#dae2fd","on-tertiary-container":"#6af7b9","on-secondary-fixed-variant":"#004c6e","surface-container-lowest":"#ffffff","secondary-fixed-dim":"#89ceff","on-secondary-fixed":"#001e2f","primary-fixed":"#dce1ff","on-primary":"#ffffff","inverse-primary":"#b7c4ff","on-secondary":"#ffffff","primary-container":"#1852e8","outline":"#747687","secondary":"#006591","surface-container-low":"#f2f3ff","secondary-container":"#39b8fd","on-primary-container":"#d6dcff","error-container":"#ffdad6","surface-tint":"#104ee5","error":"#ba1a1a","surface-dim":"#d2d9f4","secondary-fixed":"#c9e6ff","surface":"#faf8ff","background":"#faf8ff","tertiary-fixed-dim":"#4edea3","surface-container-high":"#e2e7ff","on-tertiary-fixed-variant":"#005236","primary-fixed-dim":"#b7c4ff","on-tertiary-fixed":"#002113","surface-container":"#eaedff","on-secondary-container":"#004666","on-background":"#131b2e","on-surface":"#131b2e","on-surface-variant":"#434655","on-error":"#ffffff","tertiary-container":"#00704c"},borderRadius:{DEFAULT:"0.25rem",lg:"0.5rem",xl:"0.75rem",full:"9999px"},spacing:{"space-md":"1rem",margin:"1rem","space-2xs":"0.25rem","space-lg":"1.25rem",gutter:"1rem","space-xl":"1.5rem","space-2xl":"2rem","space-sm":"0.75rem","space-xs":"0.5rem"},fontFamily:{"display-lg":["Plus Jakarta Sans"],"body-lg-medium":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"body-lg":["Plus Jakarta Sans"],"headline-md":["Plus Jakarta Sans"],"display-lg-mobile":["Plus Jakarta Sans"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"body-md":["Plus Jakarta Sans"],"body-md-medium":["Plus Jakarta Sans"],"currency-display":["Plus Jakarta Sans"]},fontSize:{"display-lg":["36px",{lineHeight:"44px",letterSpacing:"-0.03em",fontWeight:"800"}],"body-lg-medium":["16px",{lineHeight:"24px",fontWeight:"500"}],"headline-lg":["24px",{lineHeight:"32px",letterSpacing:"-0.02em",fontWeight:"700"}],"label-md":["12px",{lineHeight:"16px",letterSpacing:"0.02em",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"24px",fontWeight:"400"}],"headline-md":["20px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"700"}],"display-lg-mobile":["28px",{lineHeight:"34px",letterSpacing:"-0.02em",fontWeight:"800"}],"label-sm":["11px",{lineHeight:"14px",letterSpacing:"0.04em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"24px",fontWeight:"600"}],"body-md":["14px",{lineHeight:"20px",fontWeight:"400"}],"body-md-medium":["14px",{lineHeight:"20px",fontWeight:"600"}],"currency-display":["22px",{lineHeight:"28px",letterSpacing:"-0.01em",fontWeight:"800"}]}}}</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
</head><body class="bg-surface font-body-md text-on-surface flex flex-col min-h-screen pt-safe pb-safe"><main class="flex flex-col relative w-full h-full bg-surface flex-1"><div class="flex flex-col w-full relative">
<!-- Interactive Live Map Header Area -->
<div class="relative w-full h-80 overflow-hidden bg-surface-container">
<div class="w-full h-full bg-cover bg-center" data-location="Bole Medhanealem, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDWkWTTrTQ-E8wdR5BQsfvvI1GUyDYUxRN1u8TEzNR0PKPPzkfjPA8A_L75oUQibFGemNcRN7m1gwaVPcqWdX_UJ58C_5XCp5Chv13m2qYZc-q9VnD4xGbBWQh5lsan8SKaFFb9BUd3SpSvbaaEORts8RvMoYMMsIKzwyoZxoFbpPChZ8YaLz-z1p0hjRnmUwR-rT_fCJQf9AZxO6xwDGRRsIQ6Tg-yZSiVCpvvVIRggLmFKRzl5Q3Lkg')"></div>
<div class="absolute inset-0 bg-gradient-to-b from-inverse-surface/40 via-transparent to-surface pointer-events-none"></div>
<!-- Top Floating Quick Controls -->
<div class="absolute top-4 inset-x-4 flex items-center justify-between pointer-events-auto">
<button aria-label="Back to dashboard" class="w-12 h-12 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-on-surface active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[24px]">arrow_back</span>
</button>
<!-- Live Driver Status Capsule -->
<div class="flex items-center gap-2 bg-surface-container-lowest/95 backdrop-blur-md px-4 py-2 rounded-full shadow-lg">
<div class="relative flex items-center justify-center">
<span class="w-2.5 h-2.5 rounded-full bg-primary-container animate-ping absolute"></span>
<span class="w-2.5 h-2.5 rounded-full bg-primary-container relative"></span>
</div>
<div class="flex flex-col">
<span class="font-label-sm text-primary-container uppercase tracking-wider leading-tight">Driver Assigned</span>
<span class="font-body-md-medium text-on-surface leading-none">Arriving in 4 min</span>
</div>
</div>
<button aria-label="Center Map" class="w-12 h-12 rounded-full bg-surface-container-lowest shadow-md flex items-center justify-center text-on-surface active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[24px]">my_location</span>
</button>
</div>
<!-- Active Route Over-Map Badges -->
<div class="absolute bottom-6 left-4 flex items-center gap-2 bg-surface-container-lowest/90 backdrop-blur px-3 py-1.5 rounded-full shadow-sm">
<span class="material-symbols-outlined text-[18px] text-tertiary">near_me</span>
<span class="font-label-md text-on-surface">Cameroon St • 650m away</span>
</div>
</div>
<!-- Bottom Sheet Driver Information & Ride Cockpit -->
<div class="relative -mt-4 bg-surface rounded-t-3xl px-4 pt-3 pb-8 flex flex-col gap-4 shadow-xl">
<!-- Pull Pill Sheet Indicator -->
<div class="w-12 h-1.5 bg-outline-variant/60 rounded-full mx-auto mb-1"></div>
<!-- Safe Ride PIN Security Highlight Card -->
<div class="w-full bg-surface-container-high rounded-2xl p-3 flex items-center justify-between">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-xl bg-primary-container text-on-primary flex items-center justify-center">
<span class="material-symbols-outlined text-[22px]">pin</span>
</div>
<div class="flex flex-col">
<span class="font-label-sm text-on-surface-variant uppercase tracking-wider">Ride Verification Code</span>
<span class="font-body-md text-on-surface">Share with Dawit before trip start</span>
</div>
</div>
<div class="bg-primary-container text-on-primary px-3.5 py-1 rounded-xl shadow-sm">
<span class="font-currency-display tracking-widest">4892</span>
</div>
</div>
<!-- Driver & Vehicle Profile Showcase Card -->
<div class="w-full bg-surface-container-lowest rounded-2xl p-4 shadow-sm flex flex-col gap-4">
<!-- Top Driver Identity Row -->
<div class="flex items-start justify-between">
<div class="flex items-center gap-3.5">
<div class="relative">
<img alt="Dawit Tadesse" class="w-16 h-16 rounded-full object-cover shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCMJi5VBXTPpKry5jOQ1Ptq_jN82a2z38hq1id1i8Y7laadjbGV9bFud84cNQypyRanG7mFq5IjB1haBlufwGUqIwvCq87nqDv9-IAt20KXhh9VL7baEI9pXeJdeuieH0lWFpAPUYjmPQR04sUVwJECNiysWLmaghqzyNv2wpRmv_5TCny--iZiz0vCSBMKmyXyN5yhO3Z4whZ7zRRY_yu6r9yB9QZqaa5al3Vl2jJpORm4rSD61QIeEw"/>
<div class="absolute -bottom-1 -right-1 bg-tertiary text-on-tertiary rounded-full p-0.5 flex items-center justify-center shadow-xs">
<span class="material-symbols-outlined text-[16px]" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
</div>
<div class="flex flex-col">
<div class="flex items-center gap-1.5">
<span class="font-headline-sm text-on-surface">Dawit Tadesse</span>
</div>
<div class="flex items-center gap-1.5 mt-0.5">
<div class="flex items-center text-amber-500">
<span class="material-symbols-outlined text-[16px]" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-md text-on-surface ml-0.5">4.92</span>
</div>
<span class="text-outline-variant">•</span>
<span class="font-label-md text-on-surface-variant">1,420 trips</span>
</div>
<span class="font-label-sm text-primary-container bg-surface-container px-2 py-0.5 rounded-full w-max mt-1">Top Rated Partner</span>
</div>
</div>
<!-- Quick Call Action floating over driver -->
<a aria-label="Call Driver" class="w-12 h-12 rounded-full bg-surface-container flex items-center justify-center text-primary-container active:scale-95 transition-transform" href="tel:+251911000000">
<span class="material-symbols-outlined text-[24px]">call</span>
</a>
</div>
<!-- Vehicle Card Details Grid -->
<div class="bg-surface-container-low rounded-xl p-3.5 flex items-center justify-between">
<div class="flex flex-col gap-1.5">
<div class="flex items-center gap-1.5">
<span class="font-body-lg-medium text-on-surface">Toyota Corolla</span>
<span class="font-label-sm text-on-surface-variant bg-surface-container px-2 py-0.5 rounded">White</span>
</div>
<!-- Official Ethiopian License Plate Mockup -->
<div class="flex items-center gap-1.5 bg-surface-container-lowest px-2.5 py-1 rounded-lg shadow-2xs w-max">
<svg class="w-4 h-3 rounded-2xs" viewbox="0 0 640 480">
<path d="M0 0h640v160H0z" fill="#078930"></path>
<path d="M0 160h640v160H0z" fill="#fcdd09"></path>
<path d="M0 320h640v160H0z" fill="#da121a"></path>
<circle cx="320" cy="240" fill="#0f47af" r="60"></circle>
<path d="m320 205 10 32h34l-27 20 10 32-27-20-27 20 10-32-27-20h34z" fill="#fcdd09"></path>
</svg>
<span class="font-label-md text-on-surface tracking-wider">03 • A42981 ET</span>
</div>
</div>
<div class="relative w-28 h-16 flex items-center justify-center">
<img class="w-full h-full object-contain drop-shadow-sm" data-alt="Side profile clean contemporary white Toyota Corolla sedan in pristine studio lighting high contrast minimalist automotive design" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAEreRHxNKptI6P0XKoWesqX8JtUcxLwcCOC_cm-23m56WZwRN7YAsnF8awca8mxHJda9EZBOY6rwI68TL8vXTC-D3jiwo8iAPvysN0xZbmhWeN_NeRg8-cXqQfFZ6NQax8F8-twdqEIV1H8kB2NO3Y2Kdz3o6OIq_4rtyBGnOfQyvd-NAbxMKj-Mk0jhFmykavJB6f8XsTtY2tUgyBaiV7TutFDvEBzmyWCNbQa471EUUeYuBGhlV0oQ"/>
</div>
</div>
<!-- Driver Instant Message Dispatch -->
<div class="flex items-center gap-2 bg-surface-container-low p-2 rounded-xl">
<div class="flex-1 bg-surface-container-lowest rounded-lg px-3 py-2 flex items-center justify-between text-on-surface-variant">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[18px] text-primary-container">chat_bubble</span>
<span class="font-body-md text-on-surface truncate">"I'm turning into the main gate"</span>
</div>
<span class="w-2 h-2 rounded-full bg-primary-container"></span>
</div>
<button aria-label="Reply to driver" class="bg-primary-container text-on-primary p-2 rounded-lg flex items-center justify-center active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[20px]">send</span>
</button>
</div>
</div>
<!-- Communication & Utility Action Row -->
<div class="grid grid-cols-3 gap-2.5">
<button class="flex flex-col items-center justify-center gap-1.5 py-3 px-2 rounded-xl bg-surface-container-lowest shadow-2xs active:bg-surface-container-high transition-colors">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center text-primary-container">
<span class="material-symbols-outlined text-[22px]">sms</span>
</div>
<span class="font-label-md text-on-surface">Chat Dawit</span>
</button>
<button class="flex flex-col items-center justify-center gap-1.5 py-3 px-2 rounded-xl bg-surface-container-lowest shadow-2xs active:bg-surface-container-high transition-colors">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center text-primary-container">
<span class="material-symbols-outlined text-[22px]">share_location</span>
</div>
<span class="font-label-md text-on-surface">Share Trip</span>
</button>
<button class="flex flex-col items-center justify-center gap-1.5 py-3 px-2 rounded-xl bg-surface-container-lowest shadow-2xs active:bg-surface-container-high transition-colors">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center text-error">
<span class="material-symbols-outlined text-[22px]">close</span>
</div>
<span class="font-label-md text-error">Cancel Ride</span>
</button>
</div>
<!-- Route Overview & Telebirr Fare Container -->
<div class="bg-surface-container-lowest rounded-2xl p-4 shadow-sm flex flex-col gap-3">
<!-- Route Timeline Points -->
<div class="flex flex-col gap-3 relative">
<!-- Connecting Line -->
<div class="absolute left-3 top-3.5 bottom-3.5 w-0.5 bg-outline-variant/50"></div>
<!-- Pickup Row -->
<div class="flex items-start gap-3 relative">
<div class="w-6 h-6 rounded-full bg-tertiary/15 text-tertiary flex items-center justify-center shrink-0 z-10 bg-surface-container-lowest">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">circle</span>
</div>
<div class="flex flex-col min-w-0">
<span class="font-label-sm text-on-surface-variant uppercase">Pickup Point</span>
<span class="font-body-md-medium text-on-surface truncate">Bole Medhanealem (Morning Star Mall)</span>
</div>
</div>
<!-- Dropoff Row -->
<div class="flex items-start gap-3 relative">
<div class="w-6 h-6 rounded-md bg-primary-container text-on-primary flex items-center justify-center shrink-0 z-10">
<span class="material-symbols-outlined text-[14px]">location_on</span>
</div>
<div class="flex flex-col min-w-0">
<span class="font-label-sm text-on-surface-variant uppercase">Dropoff Point</span>
<span class="font-body-md-medium text-on-surface truncate">Kazanchis, UNECA Gate 2</span>
</div>
</div>
</div>
<!-- Payment Method Indicator -->
<div class="pt-3 flex items-center justify-between bg-surface-container-low -mx-4 -mb-4 p-3 rounded-b-2xl">
<div class="flex items-center gap-2">
<!-- Telebirr Branded Badge -->
<div class="flex items-center gap-1.5 bg-secondary-fixed px-2.5 py-1 rounded-md text-on-secondary-fixed">
<span class="material-symbols-outlined text-[16px]">account_balance_wallet</span>
<span class="font-label-md">telebirr</span>
</div>
<span class="font-label-sm text-on-surface-variant">Pre-authorized</span>
</div>
<div class="flex items-baseline gap-1">
<span class="font-currency-display text-on-surface">120.00</span>
<span class="font-label-sm text-on-surface-variant">ETB</span>
</div>
</div>
</div>
<!-- Safety Trust Shield Footer -->
<div class="w-full bg-tertiary/10 rounded-xl px-3.5 py-2.5 flex items-center gap-3">
<div class="w-8 h-8 rounded-lg bg-tertiary text-on-tertiary flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">shield</span>
</div>
<div class="flex flex-col">
<span class="font-label-md text-tertiary">ZemenGo Shield Active</span>
<span class="font-label-sm text-on-surface-variant">24/7 Addis Ababa Emergency &amp; Trip Audio Protection</span>
</div>
</div>
</div>
</div>
<script>
  // Simple micro-interaction for arrival tracker countdown demo
  (function() {
    let minutes = 4;
    const badge = document.querySelector('[aria-label="Back to dashboard"] + div span:last-child');
    if (badge) {
      const interval = setInterval(() => {
        if (minutes > 1) {
          minutes--;
          badge.textContent = 'Arriving in ' + minutes + ' min';
        } else {
          badge.textContent = 'Driver Arrived';
          clearInterval(interval);
        }
      }, 45000);
    }
  })();
</script></main></body></html>
<!-- ZemenGo - Ride History & Trips -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_tab" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100%;margin:0;padding:0;min-height:100%;}body{overscroll-behavior-y:none;-webkit-tap-highlight-color:transparent;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "surface-tint": "#104ee5", "on-tertiary": "#ffffff", "primary-container": "#1852e8", "on-surface-variant": "#434655", "background": "#faf8ff", "on-tertiary-fixed": "#002113", "tertiary": "#005539", "on-background": "#131b2e", "on-secondary": "#ffffff", "surface-dim": "#d2d9f4", "error-container": "#ffdad6", "on-primary-fixed-variant": "#0039b4", "secondary-container": "#39b8fd", "surface": "#faf8ff", "primary-fixed-dim": "#b7c4ff", "error": "#ba1a1a", "on-tertiary-fixed-variant": "#005236", "primary-fixed": "#dce1ff", "on-primary-fixed": "#001551", "on-surface": "#131b2e", "on-secondary-container": "#004666", "on-secondary-fixed": "#001e2f", "tertiary-fixed-dim": "#4edea3", "tertiary-fixed": "#6ffbbe", "primary": "#003cbb", "on-error": "#ffffff", "surface-container-high": "#e2e7ff", "surface-container-low": "#f2f3ff", "secondary": "#006591", "inverse-on-surface": "#eef0ff", "outline": "#747687", "outline-variant": "#c3c5d8", "surface-container-highest": "#dae2fd", "inverse-primary": "#b7c4ff", "on-error-container": "#93000a", "surface-bright": "#faf8ff", "on-primary-container": "#d6dcff", "on-tertiary-container": "#6af7b9", "tertiary-container": "#00704c", "secondary-fixed": "#c9e6ff", "surface-variant": "#dae2fd", "on-primary": "#ffffff", "inverse-surface": "#283044", "surface-container": "#eaedff", "surface-container-lowest": "#ffffff", "secondary-fixed-dim": "#89ceff", "on-secondary-fixed-variant": "#004c6e" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-sm": "0.75rem", "space-xl": "1.5rem", "space-lg": "1.25rem", "gutter": "1rem", "space-2xl": "2rem", "space-2xs": "0.25rem", "margin": "1rem", "space-xs": "0.5rem", "space-md": "1rem" }, fontFamily: { "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "body-md-medium": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }], "display-lg-mobile": ["28px", { "lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "800" }], "currency-display": ["22px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "800" }], "body-md-medium": ["14px", { "lineHeight": "20px", "fontWeight": "600" }], "headline-lg": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "headline-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }], "body-lg": ["16px", { "lineHeight": "24px", "fontWeight": "400" }], "body-lg-medium": ["16px", { "lineHeight": "24px", "fontWeight": "500" }], "display-lg": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.03em", "fontWeight": "800" }], "label-md": ["12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" }], "headline-md": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "700" }], "label-sm": ["11px", { "lineHeight": "14px", "letterSpacing": "0.04em", "fontWeight": "700" }] } } } };</script></head><body class="bg-surface text-on-surface font-body-md min-h-screen flex flex-col antialiased selection:bg-primary-container selection:text-on-primary"><header class="fixed top-0 inset-x-0 z-50 bg-surface/90 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.03)]"><div class="w-full flex items-center justify-between px-6 pt-3 pb-1"><span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">9:41</span><div class="w-28 h-6 bg-inverse-surface rounded-full flex items-center justify-center"><div class="w-2.5 h-2.5 rounded-full bg-surface-dim/40 mr-2"></div><div class="w-2 h-2 rounded-full bg-primary-container/80"></div></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-base">signal_cellular_alt</span><span class="material-symbols-outlined text-base">wifi</span><span class="material-symbols-outlined text-base">battery_full</span></div></div><div class="h-14 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><div class="w-8 h-8 rounded-lg bg-primary-container flex items-center justify-center text-on-primary shadow-sm"><span class="material-symbols-outlined text-lg">local_taxi</span></div><span class="font-headline-sm text-headline-sm font-bold tracking-tight text-on-surface">Trip History</span></div><div class="flex items-center gap-space-sm"><button class="w-11 h-11 rounded-full flex items-center justify-center text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-colors"><span class="material-symbols-outlined text-xl">notifications</span></button><img alt="Profile" class="w-8 h-8 rounded-full object-cover" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/></div></div></header><main class="flex-1 flex flex-col relative w-full max-w-[480px] mx-auto px-margin pt-24 pb-28 bg-surface"><div class="flex flex-col w-full pb-6 gap-space-md">
<!-- Search & Filter Area -->
<div class="flex items-center gap-space-xs bg-surface-container-lowest p-space-xs rounded-xl shadow-sm">
<span class="material-symbols-outlined text-outline ml-1">search</span>
<input class="w-full bg-transparent font-body-md text-on-surface placeholder:text-outline focus:outline-none" placeholder="Search trips, drivers, locations..." type="text"/>
<button class="w-8 h-8 rounded-lg bg-surface-container-high flex items-center justify-center text-on-surface-variant hover:bg-surface-variant transition-colors">
<span class="material-symbols-outlined text-lg">tune</span>
</button>
</div>
<!-- Filter Pills Bar -->
<div class="flex items-center gap-space-xs overflow-x-auto pb-1 no-scrollbar">
<button class="px-space-md py-1.5 rounded-full bg-primary-container text-on-primary font-label-md text-label-md shadow-sm transition-transform active:scale-95 flex items-center gap-1.5 shrink-0">
<span>All</span>
<span class="px-1.5 py-0.5 rounded-full bg-white/20 text-on-primary text-[10px] font-bold">14</span>
</button>
<button class="px-space-md py-1.5 rounded-full bg-surface-container-lowest text-on-surface-variant font-label-md text-label-md shadow-sm transition-transform active:scale-95 hover:bg-surface-container-high shrink-0">
      Completed
    </button>
<button class="px-space-md py-1.5 rounded-full bg-surface-container-lowest text-on-surface-variant font-label-md text-label-md shadow-sm transition-transform active:scale-95 hover:bg-surface-container-high shrink-0">
      Business
    </button>
<button class="px-space-md py-1.5 rounded-full bg-surface-container-lowest text-on-surface-variant font-label-md text-label-md shadow-sm transition-transform active:scale-95 hover:bg-surface-container-high shrink-0">
      Canceled
    </button>
</div>
<!-- Trips List Container -->
<div class="flex flex-col gap-space-md">
<!-- Card 1 (Most Recent - Today) -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm flex flex-col gap-space-sm relative overflow-hidden transition-all duration-200">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">Today, 10:42 AM</span>
<span class="font-label-sm text-label-sm text-outline-variant font-medium text-on-surface-variant mt-0.5">Economy Class • 6.4 km (18 min)</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-tertiary-fixed text-on-tertiary-fixed-variant font-label-sm text-label-sm font-bold flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary animate-pulse"></span>
          Completed
        </span>
</div>
<!-- Route Visualizer -->
<div class="flex items-stretch gap-3 my-1">
<!-- Node connector -->
<div class="flex flex-col items-center justify-between py-1">
<div class="w-2.5 h-2.5 rounded-full bg-tertiary shadow-[0_0_0_2px_#6ffbbe]"></div>
<div class="w-0.5 h-7 border-l-2 border-dashed border-outline-variant my-1"></div>
<div class="w-2.5 h-2.5 rounded-sm bg-primary-container shadow-[0_0_0_2px_#dce1ff]"></div>
</div>
<div class="flex flex-col justify-between w-full min-w-0 py-0.5">
<div class="truncate">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider block">Pickup</span>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Bole Medhanealem (Edna Mall)</p>
</div>
<div class="truncate mt-1.5">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider block">Dropoff</span>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Kazanchis, UNECA Gate 2</p>
</div>
</div>
</div>
<!-- Driver & Fare Banner -->
<div class="p-space-xs rounded-lg bg-surface-container-low flex items-center justify-between">
<div class="flex items-center gap-space-xs min-w-0">
<div class="relative w-10 h-10 shrink-0">
<img alt="Dawit Tadesse" class="w-full h-full rounded-full object-cover" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/>
<span class="absolute -bottom-1 -right-1 px-1 bg-surface-container-lowest rounded-full font-label-sm text-label-sm font-bold text-on-surface shadow-xs flex items-center text-[10px]">
              ★ 4.9
            </span>
</div>
<div class="flex flex-col min-w-0">
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Dawit Tadesse</p>
<p class="font-label-sm text-label-sm text-on-surface-variant truncate">Toyota Corolla • 03-B4281</p>
</div>
</div>
<div class="text-right shrink-0">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface">120.00 ETB</span>
<span class="block px-2 py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-sm text-label-sm text-center font-bold">
            Telebirr
          </span>
</div>
</div>
<!-- Actions -->
<div class="flex items-center gap-space-xs pt-1">
<button class="flex-1 py-2.5 px-3 rounded-lg bg-primary-container text-on-primary font-headline-sm text-sm font-semibold flex items-center justify-center gap-1.5 active:scale-98 transition-transform shadow-xs">
<span class="material-symbols-outlined text-base">replay</span>
          Rebook Ride
        </button>
<button class="flex-1 py-2.5 px-3 rounded-lg bg-surface-container-high text-on-surface font-headline-sm text-sm font-semibold flex items-center justify-center gap-1.5 active:scale-98 transition-transform hover:bg-surface-variant">
<span class="material-symbols-outlined text-base">receipt_long</span>
          View Receipt
        </button>
</div>
</div>
<!-- Card 2 (Yesterday) -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm flex flex-col gap-space-sm relative overflow-hidden transition-all duration-200">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">Yesterday, 3:15 PM</span>
<span class="font-label-sm text-label-sm text-on-surface-variant mt-0.5">Comfort Class • 4.1 km (12 min)</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-tertiary-fixed text-on-tertiary-fixed-variant font-label-sm text-label-sm font-bold flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary"></span>
          Completed
        </span>
</div>
<!-- Route Visualizer -->
<div class="flex items-stretch gap-3 my-1">
<div class="flex flex-col items-center justify-between py-1">
<div class="w-2.5 h-2.5 rounded-full bg-tertiary shadow-[0_0_0_2px_#6ffbbe]"></div>
<div class="w-0.5 h-7 border-l-2 border-dashed border-outline-variant my-1"></div>
<div class="w-2.5 h-2.5 rounded-sm bg-primary-container shadow-[0_0_0_2px_#dce1ff]"></div>
</div>
<div class="flex flex-col justify-between w-full min-w-0 py-0.5">
<div class="truncate">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider block">Pickup</span>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Bole Atlas</p>
</div>
<div class="truncate mt-1.5">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider block">Dropoff</span>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Edna Mall Bay</p>
</div>
</div>
</div>
<!-- Driver & Fare Banner -->
<div class="p-space-xs rounded-lg bg-surface-container-low flex items-center justify-between">
<div class="flex items-center gap-space-xs min-w-0">
<div class="relative w-10 h-10 shrink-0">
<img class="w-full h-full rounded-full object-cover" data-alt="Close up warm headshot portrait of Abebe, a mature Ethiopian professional male driver in casual wear smiling confidentially in daylight vehicle setting, soft natural lighting." src="https://lh3.googleusercontent.com/aida-public/AB6AXuC6aFq_Yma4r5T8TRaRNr8TKXrhOHvFGSuWUk0IDUUibxiLA3Jk_S2b29yoD_MpPVONF99QiOjGjFN1Aep0No7g_Jmuph3wQtV2kvgjALXtQfNOozR_qkG_Mlb-NDSrpxcqesUET8UiBccmQXQWQ7kWrQeY_JOFV0uR7ei0fc12sfikHyJjAg8pEcocONDVtk6KAXogLVtHtQWaKW0xL-XvRA72EfShT6fkGM-E1naxgNfN2A_LiKAOSA"/>
<span class="absolute -bottom-1 -right-1 px-1 bg-surface-container-lowest rounded-full font-label-sm text-label-sm font-bold text-on-surface shadow-xs flex items-center text-[10px]">
              ★ 4.8
            </span>
</div>
<div class="flex flex-col min-w-0">
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Abebe M.</p>
<p class="font-label-sm text-label-sm text-on-surface-variant truncate">Hyundai Elantra • 02-A9014</p>
</div>
</div>
<div class="text-right shrink-0">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface">180.00 ETB</span>
<span class="block px-2 py-0.5 rounded-full bg-surface-container-high text-primary font-label-sm text-label-sm text-center font-bold">
            CBE Birr
          </span>
</div>
</div>
<!-- Actions -->
<div class="flex items-center gap-space-xs pt-1">
<button class="flex-1 py-2.5 px-3 rounded-lg bg-primary-container text-on-primary font-headline-sm text-sm font-semibold flex items-center justify-center gap-1.5 active:scale-98 transition-transform shadow-xs">
<span class="material-symbols-outlined text-base">replay</span>
          Rebook
        </button>
<button class="flex-1 py-2.5 px-3 rounded-lg bg-surface-container-high text-on-surface font-headline-sm text-sm font-semibold flex items-center justify-center gap-1.5 active:scale-98 transition-transform hover:bg-surface-variant">
<span class="material-symbols-outlined text-base">receipt_long</span>
          Receipt
        </button>
</div>
</div>
<!-- Card 3 (Last Week) -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm flex flex-col gap-space-sm relative overflow-hidden transition-all duration-200">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">Oct 24, 8:40 AM</span>
<span class="font-label-sm text-label-sm text-on-surface-variant mt-0.5">Economy Class • 8.7 km (24 min)</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-tertiary-fixed text-on-tertiary-fixed-variant font-label-sm text-label-sm font-bold flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary"></span>
          Completed
        </span>
</div>
<!-- Route Visualizer -->
<div class="flex items-stretch gap-3 my-1">
<div class="flex flex-col items-center justify-between py-1">
<div class="w-2.5 h-2.5 rounded-full bg-tertiary shadow-[0_0_0_2px_#6ffbbe]"></div>
<div class="w-0.5 h-7 border-l-2 border-dashed border-outline-variant my-1"></div>
<div class="w-2.5 h-2.5 rounded-sm bg-primary-container shadow-[0_0_0_2px_#dce1ff]"></div>
</div>
<div class="flex flex-col justify-between w-full min-w-0 py-0.5">
<div class="truncate">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider block">Pickup</span>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Meskel Square</p>
</div>
<div class="truncate mt-1.5">
<span class="font-label-sm text-label-sm text-outline uppercase tracking-wider block">Dropoff</span>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Bole Airport Terminal 2</p>
</div>
</div>
</div>
<!-- Driver & Fare Banner -->
<div class="p-space-xs rounded-lg bg-surface-container-low flex items-center justify-between">
<div class="flex items-center gap-space-xs min-w-0">
<div class="relative w-10 h-10 shrink-0">
<img class="w-full h-full rounded-full object-cover" data-alt="Friendly young Ethiopian professional driver with a clean haircut, smiling warmly while seated inside an immaculate sedan on an urban morning Addis Ababa backdrop." src="https://lh3.googleusercontent.com/aida-public/AB6AXuAvYM0kE-95JGEyCnexy-Ka2UygMEMDCpn_VljOkfE_Yos8lrc9kK7AxF3I5m6pU9TsQDaGjQ5GbREE9Gz-ZqXj-Q_sUfCkzydFHY8zpXcampQnC2EXbUFcZyASttIAkLGAyAelGMGtl3x2vRdEXObOUGPT_ButK2O3JBs01OCKEiABkMqQKLE1onrbcTyRsVQBcF3UuNUs8Av04ijR8LhZjYTeX7tWoBBJ_dX4MuhJllQgWx_ta-sn-Q"/>
<span class="absolute -bottom-1 -right-1 px-1 bg-surface-container-lowest rounded-full font-label-sm text-label-sm font-bold text-on-surface shadow-xs flex items-center text-[10px]">
              ★ 5.0
            </span>
</div>
<div class="flex flex-col min-w-0">
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Solomon K.</p>
<p class="font-label-sm text-label-sm text-on-surface-variant truncate">Suzuki Dzire • 03-C3110</p>
</div>
</div>
<div class="text-right shrink-0">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface">210.00 ETB</span>
<span class="block px-2 py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-sm text-label-sm text-center font-bold">
            Telebirr
          </span>
</div>
</div>
<!-- Actions -->
<div class="flex items-center gap-space-xs pt-1">
<button class="flex-1 py-2.5 px-3 rounded-lg bg-primary-container text-on-primary font-headline-sm text-sm font-semibold flex items-center justify-center gap-1.5 active:scale-98 transition-transform shadow-xs">
<span class="material-symbols-outlined text-base">replay</span>
          Rebook
        </button>
<button class="flex-1 py-2.5 px-3 rounded-lg bg-surface-container-high text-on-surface font-headline-sm text-sm font-semibold flex items-center justify-center gap-1.5 active:scale-98 transition-transform hover:bg-surface-variant">
<span class="material-symbols-outlined text-base">receipt_long</span>
          Receipt
        </button>
</div>
</div>
</div>
<!-- End of List Delight Note -->
<div class="flex flex-col items-center justify-center py-space-sm text-center gap-1 text-on-surface-variant opacity-80">
<div class="w-8 h-8 rounded-full bg-surface-container flex items-center justify-center text-primary-container mb-1">
<span class="material-symbols-outlined text-lg">verified</span>
</div>
<p class="font-label-md text-label-md font-semibold">You're all caught up!</p>
<p class="font-label-sm text-label-sm text-outline">All receipts are verified and backed by ZemenGo ride insurance.</p>
</div>
</div>
<script>
  // Simple micro-interaction for tab filtering
  document.querySelectorAll('button').forEach(btn => {
    btn.addEventListener('click', function() {
      if (this.textContent.includes('Rebook') || this.textContent.includes('Receipt')) {
        this.classList.add('scale-95');
        setTimeout(() => this.classList.remove('scale-95'), 150);
      }
    });
  });
</script></main><nav class="fixed bottom-0 inset-x-0 z-50 pb-safe bg-surface/95 backdrop-blur-xl shadow-[0_-4px_16px_rgba(19,27,46,0.04)]" data-active-classes="text-primary-container font-headline-sm"><div class="max-w-[480px] mx-auto flex justify-around items-center h-16 px-space-xs"><a class="flex flex-col items-center justify-center gap-1 min-w-[48px] min-h-[48px] text-on-surface-variant transition-colors" data-path="rides-hub" href="#"><span class="material-symbols-outlined text-2xl">directions_car</span><span class="font-label-sm text-label-sm">Rides</span></a><a aria-current="page" class="flex flex-col items-center justify-center gap-1 min-w-[48px] min-h-[48px] transition-colors text-primary-container font-headline-sm" data-path="trip-history" href="#"><span class="material-symbols-outlined text-2xl">receipt_long</span><span class="font-label-sm text-label-sm">History</span></a><a class="flex flex-col items-center justify-center gap-1 min-w-[48px] min-h-[48px] text-on-surface-variant transition-colors" data-path="wallet" href="#"><span class="material-symbols-outlined text-2xl">account_balance_wallet</span><span class="font-label-sm text-label-sm">Wallet</span></a><a class="flex flex-col items-center justify-center gap-1 min-w-[48px] min-h-[48px] text-on-surface-variant transition-colors" data-path="account" href="#"><span class="material-symbols-outlined text-2xl">person</span><span class="font-label-sm text-label-sm">Account</span></a></div></nav></body></html>

<!-- ZemenGo - Trip Receipt & Fare Summary -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100%;margin:0;padding:0;min-height:100%;}body{overscroll-behavior-y:none;-webkit-tap-highlight-color:transparent;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "surface-tint": "#104ee5", "on-tertiary": "#ffffff", "primary-container": "#1852e8", "on-surface-variant": "#434655", "background": "#faf8ff", "on-tertiary-fixed": "#002113", "tertiary": "#005539", "on-background": "#131b2e", "on-secondary": "#ffffff", "surface-dim": "#d2d9f4", "error-container": "#ffdad6", "on-primary-fixed-variant": "#0039b4", "secondary-container": "#39b8fd", "surface": "#faf8ff", "primary-fixed-dim": "#b7c4ff", "error": "#ba1a1a", "on-tertiary-fixed-variant": "#005236", "primary-fixed": "#dce1ff", "on-primary-fixed": "#001551", "on-surface": "#131b2e", "on-secondary-container": "#004666", "on-secondary-fixed": "#001e2f", "tertiary-fixed-dim": "#4edea3", "tertiary-fixed": "#6ffbbe", "primary": "#003cbb", "on-error": "#ffffff", "surface-container-high": "#e2e7ff", "surface-container-low": "#f2f3ff", "secondary": "#006591", "inverse-on-surface": "#eef0ff", "outline": "#747687", "outline-variant": "#c3c5d8", "surface-container-highest": "#dae2fd", "inverse-primary": "#b7c4ff", "on-error-container": "#93000a", "surface-bright": "#faf8ff", "on-primary-container": "#d6dcff", "on-tertiary-container": "#6af7b9", "tertiary-container": "#00704c", "secondary-fixed": "#c9e6ff", "surface-variant": "#dae2fd", "on-primary": "#ffffff", "inverse-surface": "#283044", "surface-container": "#eaedff", "surface-container-lowest": "#ffffff", "secondary-fixed-dim": "#89ceff", "on-secondary-fixed-variant": "#004c6e" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-sm": "0.75rem", "space-xl": "1.5rem", "space-lg": "1.25rem", "gutter": "1rem", "space-2xl": "2rem", "space-2xs": "0.25rem", "margin": "1rem", "space-xs": "0.5rem", "space-md": "1rem" }, fontFamily: { "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "body-md-medium": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }], "display-lg-mobile": ["28px", { "lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "800" }], "currency-display": ["22px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "800" }], "body-md-medium": ["14px", { "lineHeight": "20px", "fontWeight": "600" }], "headline-lg": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "headline-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }], "body-lg": ["16px", { "lineHeight": "24px", "fontWeight": "400" }], "body-lg-medium": ["16px", { "lineHeight": "24px", "fontWeight": "500" }], "display-lg": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.03em", "fontWeight": "800" }], "label-md": ["12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" }], "headline-md": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "700" }], "label-sm": ["11px", { "lineHeight": "14px", "letterSpacing": "0.04em", "fontWeight": "700" }] } } } };</script><style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head><body class="bg-surface text-on-surface font-body-md min-h-screen flex flex-col antialiased selection:bg-primary-container selection:text-on-primary"><header class="fixed top-0 inset-x-0 z-50 bg-surface/90 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.03)]"><div class="w-full flex items-center justify-between px-6 pt-3 pb-1"><span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">9:41</span><div class="w-28 h-6 bg-inverse-surface rounded-full flex items-center justify-center"><div class="w-2.5 h-2.5 rounded-full bg-surface-dim/40 mr-2"></div><div class="w-2 h-2 rounded-full bg-primary-container/80"></div></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-base">signal_cellular_alt</span><span class="material-symbols-outlined text-base">wifi</span><span class="material-symbols-outlined text-base">battery_full</span></div></div><div class="h-14 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Go back" class="w-11 h-11 -ml-2 rounded-full flex items-center justify-center text-on-surface hover:bg-surface-container-high transition-colors" onclick="history.back()"><span class="material-symbols-outlined text-2xl">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm font-bold tracking-tight text-on-surface">Trip Receipt Detail</h1></div><div class="flex items-center gap-space-sm"><button aria-label="Help &amp; Support" class="w-11 h-11 rounded-full flex items-center justify-center text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-colors"><span class="material-symbols-outlined text-xl">help_outline</span></button><img alt="Profile" class="w-8 h-8 rounded-full object-cover" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/></div></div></header><main class="flex-1 flex flex-col relative w-full max-w-[480px] mx-auto px-margin pt-24 pb-safe bg-surface"><div class="flex flex-col w-full pb-8">
<div class="flex items-center justify-between py-2 mb-3">
<div class="flex items-center gap-2">
<span class="inline-flex items-center px-2.5 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed font-label-md text-label-md">
        #ZMG-84920
      </span>
<span class="inline-flex items-center gap-1 text-tertiary font-label-sm text-label-sm font-bold bg-tertiary-fixed/30 px-2 py-0.5 rounded-full">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
        Settled
      </span>
</div>
<span class="font-label-md text-label-md text-on-surface-variant font-medium">Standard Eco</span>
</div>
<div class="relative bg-surface-container-lowest rounded-2xl p-space-lg shadow-sm mb-4">
<div class="flex items-start justify-between pb-3 mb-3 bg-surface-container-low/60 -mx- space-lg -mt- space-lg px-space-lg pt-4 rounded-t-2xl">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-xl bg-primary-container text-on-primary flex items-center justify-center shadow-md">
<span class="material-symbols-outlined text-xl">receipt_long</span>
</div>
<div>
<h2 class="font-headline-sm text-headline-sm text-on-surface font-bold">Fare Breakdown</h2>
<p class="font-label-sm text-label-sm text-on-surface-variant">Standard Tariff • Bole Sector</p>
</div>
</div>
<span class="inline-flex items-center gap-1 font-label-sm text-label-sm text-on-surface-variant bg-surface-container px-2 py-1 rounded-lg">
<span class="material-symbols-outlined text-xs">speed</span> 18 min
      </span>
</div>
<div class="space-y-2.5 pt-1">
<div class="flex justify-between items-center text-on-surface-variant">
<span class="font-body-md text-body-md">Base Fare</span>
<span class="font-body-md-medium text-body-md-medium text-on-surface">50.00 ETB</span>
</div>
<div class="flex justify-between items-center text-on-surface-variant">
<div class="flex items-center gap-1.5">
<span class="font-body-md text-body-md">Distance</span>
<span class="font-label-sm text-label-sm text-on-surface-variant/80 bg-surface-container px-1.5 py-0.5 rounded">6.4 km @ 10 ETB/km</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-on-surface">64.00 ETB</span>
</div>
<div class="flex justify-between items-center text-on-surface-variant">
<div class="flex items-center gap-1.5">
<span class="font-body-md text-body-md">Time</span>
<span class="font-label-sm text-label-sm text-on-surface-variant/80 bg-surface-container px-1.5 py-0.5 rounded">18 min @ 1.5 ETB/min</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-on-surface">27.00 ETB</span>
</div>
<div class="flex justify-between items-center text-on-surface-variant">
<div class="flex items-center gap-1">
<span class="font-body-md text-body-md">Platform &amp; Safety Service Fee</span>
<span class="material-symbols-outlined text-xs text-on-surface-variant/60 cursor-pointer" title="Mandatory transport regulatory levy">info</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-on-surface">5.00 ETB</span>
</div>
<div class="pt-2 mt-2 bg-surface-container-high/40 rounded-xl px-3 py-2 flex justify-between items-center text-on-surface">
<span class="font-body-md-medium text-body-md-medium">Subtotal</span>
<span class="font-body-md-medium text-body-md-medium">146.00 ETB</span>
</div>
<div class="flex justify-between items-center px-1">
<div class="flex items-center gap-1.5 text-tertiary">
<span class="material-symbols-outlined text-sm" style="font-variation-settings: 'FILL' 1;">local_offer</span>
<span class="font-body-md-medium text-body-md-medium">Special Promo (ADDIS15)</span>
</div>
<span class="font-body-md-medium text-body-md-medium text-tertiary font-bold">-26.00 ETB</span>
</div>
<div class="h-px bg-surface-variant my-2"></div>
<div class="flex justify-between items-baseline pt-1 px-1">
<div>
<span class="font-headline-md text-headline-md text-on-surface font-extrabold tracking-tight">Total Paid</span>
<span class="block font-label-sm text-label-sm text-tertiary font-medium">Includes 15% VAT</span>
</div>
<div class="text-right">
<span class="font-display-lg-mobile text-display-lg-mobile text-primary font-black tracking-tight">120.00</span>
<span class="font-headline-sm text-headline-sm text-primary font-bold ml-1">ETB</span>
</div>
</div>
</div>
</div>
<div class="bg-surface-container-lowest rounded-2xl p-space-lg shadow-sm mb-4">
<div class="flex items-center justify-between mb-3">
<div class="flex items-center gap-2">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface">Payment Method</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant font-label-sm text-label-sm font-semibold tracking-wide">
        Instant Pay
      </span>
</div>
<div class="bg-surface-container-low rounded-xl p-3 flex items-center justify-between mb-3">
<div class="flex items-center gap-3">
<div class="w-11 h-11 rounded-lg bg-secondary-container/20 flex items-center justify-center p-1.5">
<div class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs">
            tb
          </div>
</div>
<div>
<div class="flex items-center gap-1.5">
<span class="font-body-md-medium text-body-md-medium text-on-surface font-semibold">Telebirr Auto-Pay</span>
<span class="material-symbols-outlined text-tertiary text-base" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant font-mono">**** 5821 • Personal Wallet</span>
</div>
</div>
<span class="font-currency-display text-currency-display text-on-surface">120.00 <span class="font-label-sm text-label-sm text-on-surface-variant">ETB</span></span>
</div>
<div class="space-y-1.5 px-1 font-label-md text-label-md">
<div class="flex justify-between items-center">
<span class="text-on-surface-variant">Transaction ID</span>
<div class="flex items-center gap-1">
<span class="font-mono text-on-surface font-semibold">TXN-ETH-983214819</span>
<button aria-label="Copy Transaction ID" class="w-6 h-6 rounded flex items-center justify-center text-on-surface-variant hover:text-primary active:scale-95 transition-all" id="copy-btn">
<span class="material-symbols-outlined text-sm">content_copy</span>
</button>
</div>
</div>
<div class="flex justify-between items-center">
<span class="text-on-surface-variant">Settled Timestamp</span>
<span class="text-on-surface font-medium">Today, 10:42 AM (EAT)</span>
</div>
<div class="flex justify-between items-center">
<span class="text-on-surface-variant">Regulatory Status</span>
<span class="inline-flex items-center gap-1 text-tertiary font-bold">
<span class="w-2 h-2 rounded-full bg-tertiary animate-pulse"></span>
          Completed • NBE Verified
        </span>
</div>
</div>
</div>
<div class="bg-surface-container-lowest rounded-2xl p-space-lg shadow-sm mb-5">
<div class="flex items-center justify-between mb-4">
<h3 class="font-headline-sm text-headline-sm font-bold text-on-surface">Trip &amp; Driver Details</h3>
<span class="font-label-sm text-label-sm text-on-surface-variant bg-surface-container px-2 py-0.5 rounded-full">Completed Ride</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low mb-4">
<div class="relative">
<img class="w-12 h-12 rounded-full object-cover shadow-sm" data-alt="Close up warm portrait of a friendly professional Ethiopian male driver in his mid-30s wearing a crisp collared shirt smiling inside a tidy car interior Addis Ababa sunlight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAwDUXD8E-_UOP87ZAQZO4c_D5NzzcS-8lHllpX3IIsD91Xkr3uMiK1TJ2hdDCxl7nXYsr-psVgZO1ddTcamJWGFadI7grFJIoZHTmRHB6-0CPBGG5VfvC3gKhsYlO96ASheVdyK-Cu49PAYNmAoAtYg0PntaYv-wCBNoEtFC67jo6tFDK806kAHCWFQym2e422oQ-kYhR5QmtyMZZuGoYiusKwD7coOutT_SInTjgUKJQQ1uhlkHKrjg"/>
<div class="absolute -bottom-1 -right-1 bg-surface-container-lowest rounded-full p-0.5 shadow">
<span class="inline-flex items-center px-1 rounded-full bg-secondary-container text-on-secondary-container font-label-sm text-label-sm font-bold">
<span class="material-symbols-outlined text-[10px] text-amber-500 mr-0.5" style="font-variation-settings: 'FILL' 1;">star</span>4.94
          </span>
</div>
</div>
<div class="flex-1 min-w-0">
<div class="flex items-center justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface font-bold truncate">Dawit Tadesse</span>
<span class="font-label-sm text-label-sm text-on-tertiary-container bg-tertiary-container px-2 py-0.5 rounded-full font-bold">Code 03</span>
</div>
<p class="font-label-sm text-label-sm text-on-surface-variant truncate">Toyota Corolla Quest • White</p>
<span class="inline-block mt-0.5 font-mono font-bold text-label-sm text-on-surface bg-surface-container-high px-1.5 py-0.5 rounded tracking-wide">
          A42981 ET
        </span>
</div>
</div>
<div class="relative pl-6 space-y-4">
<div class="absolute left-2.5 top-2.5 bottom-2.5 w-0.5 bg-surface-variant"></div>
<div class="relative flex flex-col">
<div class="absolute -left-6 top-1 w-3.5 h-3.5 rounded-full bg-tertiary flex items-center justify-center ring-4 ring-surface-container-lowest">
<div class="w-1.5 h-1.5 rounded-full bg-on-tertiary"></div>
</div>
<div class="flex items-baseline justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface font-semibold">Bole Medhanealem</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">10:24 AM</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant">Edna Mall Main Gate, Bole Sub-City</span>
</div>
<div class="relative flex flex-col">
<div class="absolute -left-6 top-1 w-3.5 h-3.5 rounded-full bg-primary flex items-center justify-center ring-4 ring-surface-container-lowest">
<div class="w-1.5 h-1.5 rounded-full bg-on-primary"></div>
</div>
<div class="flex items-baseline justify-between">
<span class="font-body-md-medium text-body-md-medium text-on-surface font-semibold">Kazanchis</span>
<span class="font-label-sm text-label-sm text-on-surface-variant">10:42 AM</span>
</div>
<span class="font-label-sm text-label-sm text-on-surface-variant">UNECA Gate 2, Menelik II Ave</span>
</div>
</div>
</div>
<div class="flex flex-col gap-2.5 pt-1">
<button class="w-full h-[52px] rounded-xl bg-primary text-on-primary font-headline-sm text-headline-sm font-bold flex items-center justify-center gap-2 shadow-lg active:scale-[0.99] transition-transform" id="download-pdf-btn">
<span class="material-symbols-outlined text-xl">download</span>
<span>Download PDF Receipt</span>
</button>
<button class="w-full h-12 rounded-xl bg-surface-container-high text-primary font-body-lg-medium text-body-lg-medium flex items-center justify-center gap-2 active:bg-surface-container-highest transition-colors" id="email-receipt-btn">
<span class="material-symbols-outlined text-lg">mail</span>
<span>Email Receipt to Almaz</span>
</button>
</div>
<div class="mt-4 text-center">
<button class="inline-flex items-center gap-1.5 text-on-surface-variant hover:text-primary transition-colors py-2 px-3 rounded-lg">
<span class="material-symbols-outlined text-base">support_agent</span>
<span class="font-label-md text-label-md font-medium">Need help with this fare? Contact Addis Support</span>
</button>
</div>
<div class="fixed bottom-6 left-1/2 -translate-x-1/2 bg-inverse-surface text-inverse-on-surface px-4 py-2 rounded-full font-label-md text-label-md opacity-0 pointer-events-none transition-all duration-300 shadow-xl flex items-center gap-1.5 z-50" id="toast">
<span class="material-symbols-outlined text-sm text-tertiary-fixed-dim" style="font-variation-settings: 'FILL' 1;">check_circle</span>
<span id="toast-text">Copied to clipboard</span>
</div>
</div>
<script>
  (function () {
    const toast = document.getElementById('toast');
    const toastText = document.getElementById('toast-text');
    let toastTimeout;

    function showToast(message) {
      if (!toast) return;
      toastText.textContent = message;
      toast.classList.remove('opacity-0', 'pointer-events-none');
      toast.classList.add('opacity-100');
      clearTimeout(toastTimeout);
      toastTimeout = setTimeout(() => {
        toast.classList.remove('opacity-100');
        toast.classList.add('opacity-0', 'pointer-events-none');
      }, 2400);
    }

    const copyBtn = document.getElementById('copy-btn');
    if (copyBtn) {
      copyBtn.addEventListener('click', () => {
        navigator.clipboard?.writeText('TXN-ETH-983214819').then(() => {
          showToast('Transaction ID copied!');
        }).catch(() => {
          showToast('Transaction ID: TXN-ETH-983214819');
        });
      });
    }

    const downloadBtn = document.getElementById('download-pdf-btn');
    if (downloadBtn) {
      downloadBtn.addEventListener('click', () => {
        downloadBtn.innerHTML = `
          <span class="inline-block animate-spin mr-1">
            <span class="material-symbols-outlined text-xl">progress_activity</span>
          </span>
          <span>Generating Receipt...</span>
        `;
        setTimeout(() => {
          downloadBtn.innerHTML = `
            <span class="material-symbols-outlined text-xl">file_download_done</span>
            <span>Downloaded to Files</span>
          `;
          showToast('Receipt #ZMG-84920 downloaded');
          setTimeout(() => {
            downloadBtn.innerHTML = `
              <span class="material-symbols-outlined text-xl">download</span>
              <span>Download PDF Receipt</span>
            `;
          }, 3000);
        }, 1200);
      });
    }

    const emailBtn = document.getElementById('email-receipt-btn');
    if (emailBtn) {
      emailBtn.addEventListener('click', () => {
        showToast('Receipt sent to almaz.t@domain.et');
      });
    }

})();
</script></main></body></html>

<!-- ZemenGo - Rate Driver & Tip -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100%;margin:0;padding:0;min-height:100%;}body{overscroll-behavior-y:none;-webkit-tap-highlight-color:transparent;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "surface-tint": "#104ee5", "on-tertiary": "#ffffff", "primary-container": "#1852e8", "on-surface-variant": "#434655", "background": "#faf8ff", "on-tertiary-fixed": "#002113", "tertiary": "#005539", "on-background": "#131b2e", "on-secondary": "#ffffff", "surface-dim": "#d2d9f4", "error-container": "#ffdad6", "on-primary-fixed-variant": "#0039b4", "secondary-container": "#39b8fd", "surface": "#faf8ff", "primary-fixed-dim": "#b7c4ff", "error": "#ba1a1a", "on-tertiary-fixed-variant": "#005236", "primary-fixed": "#dce1ff", "on-primary-fixed": "#001551", "on-surface": "#131b2e", "on-secondary-container": "#004666", "on-secondary-fixed": "#001e2f", "tertiary-fixed-dim": "#4edea3", "tertiary-fixed": "#6ffbbe", "primary": "#003cbb", "on-error": "#ffffff", "surface-container-high": "#e2e7ff", "surface-container-low": "#f2f3ff", "secondary": "#006591", "inverse-on-surface": "#eef0ff", "outline": "#747687", "outline-variant": "#c3c5d8", "surface-container-highest": "#dae2fd", "inverse-primary": "#b7c4ff", "on-error-container": "#93000a", "surface-bright": "#faf8ff", "on-primary-container": "#d6dcff", "on-tertiary-container": "#6af7b9", "tertiary-container": "#00704c", "secondary-fixed": "#c9e6ff", "surface-variant": "#dae2fd", "on-primary": "#ffffff", "inverse-surface": "#283044", "surface-container": "#eaedff", "surface-container-lowest": "#ffffff", "secondary-fixed-dim": "#89ceff", "on-secondary-fixed-variant": "#004c6e" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-sm": "0.75rem", "space-xl": "1.5rem", "space-lg": "1.25rem", "gutter": "1rem", "space-2xl": "2rem", "space-2xs": "0.25rem", "margin": "1rem", "space-xs": "0.5rem", "space-md": "1rem" }, fontFamily: { "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "body-md-medium": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }], "display-lg-mobile": ["28px", { "lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "800" }], "currency-display": ["22px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "800" }], "body-md-medium": ["14px", { "lineHeight": "20px", "fontWeight": "600" }], "headline-lg": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "headline-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }], "body-lg": ["16px", { "lineHeight": "24px", "fontWeight": "400" }], "body-lg-medium": ["16px", { "lineHeight": "24px", "fontWeight": "500" }], "display-lg": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.03em", "fontWeight": "800" }], "label-md": ["12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" }], "headline-md": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "700" }], "label-sm": ["11px", { "lineHeight": "14px", "letterSpacing": "0.04em", "fontWeight": "700" }] } } } };</script></head><body class="bg-surface text-on-surface font-body-md min-h-screen flex flex-col antialiased selection:bg-primary-container selection:text-on-primary"><header class="fixed top-0 inset-x-0 z-50 bg-surface/90 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.03)]"><div class="w-full flex items-center justify-between px-6 pt-3 pb-1"><span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">9:41</span><div class="w-28 h-6 bg-inverse-surface rounded-full flex items-center justify-center"><div class="w-2.5 h-2.5 rounded-full bg-surface-dim/40 mr-2"></div><div class="w-2 h-2 rounded-full bg-primary-container/80"></div></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-base">signal_cellular_alt</span><span class="material-symbols-outlined text-base">wifi</span><span class="material-symbols-outlined text-base">battery_full</span></div></div><div class="h-14 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Go back" class="w-11 h-11 -ml-2 rounded-full flex items-center justify-center text-on-surface hover:bg-surface-container-high transition-colors" onclick="history.back()"><span class="material-symbols-outlined text-2xl">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm font-bold tracking-tight text-on-surface">Rate Driver</h1></div><div class="flex items-center gap-space-sm"><button aria-label="Help &amp; Support" class="w-11 h-11 rounded-full flex items-center justify-center text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-colors"><span class="material-symbols-outlined text-xl">help_outline</span></button><img alt="Profile" class="w-8 h-8 rounded-full object-cover" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/></div></div></header><main class="flex-1 flex flex-col relative w-full max-w-[480px] mx-auto px-margin pt-24 pb-safe bg-surface"><div class="flex flex-col w-full pb-8">
<!-- Driver Profile & Trip Identification Card -->
<div class="relative bg-surface-container-lowest rounded-xl p-space-lg shadow-sm flex flex-col items-center text-center mt-2 mb-space-md">
<div class="relative">
<div class="w-20 h-20 rounded-full p-1 bg-gradient-to-tr from-primary via-secondary-container to-tertiary-fixed shadow-md flex items-center justify-center">
<img alt="Driver Dawit Tadesse" class="w-full h-full rounded-full object-cover shadow-inner" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/>
</div>
<div class="absolute -bottom-1 -right-1 bg-tertiary text-on-tertiary rounded-full px-2 py-0.5 flex items-center gap-0.5 shadow-sm">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-sm text-label-sm">4.96</span>
</div>
</div>
<h2 class="font-headline-sm text-headline-sm text-on-surface mt-3">How was your ride with Dawit?</h2>
<div class="flex items-center justify-center gap-1.5 mt-1 text-on-surface-variant">
<span class="material-symbols-outlined text-[16px] text-primary">directions_car</span>
<p class="font-body-md text-body-md text-on-surface-variant">Toyota Corolla Quest</p>
<span class="inline-block w-1 h-1 rounded-full bg-outline-variant"></span>
<span class="bg-surface-container-high px-2 py-0.5 rounded text-on-surface font-label-md text-label-md tracking-wider">03 - A42981 ET</span>
</div>
<!-- Rating Section with Micro-interaction -->
<div class="w-full mt-5 pt-3">
<div class="flex justify-center items-center gap-2" id="starContainer">
<button class="star-btn transition-transform active:scale-125 focus:outline-none p-1" data-star="1" type="button">
<span class="material-symbols-outlined text-[36px] text-[#F59E0B]" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button class="star-btn transition-transform active:scale-125 focus:outline-none p-1" data-star="2" type="button">
<span class="material-symbols-outlined text-[36px] text-[#F59E0B]" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button class="star-btn transition-transform active:scale-125 focus:outline-none p-1" data-star="3" type="button">
<span class="material-symbols-outlined text-[36px] text-[#F59E0B]" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button class="star-btn transition-transform active:scale-125 focus:outline-none p-1" data-star="4" type="button">
<span class="material-symbols-outlined text-[36px] text-[#F59E0B]" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button class="star-btn transition-transform active:scale-125 focus:outline-none p-1" data-star="5" type="button">
<span class="material-symbols-outlined text-[36px] text-[#F59E0B]" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
</div>
<p class="font-headline-sm text-headline-sm font-bold text-primary mt-2 transition-all" id="ratingCaption">Excellent Service!</p>
</div>
</div>
<!-- Compliments & Badges Section -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm mb-space-md">
<div class="flex items-center justify-between mb-3">
<span class="font-label-md text-label-md uppercase tracking-wider text-on-surface-variant font-bold">What went well?</span>
<span class="font-label-sm text-label-sm text-secondary font-medium">Select compliments</span>
</div>
<div class="flex flex-wrap gap-2" id="complimentsContainer">
<button class="compliment-chip flex items-center gap-1.5 px-3 py-2 rounded-full bg-surface-container text-on-surface font-body-md text-body-md transition-all" type="button">
<span class="material-symbols-outlined text-base text-secondary">forum</span>
<span>Great Conversation</span>
</button>
<button class="compliment-chip flex items-center gap-1.5 px-3 py-2 rounded-full bg-primary-container text-on-primary font-body-md text-body-md shadow-sm transition-all" type="button">
<span class="material-symbols-outlined text-base">clean_hands</span>
<span>Clean Car</span>
</button>
<button class="compliment-chip flex items-center gap-1.5 px-3 py-2 rounded-full bg-primary-container text-on-primary font-body-md text-body-md shadow-sm transition-all" type="button">
<span class="material-symbols-outlined text-base">airline_seat_recline_extra</span>
<span>Smooth Driving</span>
</button>
<button class="compliment-chip flex items-center gap-1.5 px-3 py-2 rounded-full bg-surface-container text-on-surface font-body-md text-body-md transition-all" type="button">
<span class="material-symbols-outlined text-base text-secondary">verified_user</span>
<span>Safe Driver</span>
</button>
<button class="compliment-chip flex items-center gap-1.5 px-3 py-2 rounded-full bg-surface-container text-on-surface font-body-md text-body-md transition-all" type="button">
<span class="material-symbols-outlined text-base text-secondary">schedule</span>
<span>Punctual Pickup</span>
</button>
<button class="compliment-chip flex items-center gap-1.5 px-3 py-2 rounded-full bg-surface-container text-on-surface font-body-md text-body-md transition-all" type="button">
<span class="material-symbols-outlined text-base text-secondary">volunteer_activism</span>
<span>Polite &amp; Helpful</span>
</button>
</div>
</div>
<!-- Addis Ababa Driver Tip Section (ETB) -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm mb-space-md">
<div class="flex items-start justify-between">
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">Add a tip for Dawit</h3>
<p class="font-label-md text-label-md text-on-surface-variant mt-0.5">100% of your tip goes directly to the driver's Telebirr wallet</p>
</div>
<div class="w-8 h-8 rounded-full bg-secondary-container/20 flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-lg">payments</span>
</div>
</div>
<!-- Tip Selector Pills -->
<div class="grid grid-cols-5 gap-1.5 mt-4" id="tipSelector">
<button class="tip-btn flex flex-col items-center justify-center py-2.5 rounded-xl bg-surface-container text-on-surface transition-all" data-tip="0" type="button">
<span class="font-label-md text-label-md font-semibold">No Tip</span>
</button>
<button class="tip-btn flex flex-col items-center justify-center py-2.5 rounded-xl bg-surface-container text-on-surface transition-all" data-tip="20" type="button">
<span class="font-body-md font-bold text-body-md">20</span>
<span class="font-label-sm text-label-sm opacity-70">ETB</span>
</button>
<button class="tip-btn selected flex flex-col items-center justify-center py-2.5 rounded-xl bg-primary-container text-on-primary shadow-sm transition-all" data-tip="50" type="button">
<span class="font-body-md font-bold text-body-md">50</span>
<span class="font-label-sm text-label-sm opacity-90">ETB</span>
</button>
<button class="tip-btn flex flex-col items-center justify-center py-2.5 rounded-xl bg-surface-container text-on-surface transition-all" data-tip="100" type="button">
<span class="font-body-md font-bold text-body-md">100</span>
<span class="font-label-sm text-label-sm opacity-70">ETB</span>
</button>
<button class="tip-btn flex flex-col items-center justify-center py-2.5 rounded-xl bg-surface-container text-on-surface transition-all" data-tip="custom" type="button">
<span class="material-symbols-outlined text-base">edit</span>
<span class="font-label-sm text-label-sm font-semibold">Custom</span>
</button>
</div>
<div class="mt-3.5 flex items-center gap-2 bg-surface-container-low px-3 py-2 rounded-lg">
<div class="w-2 h-2 rounded-full bg-tertiary"></div>
<p class="font-label-sm text-label-sm text-on-surface-variant">Instant disbursement supported via <span class="font-semibold text-secondary">Telebirr &amp; CBE Birr</span></p>
</div>
</div>
<!-- Feedback Text Box -->
<div class="bg-surface-container-lowest rounded-xl p-space-md shadow-sm mb- space-lg">
<label class="block font-label-md text-label-md uppercase tracking-wider text-on-surface-variant font-bold mb-2" for="feedbackInput">Driver Note (Optional)</label>
<div class="relative bg-surface-container-low rounded-lg p-2.5">
<textarea class="w-full bg-transparent border-0 focus:outline-none text-on-surface font-body-md text-body-md placeholder-on-surface-variant/50 resize-none" id="feedbackInput" placeholder="Write a note of appreciation or feedback (optional)..." rows="2"></textarea>
<div class="flex justify-end mt-1">
<span class="material-symbols-outlined text-sm text-outline">mode_comment</span>
</div>
</div>
</div>
<!-- Fixed/Sticky Bottom Floating Action Tray -->
<div class="mt-4 flex flex-col items-center gap-2.5">
<button class="w-full h-[52px] bg-primary-container hover:bg-primary active:scale-[0.99] text-on-primary rounded-xl font-body-lg font-bold flex items-center justify-center gap-2 shadow-lg transition-all" id="submitButton" type="button">
<span id="submitLabel">Submit Rating &amp; Tip (50 ETB)</span>
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</button>
<button class="py-2 px-4 text-on-surface-variant hover:text-on-surface font-body-md-medium text-body-md-medium transition-colors" onclick="history.back()" type="button">
      Skip for now
    </button>
</div>
</div>
<script>
  (function() {
    let currentRating = 5;
    let selectedTip = 50;

    const ratingCaptions = {
      1: "Needs Improvement",
      2: "Fair Trip",
      3: "Good Ride",
      4: "Very Good Experience!",
      5: "Excellent Service!"
    };

    const starButtons = document.querySelectorAll('.star-btn');
    const ratingCaption = document.getElementById('ratingCaption');
    const tipButtons = document.querySelectorAll('.tip-btn');
    const submitLabel = document.getElementById('submitLabel');
    const complimentChips = document.querySelectorAll('.compliment-chip');

    function updateStars(val) {
      currentRating = val;
      starButtons.forEach(btn => {
        const starIndex = parseInt(btn.getAttribute('data-star'), 10);
        const icon = btn.querySelector('.material-symbols-outlined');
        if (starIndex <= val) {
          icon.style.fontVariationSettings = "'FILL' 1";
          icon.classList.remove('text-outline-variant');
          icon.classList.add('text-[#F59E0B]');
        } else {
          icon.style.fontVariationSettings = "'FILL' 0";
          icon.classList.remove('text-[#F59E0B]');
          icon.classList.add('text-outline-variant');
        }
      });
      if (ratingCaption) {
        ratingCaption.textContent = ratingCaptions[val] || "Thank you!";
      }
    }

    starButtons.forEach(btn => {
      btn.addEventListener('click', () => {
        const val = parseInt(btn.getAttribute('data-star'), 10);
        updateStars(val);
      });
    });

    function updateSubmitText() {
      if (!submitLabel) return;
      if (selectedTip > 0) {
        submitLabel.textContent = `Submit Rating & Tip (${selectedTip} ETB)`;
      } else {
        submitLabel.textContent = `Submit Trip Rating`;
      }
    }

    tipButtons.forEach(btn => {
      btn.addEventListener('click', () => {
        tipButtons.forEach(b => {
          b.classList.remove('bg-primary-container', 'text-on-primary', 'shadow-sm', 'selected');
          b.classList.add('bg-surface-container', 'text-on-surface');
        });

        btn.classList.remove('bg-surface-container', 'text-on-surface');
        btn.classList.add('bg-primary-container', 'text-on-primary', 'shadow-sm', 'selected');

        const tipVal = btn.getAttribute('data-tip');
        if (tipVal === 'custom') {
          const userVal = prompt('Enter tip in ETB:', '75');
          const parsed = parseInt(userVal, 10);
          selectedTip = (!isNaN(parsed) && parsed > 0) ? parsed : 50;
        } else {
          selectedTip = parseInt(tipVal, 10);
        }
        updateSubmitText();
      });
    });

    complimentChips.forEach(chip => {
      chip.addEventListener('click', () => {
        const isSelected = chip.classList.contains('bg-primary-container');
        if (isSelected) {
          chip.classList.remove('bg-primary-container', 'text-on-primary', 'shadow-sm');
          chip.classList.add('bg-surface-container', 'text-on-surface');
        } else {
          chip.classList.remove('bg-surface-container', 'text-on-surface');
          chip.classList.add('bg-primary-container', 'text-on-primary', 'shadow-sm');
        }
      });
    });

    const submitBtn = document.getElementById('submitButton');
    if (submitBtn) {
      submitBtn.addEventListener('click', () => {
        submitBtn.innerHTML = `
          <span class="material-symbols-outlined animate-spin text-xl">progress_activity</span>
          <span>Submitted! Ameseginalehu</span>
        `;
        submitBtn.classList.replace('bg-primary-container', 'bg-tertiary-container');
        setTimeout(() => {
          if (window.history.length > 1) {
            history.back();
          }
        }, 1200);
      });
    }

})();
</script></main></body></html>

<!-- ZemenGo - Trip Completed -->
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" name="viewport"/><meta content="mobile_stack" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{width:100%;margin:0;padding:0;min-height:100%;}body{overscroll-behavior-y:none;-webkit-tap-highlight-color:transparent;}.pb-safe{padding-bottom:env(safe-area-inset-bottom,0px);}.pt-safe{padding-top:env(safe-area-inset-top,0px);}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "surface-tint": "#104ee5", "on-tertiary": "#ffffff", "primary-container": "#1852e8", "on-surface-variant": "#434655", "background": "#faf8ff", "on-tertiary-fixed": "#002113", "tertiary": "#005539", "on-background": "#131b2e", "on-secondary": "#ffffff", "surface-dim": "#d2d9f4", "error-container": "#ffdad6", "on-primary-fixed-variant": "#0039b4", "secondary-container": "#39b8fd", "surface": "#faf8ff", "primary-fixed-dim": "#b7c4ff", "error": "#ba1a1a", "on-tertiary-fixed-variant": "#005236", "primary-fixed": "#dce1ff", "on-primary-fixed": "#001551", "on-surface": "#131b2e", "on-secondary-container": "#004666", "on-secondary-fixed": "#001e2f", "tertiary-fixed-dim": "#4edea3", "tertiary-fixed": "#6ffbbe", "primary": "#003cbb", "on-error": "#ffffff", "surface-container-high": "#e2e7ff", "surface-container-low": "#f2f3ff", "secondary": "#006591", "inverse-on-surface": "#eef0ff", "outline": "#747687", "outline-variant": "#c3c5d8", "surface-container-highest": "#dae2fd", "inverse-primary": "#b7c4ff", "on-error-container": "#93000a", "surface-bright": "#faf8ff", "on-primary-container": "#d6dcff", "on-tertiary-container": "#6af7b9", "tertiary-container": "#00704c", "secondary-fixed": "#c9e6ff", "surface-variant": "#dae2fd", "on-primary": "#ffffff", "inverse-surface": "#283044", "surface-container": "#eaedff", "surface-container-lowest": "#ffffff", "secondary-fixed-dim": "#89ceff", "on-secondary-fixed-variant": "#004c6e" }, borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, spacing: { "space-sm": "0.75rem", "space-xl": "1.5rem", "space-lg": "1.25rem", "gutter": "1rem", "space-2xl": "2rem", "space-2xs": "0.25rem", "margin": "1rem", "space-xs": "0.5rem", "space-md": "1rem" }, fontFamily: { "body-md": ["Plus Jakarta Sans"], "display-lg-mobile": ["Plus Jakarta Sans"], "currency-display": ["Plus Jakarta Sans"], "body-md-medium": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"], "body-lg": ["Plus Jakarta Sans"], "body-lg-medium": ["Plus Jakarta Sans"], "display-lg": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "headline-md": ["Plus Jakarta Sans"], "label-sm": ["Plus Jakarta Sans"] }, fontSize: { "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }], "display-lg-mobile": ["28px", { "lineHeight": "34px", "letterSpacing": "-0.02em", "fontWeight": "800" }], "currency-display": ["22px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "800" }], "body-md-medium": ["14px", { "lineHeight": "20px", "fontWeight": "600" }], "headline-lg": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "headline-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }], "body-lg": ["16px", { "lineHeight": "24px", "fontWeight": "400" }], "body-lg-medium": ["16px", { "lineHeight": "24px", "fontWeight": "500" }], "display-lg": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.03em", "fontWeight": "800" }], "label-md": ["12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" }], "headline-md": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "700" }], "label-sm": ["11px", { "lineHeight": "14px", "letterSpacing": "0.04em", "fontWeight": "700" }] } } } };</script></head><body class="bg-surface text-on-surface font-body-md min-h-screen flex flex-col antialiased selection:bg-primary-container selection:text-on-primary"><header class="fixed top-0 inset-x-0 z-50 bg-surface/90 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.03)]"><div class="w-full flex items-center justify-between px-6 pt-3 pb-1"><span class="font-headline-sm text-headline-sm font-bold text-on-surface tracking-tight">9:41</span><div class="w-28 h-6 bg-inverse-surface rounded-full flex items-center justify-center"><div class="w-2.5 h-2.5 rounded-full bg-surface-dim/40 mr-2"></div><div class="w-2 h-2 rounded-full bg-primary-container/80"></div></div><div class="flex items-center gap-1.5 text-on-surface"><span class="material-symbols-outlined text-base">signal_cellular_alt</span><span class="material-symbols-outlined text-base">wifi</span><span class="material-symbols-outlined text-base">battery_full</span></div></div><div class="h-14 px-margin flex items-center justify-between"><div class="flex items-center gap-space-xs"><button aria-label="Go back" class="w-11 h-11 -ml-2 rounded-full flex items-center justify-center text-on-surface hover:bg-surface-container-high transition-colors" onclick="history.back()"><span class="material-symbols-outlined text-2xl">arrow_back</span></button><h1 class="font-headline-sm text-headline-sm font-bold tracking-tight text-on-surface">Post Trip Summary</h1></div><div class="flex items-center gap-space-sm"><button aria-label="Help &amp; Support" class="w-11 h-11 rounded-full flex items-center justify-center text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-colors"><span class="material-symbols-outlined text-xl">help_outline</span></button><img alt="Profile" class="w-8 h-8 rounded-full object-cover" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/></div></div></header><main class="flex-1 flex flex-col relative w-full max-w-[480px] mx-auto px-margin pt-24 pb-safe bg-surface"><div class="flex flex-col w-full pb-8 space-y-4">
<!-- Interactive Mini-Map Arrival Banner -->
<div class="relative w-full h-44 rounded-2xl overflow-hidden shadow-md">
<div class="w-full h-full bg-cover bg-center" data-location="Kazanchis, UNECA Conference Centre, Addis Ababa, Ethiopia" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCAykOhWYzIy1R4pW7PYhFiTrnEx0xC8U1mQ1um_VixbL-TwtXdEddnfb7Dnh8dlKv52ANILt_62s59XWrnPdMIlj5o3Q9YENfLuEaNx2f6FD1Z06s54EoPwNn2-ZfhmkrqkzqrX5U9SsZ4L5ItfhGvgso3MCiVBs68XPSXTl-ePCtxkJFM5pJRyTambbtdeXKmB8mJyqJ6ekulVbOHwINeTZzSO32wdfIN_zkI6Shg06iDBS1mGYpzYA')"></div>
<div class="absolute inset-0 bg-gradient-to-t from-on-background/70 via-on-background/20 to-transparent"></div>
<!-- Route Completed Overlay Tag -->
<div class="absolute top-3 left-3 bg-surface/95 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1.5 shadow-sm">
<span class="w-2.5 h-2.5 rounded-full bg-tertiary-container animate-pulse"></span>
<span class="font-label-md text-label-md text-on-surface font-semibold">Route Completed</span>
</div>
<!-- Destination Pin Indicator Card -->
<div class="absolute bottom-3 inset-x-3 bg-surface-container-lowest/95 backdrop-blur-md p-2.5 rounded-xl flex items-center justify-between shadow-sm">
<div class="flex items-center gap-2.5 min-w-0">
<div class="w-8 h-8 rounded-full bg-tertiary-container text-on-tertiary flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-lg" style="font-variation-settings: 'FILL' 1;">sports_score</span>
</div>
<div class="min-w-0">
<p class="font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider">Arrival Point</p>
<p class="font-body-md-medium text-body-md-medium text-on-surface truncate">Kazanchis, UNECA Conference Ctr</p>
</div>
</div>
<span class="font-label-md text-label-md bg-surface-container-high text-primary px-2.5 py-1 rounded-full font-bold shrink-0">Gate 2</span>
</div>
</div>
<!-- Celebration & Trip Overview Hero Card -->
<div class="relative bg-surface-container-lowest rounded-2xl p-5 shadow-sm overflow-hidden flex flex-col items-center text-center">
<!-- Soft Decorative Glow -->
<div class="absolute -top-12 -right-12 w-32 h-32 rounded-full bg-secondary-fixed/40 blur-2xl pointer-events-none"></div>
<div class="absolute -bottom-10 -left-10 w-28 h-28 rounded-full bg-tertiary-fixed/30 blur-2xl pointer-events-none"></div>
<!-- Animated Badge -->
<div class="relative w-16 h-16 rounded-full bg-surface-container-low flex items-center justify-center mb-3">
<div class="absolute inset-0 rounded-full bg-tertiary/10 animate-ping opacity-75"></div>
<div class="w-12 h-12 rounded-full bg-tertiary text-on-tertiary flex items-center justify-center shadow-md">
<span class="material-symbols-outlined text-2xl font-bold">check</span>
</div>
</div>
<span class="font-label-sm text-label-sm uppercase tracking-wider text-tertiary font-bold mb-0.5">Safely Dropped Off</span>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-extrabold mb-1">You've Arrived!</h2>
<p class="font-body-md text-body-md text-on-surface-variant max-w-[280px]">Menelik II Avenue, UNECA Compound Main Gate, Kazanchis</p>
<!-- Trip Metrics Strip -->
<div class="w-full mt-4 pt-3.5 bg-surface-container-low/70 rounded-xl px-4 py-2.5 flex items-center justify-around">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-primary text-xl">schedule</span>
<div class="text-left">
<p class="font-label-sm text-label-sm text-on-surface-variant">Duration</p>
<p class="font-body-md-medium text-body-md-medium text-on-surface font-bold">18 mins</p>
</div>
</div>
<div class="w-px h-6 bg-outline-variant/40"></div>
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-primary text-xl">straighten</span>
<div class="text-left">
<p class="font-label-sm text-label-sm text-on-surface-variant">Distance</p>
<p class="font-body-md-medium text-body-md-medium text-on-surface font-bold">6.4 km</p>
</div>
</div>
<div class="w-px h-6 bg-outline-variant/40"></div>
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-tertiary text-xl">eco</span>
<div class="text-left">
<p class="font-label-sm text-label-sm text-on-surface-variant">CO₂ Saved</p>
<p class="font-body-md-medium text-body-md-medium text-on-surface font-bold">0.8 kg</p>
</div>
</div>
</div>
</div>
<!-- Driver & Vehicle Profile Card -->
<div class="bg-surface-container-lowest rounded-2xl p-4 shadow-sm space-y-3">
<div class="flex items-center justify-between">
<div class="flex items-center gap-3 min-w-0">
<div class="relative">
<img alt="Dawit Tadesse" class="w-13 h-13 rounded-full object-cover shadow-sm w-12 h-12" src="https://lh3.googleusercontent.com/aida/AEtjO1Xl2hwnqYNnsZNlDuwbQFgUtzfpUqGctiHlWYKoTEOvEWUXTjQ9UuJso3BM8oSTLf7PJvHP7wP25s0sr7wa22P9fot1OfHU8kypwZXBmYVWWCXsQr76qTMk9p6GeI0WWuA23DU-FvN63uP8N1kg-Gu_4YLnnEydzgp2GjubRKMsvFYJTvHGQKWJX4EjmyxvdA2VyXaz9ad74_zPzSB-AAF-ew7rQ5u8Jz9gwp3yuxrzTI4PxT7cJSZFg_WP"/>
<div class="absolute -bottom-1 -right-1 bg-surface rounded-full px-1 py-0.2 flex items-center shadow-xs">
<span class="material-symbols-outlined text-[13px] text-amber-500" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="font-label-sm text-label-sm font-bold text-on-surface ml-0.5">4.9</span>
</div>
</div>
<div class="min-w-0">
<div class="flex items-center gap-1.5">
<h3 class="font-headline-sm text-headline-sm text-on-surface font-bold truncate">Dawit Tadesse</h3>
<span class="material-symbols-outlined text-primary text-base" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant truncate">ZemenGo Comfort • 2,410 trips</p>
</div>
</div>
<a aria-label="Call Driver" class="w-10 h-10 rounded-full bg-surface-container-high text-primary flex items-center justify-center shrink-0 hover:bg-primary hover:text-on-primary transition-colors" href="tel:+251911000000">
<span class="material-symbols-outlined text-xl">phone</span>
</a>
</div>
<!-- Vehicle Details Badge -->
<div class="bg-surface-container-low rounded-xl p-2.5 flex items-center justify-between">
<div class="flex items-center gap-2.5 min-w-0">
<div class="w-8 h-8 rounded-lg bg-surface flex items-center justify-center text-on-surface-variant shrink-0 shadow-xs">
<span class="material-symbols-outlined text-lg">directions_car</span>
</div>
<div class="min-w-0">
<p class="font-body-md-medium text-body-md-medium text-on-surface font-semibold truncate">White Toyota Corolla Quest</p>
<p class="font-label-sm text-label-sm text-on-surface-variant">Air Conditioned • Clean Interior</p>
</div>
</div>
<div class="bg-surface px-2.5 py-1 rounded-md shadow-xs shrink-0">
<span class="font-label-md text-label-md tracking-wider font-extrabold text-on-surface uppercase">03 - A42981 ET</span>
</div>
</div>
</div>
<!-- Fare & Payment Breakdown Card -->
<div class="bg-surface-container-lowest rounded-2xl p-4 shadow-sm space-y-3.5">
<div class="flex items-center justify-between">
<div>
<p class="font-label-sm text-label-sm text-on-surface-variant uppercase font-semibold">Total Charged</p>
<div class="flex items-baseline gap-1">
<span class="font-currency-display text-currency-display text-on-surface font-black">120.00</span>
<span class="font-label-md text-label-md font-bold text-on-surface-variant">ETB</span>
</div>
</div>
<div class="flex items-center gap-1.5 bg-tertiary-container/15 text-tertiary px-3 py-1.5 rounded-full">
<span class="material-symbols-outlined text-base">check_circle</span>
<span class="font-label-md text-label-md font-bold">Paid Automatically</span>
</div>
</div>
<!-- Telebirr Auto-Deduct Pill -->
<div class="bg-secondary-fixed/30 rounded-xl p-3 flex items-center justify-between">
<div class="flex items-center gap-2.5 min-w-0">
<div class="w-8 h-8 rounded-lg bg-secondary-container text-on-secondary-container flex items-center justify-center font-black text-xs shrink-0">
          tb
        </div>
<div class="min-w-0">
<p class="font-body-md-medium text-body-md-medium text-on-surface font-bold truncate">Telebirr Wallet</p>
<p class="font-label-sm text-label-sm text-on-surface-variant truncate">+251 91***4567 • TxID #ZB99428</p>
</div>
</div>
<span class="material-symbols-outlined text-secondary text-lg">verified_user</span>
</div>
<!-- Applied Promo Strip -->
<div class="bg-surface-container-low rounded-xl px-3 py-2 flex items-center justify-between">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-tertiary text-lg">local_offer</span>
<span class="font-body-md text-body-md text-on-surface">Promo code <span class="font-bold text-tertiary">ADDIS15</span></span>
</div>
<span class="font-body-md-medium text-body-md-medium font-bold text-tertiary">-21.00 ETB</span>
</div>
</div>
<!-- Interactive Star Rating & Delight Prompt -->
<div class="bg-surface-container-lowest rounded-2xl p-4 shadow-sm text-center space-y-3">
<p class="font-headline-sm text-headline-sm text-on-surface font-bold">How was your ride with Dawit?</p>
<div class="flex items-center justify-center gap-2 py-1" id="star-rating-group">
<button aria-label="1 Star" class="rating-star w-11 h-11 rounded-full bg-surface-container-low hover:bg-surface-container-high transition-transform active:scale-90 flex items-center justify-center text-amber-500" data-value="1" type="button">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button aria-label="2 Stars" class="rating-star w-11 h-11 rounded-full bg-surface-container-low hover:bg-surface-container-high transition-transform active:scale-90 flex items-center justify-center text-amber-500" data-value="2" type="button">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button aria-label="3 Stars" class="rating-star w-11 h-11 rounded-full bg-surface-container-low hover:bg-surface-container-high transition-transform active:scale-90 flex items-center justify-center text-amber-500" data-value="3" type="button">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button aria-label="4 Stars" class="rating-star w-11 h-11 rounded-full bg-surface-container-low hover:bg-surface-container-high transition-transform active:scale-90 flex items-center justify-center text-amber-500" data-value="4" type="button">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
<button aria-label="5 Stars" class="rating-star w-11 h-11 rounded-full bg-amber-100 hover:bg-amber-200 transition-transform active:scale-90 flex items-center justify-center text-amber-500" data-value="5" type="button">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">star</span>
</button>
</div>
<!-- Quick Tip Pills -->
<div class="flex items-center justify-center gap-2 pt-1">
<button class="tip-btn px-3 py-1.5 rounded-full bg-surface-container-low font-label-md text-label-md text-on-surface font-semibold hover:bg-primary hover:text-on-primary transition-colors" type="button">+10 ETB</button>
<button class="tip-btn px-3 py-1.5 rounded-full bg-surface-container-low font-label-md text-label-md text-on-surface font-semibold hover:bg-primary hover:text-on-primary transition-colors" type="button">+20 ETB</button>
<button class="tip-btn px-3 py-1.5 rounded-full bg-surface-container-low font-label-md text-label-md text-on-surface font-semibold hover:bg-primary hover:text-on-primary transition-colors" type="button">+50 ETB</button>
<button class="tip-btn px-3 py-1.5 rounded-full bg-surface-container-low font-label-md text-label-md text-on-surface font-semibold hover:bg-primary hover:text-on-primary transition-colors" type="button">Custom</button>
</div>
</div>
<!-- Action CTAs -->
<div class="space-y-2.5 pt-1">
<!-- Primary CTA -->
<button class="w-full h-13 py-3.5 px-4 rounded-xl bg-primary-container text-on-primary font-headline-sm text-headline-sm font-bold shadow-md hover:bg-primary transition-all flex items-center justify-center gap-2 active:scale-[0.99]" type="button">
<span>Submit Rating &amp; Tip</span>
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</button>
<!-- Secondary Receipt Button -->
<button class="w-full h-12 py-3 px-4 rounded-xl bg-surface-container-high text-primary font-body-lg-medium text-body-lg-medium font-semibold hover:bg-surface-container-highest transition-colors flex items-center justify-center gap-2" type="button">
<span class="material-symbols-outlined text-lg">receipt_long</span>
<span>View Detailed Receipt</span>
</button>
<!-- Support / Lost Item Link -->
<div class="text-center pt-2">
<button class="inline-flex items-center gap-1.5 font-label-md text-label-md text-on-surface-variant hover:text-error transition-colors" type="button">
<span class="material-symbols-outlined text-base">report_problem</span>
<span>Lost an item or report a trip issue?</span>
</button>
</div>
</div>
</div>
<script>
  // Simple micro-interaction for tip selectors
  document.querySelectorAll('.tip-btn').forEach(btn => {
    btn.addEventListener('click', function() {
      document.querySelectorAll('.tip-btn').forEach(b => {
        b.classList.remove('bg-primary', 'text-on-primary');
        b.classList.add('bg-surface-container-low', 'text-on-surface');
      });
      this.classList.remove('bg-surface-container-low', 'text-on-surface');
      this.classList.add('bg-primary', 'text-on-primary');
    });
  });

// Micro-interaction for 5-star rating selection
const starButtons = document.querySelectorAll('.rating-star');
starButtons.forEach(btn => {
btn.addEventListener('click', function() {
const val = parseInt(this.getAttribute('data-value'), 10);
starButtons.forEach(s => {
const sVal = parseInt(s.getAttribute('data-value'), 10);
if (sVal <= val) {
s.classList.add('bg-amber-100');
s.classList.remove('bg-surface-container-low');
} else {
s.classList.remove('bg-amber-100');
s.classList.add('bg-surface-container-low');
}
});
});
});
</script></main></body></html>
