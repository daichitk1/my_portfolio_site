class MainPagesController < ApplicationController

  # GET /main_pages or /main_pages.json
  def index
    @main_pages = MainPage.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_page
      @main_page = MainPage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def main_page_params
      params.expect(main_page: [ :title, :body ])
    end
end
