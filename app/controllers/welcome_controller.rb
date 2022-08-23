class WelcomeController <ApplicationController 
    def show 
        @query = Senior.ransack(params[:q])
    end
end