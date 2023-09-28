source "https://rubygems.org"

ruby "3.3.0.preview2"

gem "rails", github: "rails/rails", branch: "main"
gem "pg", "~> 1.5"
gem "puma", "~> 6.4"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "rspec", "~> 3.12"
end

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
  gem "ruby-lsp-rails"
  gem "standard", "~> 1.31"
end
