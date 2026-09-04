---
title: Proizvodi
---

<div class="container">

    <h1>Naši proizvodi</h1>

    <div class="product-list">

    {% for product in site.data.products %}

        <article class="product-card">

            <a href="/proizvodi/{{ product.slug }}/">

                <img
                    src="{{ product.image | relative_url }}"
                    alt="{{ product.name }}"
                >

            </a>

            <h2>
                <a href="/proizvodi/{{ product.slug }}/">
                    {{ product.name }}
                </a>
            </h2>

            <p>{{ product.short_description }}</p>

            <p>
                <strong>{{ product.price }}</strong>
            </p>

            <a href="/proizvodi/{{ product.slug }}/">
                Pogledaj proizvod →
            </a>

        </article>

    {% endfor %}

    </div>

</div>