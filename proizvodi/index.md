---
title: Proizvodi
---

<div class="container">

    <h1>Naši proizvodi</h1>

    <!-- Category filters -->
    <div class="product-filters" id="product-filters">
        <button class="filter-button active" data-category="all">
            Svi proizvodi
        </button>
    </div>

    <!-- Product list -->
    <div class="product-list" id="product-list">

        {% for product in site.data.products %}

            <article
                class="product-card"
                data-category="{{ product.category | escape }}"
            >

                <a href="/proizvodi/{{ product.slug }}/">

                    <img
                        src="{{ product.image | relative_url }}"
                        alt="{{ product.name }}"
                        loading="lazy"
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

    <!-- Pagination -->
    <div class="product-pagination" id="product-pagination"></div>

</div>


<style>

/* ================================
   PRODUCT FILTERS
   ================================ */

.product-filters {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin: 25px 0 35px;
}

.filter-button {
    border: 1px solid #ccc;
    background: #fff;
    color: #333;
    padding: 10px 18px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 15px;
    transition: all 0.2s ease;
}

.filter-button:hover {
    background: #f2f2f2;
}

.filter-button.active {
    background: #333;
    color: #fff;
    border-color: #333;
}


/* ================================
   PAGINATION
   ================================ */

.product-pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 6px;
    margin: 40px 0 20px;
}

.pagination-button {
    min-width: 40px;
    height: 40px;
    padding: 0 12px;
    border: 1px solid #ccc;
    background: #fff;
    color: #333;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
    transition: all 0.2s ease;
}

.pagination-button:hover:not(:disabled) {
    background: #f2f2f2;
}

.pagination-button.active {
    background: #333;
    color: #fff;
    border-color: #333;
}

.pagination-button:disabled {
    opacity: 0.4;
    cursor: default;
}


/* ================================
   HIDDEN PRODUCTS
   ================================ */

.product-card.product-hidden {
    display: none;
}


/* ================================
   MOBILE
   ================================ */

@media (max-width: 600px) {

    .product-filters {
        gap: 8px;
    }

    .filter-button {
        padding: 8px 12px;
        font-size: 14px;
    }

    .product-pagination {
        margin-top: 30px;
    }

    .pagination-button {
        min-width: 36px;
        height: 36px;
        padding: 0 9px;
        font-size: 14px;
    }

}

</style>


<script>

document.addEventListener("DOMContentLoaded", function () {

    const products = Array.from(
        document.querySelectorAll(".product-card")
    );

    const filtersContainer = document.getElementById("product-filters");
    const paginationContainer = document.getElementById("product-pagination");

    const productsPerPage = 12;

    let currentCategory = "all";
    let currentPage = 1;


    /* =================================
       CREATE CATEGORY BUTTONS
       ================================= */

    const categories = [
        ...new Set(
            products
                .map(product => product.dataset.category)
                .filter(category => category)
        )
    ];

    categories.forEach(category => {

        const button = document.createElement("button");

        button.className = "filter-button";

        button.dataset.category = category;

        button.textContent = category;

        filtersContainer.appendChild(button);

    });


    /* =================================
       GET FILTERED PRODUCTS
       ================================= */

    function getFilteredProducts() {

        if (currentCategory === "all") {
            return products;
        }

        return products.filter(product => {
            return product.dataset.category === currentCategory;
        });

    }


    /* =================================
       DISPLAY PRODUCTS
       ================================= */

    function displayProducts() {

        const filteredProducts = getFilteredProducts();

        const totalPages = Math.ceil(
            filteredProducts.length / productsPerPage
        );


        /* Make sure current page is valid */

        if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }


        /* Hide everything first */

        products.forEach(product => {
            product.classList.add("product-hidden");
        });


        /* Calculate current page */

        const startIndex =
            (currentPage - 1) * productsPerPage;

        const endIndex =
            startIndex + productsPerPage;


        /* Show products for current page */

        filteredProducts
            .slice(startIndex, endIndex)
            .forEach(product => {

                product.classList.remove("product-hidden");

            });


        /* Update pagination */

        createPagination(totalPages);

    }


    /* =================================
       CREATE PAGINATION
       ================================= */

    function createPagination(totalPages) {

        paginationContainer.innerHTML = "";

        if (totalPages <= 1) {
            return;
        }


        /* Previous button */

        const previousButton =
            document.createElement("button");

        previousButton.className = "pagination-button";

        previousButton.textContent = "‹";

        previousButton.disabled = currentPage === 1;

        previousButton.addEventListener("click", function () {

            if (currentPage > 1) {

                currentPage--;

                displayProducts();

                scrollToProducts();

            }

        });

        paginationContainer.appendChild(previousButton);


        /* Page buttons */

        for (let page = 1; page <= totalPages; page++) {

            const pageButton =
                document.createElement("button");

            pageButton.className = "pagination-button";

            pageButton.textContent = page;

            if (page === currentPage) {
                pageButton.classList.add("active");
            }

            pageButton.addEventListener("click", function () {

                currentPage = page;

                displayProducts();

                scrollToProducts();

            });

            paginationContainer.appendChild(pageButton);

        }


        /* Next button */

        const nextButton =
            document.createElement("button");

        nextButton.className = "pagination-button";

        nextButton.textContent = "›";

        nextButton.disabled = currentPage === totalPages;

        nextButton.addEventListener("click", function () {

            if (currentPage < totalPages) {

                currentPage++;

                displayProducts();

                scrollToProducts();

            }

        });

        paginationContainer.appendChild(nextButton);

    }


    /* =================================
       CATEGORY FILTERING
       ================================= */

    filtersContainer.addEventListener("click", function (event) {

        if (!event.target.classList.contains("filter-button")) {
            return;
        }

        const clickedButton = event.target;

        currentCategory =
            clickedButton.dataset.category;

        currentPage = 1;


        /* Update active button */

        document
            .querySelectorAll(".filter-button")
            .forEach(button => {

                button.classList.remove("active");

            });

        clickedButton.classList.add("active");


        /* Display filtered products */

        displayProducts();

        scrollToProducts();

    });


    /* =================================
       SCROLL TO PRODUCT LIST
       ================================= */

    function scrollToProducts() {

        const productList =
            document.getElementById("product-list");

        if (!productList) {
            return;
        }

        const offset = 100;

        const position =
            productList.getBoundingClientRect().top +
            window.pageYOffset -
            offset;

        window.scrollTo({
            top: position,
            behavior: "smooth"
        });

    }


    /* =================================
       INITIAL DISPLAY
       ================================= */

    displayProducts();

});

</script>