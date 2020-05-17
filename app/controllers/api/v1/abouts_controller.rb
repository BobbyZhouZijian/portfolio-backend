module Api
  # noinspection RubyClassModuleNamingConvention
  module V1
    class AboutsController < ApplicationController
      def index
        abouts = About.all
        render json: {
          status: "SUCCESS",
          message: "Loaded all abouts",
          data: abouts
        }, status: :ok
      end
    end
  end
end
