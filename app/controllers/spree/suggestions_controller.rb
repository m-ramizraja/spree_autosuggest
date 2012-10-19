class Spree::SuggestionsController < Spree::BaseController

  def index
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    suggestions = Spree::Suggestion.relevant(params['term'])

    if request.xhr?
      render :json => suggestions.collect{|s| {:keywords => s.keywords, :url => !s.data.blank? && eval(s.data).has_key?(:url) ? eval(s.data)[:url] : ""}}
    else
      render_404
    end
  end

end
