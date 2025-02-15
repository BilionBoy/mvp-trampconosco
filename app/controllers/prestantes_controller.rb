# frozen_string_literal: true
class PrestantesController < ApplicationController
  before_action :set_prestante, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Prestante.ransack(params[:q])
    @pagy, @prestantes = pagy(@q.result)
  end

  def new
    @prestante = Prestante.new
  end

  def edit
  end

  def create
    @prestante = Prestante.new(prestante_params)

    if @prestante.save
      redirect_to prestantes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @prestante.update(prestante_params)
      redirect_to prestantes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @prestante.destroy
      redirect_to prestantes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to prestantes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_prestante
    @prestante = Prestante.find_by(id: params[:id])
    return redirect_to prestantes_path, alert: t('messages.not_found') unless @prestante
  end

  def prestante_params
    permitted_attributes = Prestante.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:prestante).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to prestantes_path, alert: t('messages.not_found')
  end
end
