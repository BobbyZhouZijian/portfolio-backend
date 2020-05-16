module Api
  #noinspection RubyClassModuleNamingConvention
  module V1
    class EducationsController < ApplicationController

      before_action :validate_api_key!

      def index
        educations = Education.order('institution_name')
        render json: {
          status: 'SUCCESS',
          message: 'Loaded educations',
          data: educations
        }, status: :ok
      end

      def show
        education = Education.find(params[:id])
        render json: {
          status: 'SUCCESS',
            message: 'Loaded education',
            contents: EducationContent.where(education_id: education.id).all,
            data: education
        }, status: :ok
      end

      def create
        education = Education.new(education_params)
        if education.save
          render json: {
            status: 'SUCCESS',
              message: 'Loaded education',
              contents: EducationContent.where(education_id: education.id).all,
              data: education
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
              message: 'Education not saved',
              data: education.errors
          }, status: :unprocessable_entity
        end
      end

      def update
        education = Education.find(params[:id])
        if education.update_attributes(education_params)
          render json: {
            status: 'SUCCESS',
              message: 'Updated education',
              contents: EducationContent.where(education_id: education.id).all,
              data: education
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
              message: 'education not updated',
              data: education.errors
          }, status: :unprocessable_entity
        end
      end

      def destroy
        education = Education.find(params[:id])
        education.destroy
        render json: {
          status: 'SUCCESS',
            message: 'Deleted education',
            data: education
        }, status: :ok
      end

      private

      def education_params
        params.require(:education).permit(:institution_name, :link, :degree)
      end

      def valid_api_key?
        request.headers['X-Api-Key'] == Rails.application.credentials.api_key
      end

      def validate_api_key!
        return if valid_api_key?

        render json: {
          status: 'ERROR',
          message: 'incorrect api key'
        }, status: :forbidden
      end
    end
  end
end
