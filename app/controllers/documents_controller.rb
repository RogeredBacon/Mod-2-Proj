class DocumentsController < ApplicationController
    def index
        @documents = Document.all
    end

    def show
        @document = Document.find(params[:id])
    end

    def new
        @document = Document.new
    end

    def create
        @document = Document.create(data: params[:data])
        redirect_to document_path
    end

    def edit
        @document = Document.find(params[:id])
    end

    def update
        @document = Document.find(params[:id])
        @document.update(data: params[:document][:data])
        redirect_to document_path
    end

end
