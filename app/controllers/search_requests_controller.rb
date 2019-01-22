require 'open-uri'

class SearchRequestsController < ApplicationController
  def index
    @requests = SearchRequest.where(user: current_user)
  end

  def show
    type_transac = {
      "Location" => 1,
      "Vente" => 2
    }
    type_of_property = {
      "Appartement" => 1,
      "Maison" => 2,
      "Parking" => 3,
      "Terrain" => 4,
      "Boutique" => 6,
      "Local Commercial" => 7,
      "Bureaux" => 8
    }
    @request = SearchRequest.find(params[:id])
    @url = "http://ws.seloger.com/search.xml?ci=#{@request.insee_code}&tri=prix&fraicheur=10&idtt=#{type_transac[@request.type_transac]}&idtypebien=#{type_of_property[@request.type_of_property]}&pxmin=#{@request.pricemin}&pxmax=#{@request.pricemax}&surfacemin=#{@request.surfacemin}&surfacemax=#{@request.surfacemax}"
    @doc = Nokogiri::XML(open(@url))
  end

  def new
    @user = current_user
    @request = SearchRequest.new
  end

  def create
    @request = SearchRequest.new(search_request_params)
    @request.user = current_user
    if @request.save(search_request_params)
      redirect_to search_request_path(@request)
    else
      render :new
    end
  end

  def delete
  end

  private

  def search_request_params
    params.require(:search_request).permit(:name, :type_transac, :city, :type_of_property, :surfacemin, :surfacemax, :pricemin, :pricemax)
  end
end
