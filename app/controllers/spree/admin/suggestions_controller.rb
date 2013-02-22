module Spree
  module Admin
    class SuggestionsController < ResourceController
      respond_to :html

      def index
        respond_with(@collection) do |format|
          format.html # index.html.erb
          format.json { render json: @suggestions }
        end
      end

      # DELETE /retailers/1
      # DELETE /retailers/1.json
      def destroy
        @suggestion = Suggestion.find(params[:id])
        @suggestion.destroy

        respond_to do |format|
          format.html { redirect_to admin_suggestions_url }
          format.json { head :ok }
        end
      end

      private

    	def collection
        return @collection if @collection.present?

        unless request.xhr?
          @search = Suggestion.search(params[:q])
          @collection = @search.result.page(params[:page]).order("spree_suggestions.id desc")
        else
          @collection = Suggestion.where("LOWER(suggestions.name) #{LIKE} LOWER(:search)",
                                   {:search => "#{params[:q].strip}%"}).limit(params[:limit] || 100).order("spree_suggestions.id desc")
        end

      end

    end
  end
end
