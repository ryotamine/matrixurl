# MatrixURL Project by Ryota Mine

After Web Development Bootcamp at Lighthouse Labs, I wanted to create a Ruby on Rails version of [TinyApp](https://github.com/ryotamine/tinyapp). I did so by having a theme from the movie ["The Matrix"](https://en.wikipedia.org/wiki/The_Matrix). MatrixURL is a Matrix-themed full-stack web application built with Ruby on Rails, ERB, and SQLite that allows users to shorten long URLs.

## Final Product

!["Screenshot of home page"](https://github.com/ryotamine/matrixurl/blob/master/docs/home.png)
!["Screenshot of enter URL"](https://github.com/ryotamine/matrixurl/blob/master/docs/enter-url.png)
!["Screenshot of URL results"](https://github.com/ryotamine/matrixurl/blob/master/docs/url-results.png)

## Dependencies

- Ruby on Rails 5.2 [Rails Guide](http://guides.rubyonrails.org/v5.2/)
- SQLite

## Getting Started

1. Fork and clone.
2. Run `bundle install` to install dependencies.
3. Run `bin/rake db:reset` to create, load, and seed db.
4. Download Matrix font at <https://www.fontspace.com/gyusan/matrix> and install it on your computer.
5. Run `bin/rails s -b 0.0.0.0` to start the server.
6. Go to <http://localhost:3000/> in your browser.
