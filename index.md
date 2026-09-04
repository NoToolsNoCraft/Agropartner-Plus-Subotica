---
title: Poljoprivredna oprema Subotica
---

<div class="container">

    <section class="hero">

        <p class="hero-eyebrow">
            Da vam učinimo život lakšim!
        </p>

        <h1>
            Poljoprivredna oprema
            za pouzdaniji rad
        </h1>

        <p class="hero-description">
            Pronađite kvalitetnu opremu i proizvode
            za svakodnevne potrebe savremene poljoprivrede, kao i održavanja domaćinstva.
        </p>

        <a href="/proizvodi/" class="hero-button">
            Pogledaj proizvode →
        </a>

    </section>

    <section class="about-section">


<div class="section-heading">

    <p class="section-eyebrow">
        O Agropartner Plus-u
    </p>

    <h2>
        Poljoprivreda je više od posla
    </h2>

</div>

<div class="about-content">

    <p>
        Agropartner Plus je lokalna prodavnica poljoprivredne opreme
        i proizvoda u Subotici, namenjena svima koji se bave
        poljoprivredom, baštovanstvom i negom biljaka. Naša priča
        nastala je iz iskrenog interesovanja za poljoprivredu i želje
        da kvalitetni i korisni proizvodi budu dostupni ljudima kojima
        su zaista potrebni.
    </p>

    <p>
        Iza Agropartner Plus-a stoji Stevan Đuričin, veliki entuzijasta
        za poljoprivredu i čovek koji je svoje interesovanje za ovu
        oblast razvijao i kroz studije poljoprivrede. Njegova
        zainteresovanost za biljnu proizvodnju, zaštitu useva i
        svakodnevne izazove sa kojima se poljoprivrednici susreću
        predstavlja osnovu pristupa koji neguje Agropartner Plus:
        ponuditi proizvode koji imaju praktičnu vrednost i biti
        pouzdan lokalni izvor informacija i podrške.
    </p>

    <p>
        Subotica i njena okolina imaju dugu i snažnu poljoprivrednu
        tradiciju. Poljoprivreda nije važna samo velikim proizvođačima
        već i ljudima koji obrađuju manje parcele, neguju voćnjake,
        povrtnjake i bašte ili jednostavno žele da svoje biljke
        održavaju zdravim i produktivnim. Zato Agropartner Plus želi
        da bude deo lokalne poljoprivredne i baštovanske kulture,
        mesto na koje ljudi iz Subotice mogu da svrate, pogledaju
        proizvode i potraže informacije za svoje konkretne potrebe.
    </p>

</div>


</section>


    <section class="featured-products">

    <div class="section-heading">

        <p class="section-eyebrow">
            Izdvajamo iz ponude
        </p>

        <h2>
            Naši proizvodi
        </h2>

        <p>
            Pogledajte deo naše ponude poljoprivredne opreme
            i proizvoda.
        </p>

    </div>

    <div class="product-list">

        {% for product in site.data.products limit:3 %}

            <article class="product-card">

                <a href="/proizvodi/{{ product.slug }}/">

                    <img
                        src="{{ product.image }}"
                        alt="{{ product.name }}"
                    >

                </a>

                <p class="product-category">
                    {{ product.category }}
                </p>

                <h3>
                    <a href="/proizvodi/{{ product.slug }}/">
                        {{ product.name }}
                    </a>
                </h3>

                <p>
                    {{ product.short_description }}
                </p>

                <p class="product-price">
                    {{ product.price }}
                </p>

                <a
                    href="/proizvodi/{{ product.slug }}/"
                    class="product-link"
                >
                    Pogledaj proizvod →
                </a>

            </article>

        {% endfor %}

    </div>

    <div class="section-action">

        <a href="/proizvodi/" class="secondary-button">
            Pogledaj sve proizvode →
        </a>

    </div>

</section>

<section class="contact-section">

    <div class="section-heading">

        <p class="section-eyebrow">
            Tu smo za vas
        </p>

        <h2>
            Treba vam savet ili više informacija?
        </h2>

        <p>
            Pozovite nas, posetite našu radnju ili nam se javite
            za više informacija o proizvodima iz naše ponude.
        </p>

    </div>

    <div class="contact-details">

        <!-- Phone -->

        <div class="contact-detail">

            <h3>
                Pozovite nas
            </h3>

            <p>
                Mobilni:
                <a href="tel:+38169695946">
                    +381 69 695 946
                </a>
            </p>

            <p>
                Telefon iz radnje:
                <a href="tel:+381024692692">
                    024 692 692
                </a>
            </p>

        </div>


        <!-- Address -->

        <div class="contact-detail">

            <h3>
                Posetite nas
            </h3>

            <p>
            <a href="https://maps.app.goo.gl/kj8TFrCE2HVRxdEP6">
                TRG JAKABA I KOMORA 25, 24000, Subotica
            </a>
            </p>

            <p>
                (Kod Mlečne Pijace)
            </p>

        </div>


        <!-- Opening Hours -->

        <div class="contact-detail">

            <h3>
                Radno vreme
            </h3>

            <p>
                Ponedeljak – Petak: 7:30 – 14:00<br>
                Subota: 7:00 – 13:00<br>
                Nedelja: Zatvoreno
            </p>

        </div>

    </div>

</section>

</div>