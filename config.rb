activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
  activate :favicon_maker, :icons => {
    "_favicon_template.png" => [
      { icon: "source/images/icon.png", size: "16x16" }
    ]
  }
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end
