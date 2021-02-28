class AppointmentsController < ApplicationController

        def index

        end

        def show

        end

        def new

        end

        def create

        end

        def edit

        end

        def update

        end


        def destroy

            if  params[:appointments].present?
                SavedSearch.destroy(params[:appointments][:id])
                flash[:success] = "Saved search has been deleted"
                redirect_to :action => 'index'
            else
                SavedLink.destroy(params[:appointments][:id])
                flash[:success] = "Saved link has been deleted"
                redirect_to :action => 'index'
            end

        end

end
