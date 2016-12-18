import scrapy
from SimpleDemo.items import QuotesItem

class QuoteSpider(scrapy.Spider):
    name = "quote"
    start_urls = {
        'http://quotes.toscrape.com/tag/love/'
    }
    def parse(self, response):
        for q in response.css('div.quote'):
            quote = QuotesItem()
            quote['author'] = q.css('small.author::text').extract_first()
            quote['content'] = q.css('span.text::text').extract_first()
            quote['tags'] = q.css('div.tags > a.tag::text').extract()
            yield quote

        next_page = response.css('li.next a::attr("href")').extract_first()
        if next_page is not None:
            next_page = response.urljoin(next_page)
            yield scrapy.Request(next_page, callback=self.parse)
