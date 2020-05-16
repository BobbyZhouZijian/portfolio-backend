module Api
  #noinspection RubyClassModuleNamingConvention
  module V1
    class EducationContentsController < ApplicationController
      def index
        contents = EducationContent.find(params[:education_id])
        render json: {
            status: 'SUCCESS',
            message: 'Loaded education contents',
            data: contents
        }, status: :ok
      end

      def create
        education = Education.find(params[:education_id])
        education.education_contents.create(education_contents_params)
        if education.save
          render json: {
              status: 'SUCCESS',
              message: 'Loaded education contents',
              data: education
          }, status: :ok
        else
          render json: {
              status: 'ERROR',
              message: 'Failed to loaded education contents',
              data: education.errors
          }, status: :unprocessable_entity
        end
      end

      def update
        content = EducationContent.find(params[:id])
        if content.update_attributes(education_contents_params)
          render json: {
              status: 'SUCCESS',
              message: 'Updated education contents',
              data: content
          }, status: :ok
        else
          render json: {
              status: 'ERROR',
              message: 'Failed to update education contents',
              data: content.errors
          }, status: :unprocessable_entity
        end
      end

      def destroy
        content = EducationContent.find(params[:id])
        content.destroy
        render json: {
            status: 'SUCCESS',
            message: 'Deleted education contents',
            data: content
        }, status: :ok
      end


      private

      def education_contents_params
        params.permit(:education_content, :content, :education_id)
      end
    end
  end
end
