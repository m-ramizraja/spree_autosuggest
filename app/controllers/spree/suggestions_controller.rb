class Spree::SuggestionsController < Spree::BaseController

  def index
    suggestions = Spree::Suggestion.relevant(params['term'])

    if request.xhr?
      render :json => suggestions.collect{|s| {:keywords => s.keywords, :url => eval(s.data)[:url]}}
    else
      render_404
    end
  end

end
