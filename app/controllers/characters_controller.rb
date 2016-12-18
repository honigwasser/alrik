class CharactersController < ApplicationController
  # GET

  def show
    params.permit!
    render json: Character.find_by(id: params[:id])
  end

  def index
    render json: Character.order(created_at: :desc).limit(100), each_serializer: CompactCharacterSerializer
  end

  def export
    params.permit!
    render json: Character.find_by(id: params[:id]), serializer: ExportCharacterSerializer
  end

  # POST

  def create
    JSON::Validator.validate!("app/schemas/create_character.json", "data" => params[:data])
    params.permit!
    render json: { name: CreateCharacterService.create(params[:data]) }, status: :created
  end

  # PUT

  def update
    JSON::Validator.validate!("app/schemas/update_character.json", "data" => params[:data])
    params.permit!
    render json: { name: UpdateCharacterService.update(params[:data]) }, status: :ok
  end
end
