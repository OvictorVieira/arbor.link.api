class Api::V1::Partners::EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ show update ]

  # GET /api/v1/entities
  def index
    @entities = V1::Partners::EntitiesService.get_all

    serialized_entities =  ::EntitySerializer.serialize_entities(@entities)

    render json: serialized_entities, status: :ok
  end

  # GET /api/v1/entities/1
  def show
    render json: ::EntitySerializer.serialize_entity(@entity)
  end

  # POST /api/v1/entities
  def create
    @entity = V1::Partners::EntitiesService.create!(api_v1_entity_params)
    render json: ::EntitySerializer.serialize_entity(@entity), status: :created
  rescue CreateFailureError => e
    render json: e.message, status: :unprocessable_entity
  end

  # PATCH/PUT /api/v1/entities/1
  def update
    @entity = V1::Partners::EntitiesService.update!(@entity, api_v1_entity_params)
    render json: ::EntitySerializer.serialize_entity(@entity), status: :ok
  rescue UpdateFailureError => e
    render json: e.message, status: :unprocessable_entity
  end

  private
    def set_entity
      @entity = V1::Partners::EntitiesService.find(params[:id])
    end

    def api_v1_entity_params
      params.require(:entity).permit(:name, :entity_type, :inep, :parent_id)
    end
end
