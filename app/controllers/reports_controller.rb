# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @comments = @report.comments
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.destroy
      redirect_to @report, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
    else
      redirect_to @report
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :content).merge(user_id: current_user.id)
  end
end
