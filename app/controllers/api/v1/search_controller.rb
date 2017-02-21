module Api::V1
    class SearchController < ApiController
        def index
            if !params.has_key?(:query)
                render json: { error: "Search Query Required" }, status: 422
                return
            end

            @claims = Claim.do_search(params[:query])
            @experts = Expert.do_search(params[:query])
            @predictions = Prediction.do_search(params[:query])


            # record search history
            @search = Search.new
            @search.query = params[:query]
            @search.user = current_user if !current_user.nil?
            @search.save
        end


        def most_used_tags
            @tags = ActsAsTaggableOn::Tag.most_used
        end

    end
end