class Api::V1::EntitiesController < ApplicationController
  before_action :set_api_v1_entity, only: %i[ show update destroy ]

  # GET /api/v1/entities
  def index
    @api_v1_entities = V1::EntitiesService.get_all

    render json: @api_v1_entities

  end

  # GET /api/v1/entities/1
  def show
    render json: @api_v1_entity
  end

  # POST /api/v1/entities
  def create
    @api_v1_entity = V1::EntitiesService.create!(api_v1_entity_params)
    render json: @api_v1_entity, status: :created
  rescue CreateFailureError => e
    render json: e.message, status: :unprocessable_entity
  end

  # PATCH/PUT /api/v1/entities/1
  def update
    @api_v1_entity = V1::EntitiesService.update!(@api_v1_entity, api_v1_entity_params)
    render json: @api_v1_entity, status: :ok
  rescue UpdateFailureError => e
    render json: e.message, status: :unprocessable_entity
  end

  # DELETE /api/v1/entities/1
  def destroy
    V1::EntitiesService.destroy!(@api_v1_entity)
  rescue UpdateFailureError => e
    render json: e.message, status: :unprocessable_entity
  end

  private
    def set_api_v1_entity
      @api_v1_entity = V1::EntitiesService.find(params[:id])
    end

    def api_v1_entity_params
      params.require(:entity).permit(:name, :entity_type, :inep, :parent_id)
    end
end
