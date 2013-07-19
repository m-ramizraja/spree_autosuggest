module SuggestionHelpers
  def create_suggestions active_inactive_product_objects = nil
    Spree::Product.active.available.each do |product|
      query = Spree::Suggestion.find_or_initialize_by_keywords(product.name)
      query.keywords = product.name
      query.items_found = 1
      query.count = Spree::Autosuggest::Config[:min_count] + 1
      query.data = {url: "/products/#{product.permalink}"}.to_s
      query.save
    end
  end
end
