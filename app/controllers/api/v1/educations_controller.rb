module Api
  # noinspection RubyClassModuleNamingConvention
  module V1
    class EducationsController < ApplicationController
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

      def find_by_name
        educations = Education.where('lower(institution_name) LIKE ?', "%#{params[:institution_name].downcase}%")
        render json: {
          status: 'SUCCESS',
          message: 'Found education',
          data: educations
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
    end
  end
end
