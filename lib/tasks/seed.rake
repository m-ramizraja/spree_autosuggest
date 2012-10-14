namespace :spree_autosuggest do
  task :seed => :environment do
    # all taxons with more than two words
    Spree::Taxon.find(:all, :conditions => ["parent_id is not ? and parent_id <> ?", nil, 1]).each do |taxon|
      searcher = Spree::Config.searcher_class.new({:taxon => taxon.id})
      query = Spree::Suggestion.find_or_initialize_by_keywords(taxon.name)
      query.keywords = taxon.name # keep the case of keywords same with current
      query.items_found = searcher.retrieve_products.size
      query.count = Spree::Autosuggest::Config[:min_count] + 1
      query.data = {:url => "/t/#{taxon.permalink}"}.to_s
      query.save
    end

    # all active and available product names
    Spree::Product.active.available.each do |product|
      query = Spree::Suggestion.find_or_initialize_by_keywords(product.name)
      query.keywords = product.name # keep the case of keywords same with current
      query.items_found = 1
      query.count = Spree::Autosuggest::Config[:min_count] + 1
      query.data = {:url => "/products/#{product.permalink}"}.to_s
      query.save      
    end

    # spree pages extension?
  end
end
