module Api
  # noinspection RubyClassModuleNamingConvention
  module V1
    class ProjectsController < ApplicationController
      def index
        projects = Project.all
        render json: {
          status: 'SUCCESS',
          message: 'Loaded projects',
          data: projects
        }, status: :ok
      end

      def create
        project = Project.new(project_params)
        if project.save
          render json: {
            status: 'SUCCESS',
            message: 'created new project',
            data: project
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'failed to create new project',
            data: project.errors
          }, status: :unprocessable_entity
        end
      end

      def show
        project = Project.find(params[:id])
        render json: {
          status: 'SUCCESS',
          message: 'found project',
          data: project
        }, status: :ok
      end

      def find_by_name
        projects = Project.where('lower(project_name) LIKE ?', "%#{params[:project_name].downcase}%")
        render json: {
          status: 'SUCCESS',
          message: 'Found education',
          data: projects
        }, status: :ok
      end

      def update
        project = Project.find(params[:id])
        if project.update_attributes(project_params)
          render json: {
            status: 'SUCCESS',
            message: 'updated project',
            data: project
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'failed to update project',
            data: project.errors
          }, status: :ok
        end
      end

      def destroy
        project = Project.find(params[:id])
        project.destroy
        render json: {
          status: 'SUCCESS',
          message: 'destroyed project',
          data: project
        }, status: :ok
      end

      private

      def project_params
        params.permit(:project_name, :repo_link, :open_repo, :content)
      end
    end
  end
end
