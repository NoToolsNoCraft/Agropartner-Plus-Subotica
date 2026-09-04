module Jekyll
  class ProductPage < Page
    def initialize(site, base, dir, product)
      @site = site
      @base = base
      @dir = dir
      @name = "index.html"

      self.process(@name)

      self.data = {
        "layout" => "product",
        "title" => product["name"],
        "product" => product
      }
    end
  end

  class ProductGenerator < Generator
    safe true

    def generate(site)
      products = site.data["products"]

      return unless products

      products.each do |product|
        slug = product["slug"]

        next unless slug

        page = ProductPage.new(
          site,
          site.source,
          File.join("proizvodi", slug),
          product
        )

        site.pages << page
      end
    end
  end
end