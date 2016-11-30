class CharactersController < ApplicationController
  # GET

  def show
    params.permit!
    render json: Characters.find_by(name: params[:name])
  end

  def index
    render json: Characters.order(created_at: :desc).limit(100), each_serializer: CompactCharacterSerializer
  end

  def export
    params.permit!
    render json: Characters.find_by(name: params[:name]), serializer: ExportCharacterSerializer
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
