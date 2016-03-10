class FileVersionsController < ApplicationController
  before_action :set_file_version, only: [:show, :edit, :update, :destroy]
  before_action :set_file_upload

  # GET /file_versions
  # GET /file_versions.json
  def index
    @file_versions = FileVersion.all
  end

  # GET /file_versions/1
  # GET /file_versions/1.json
  def show
  end

  # GET /file_versions/new
  def new
    @file_version = FileVersion.new
    @file_version.file_upload_id = params[:file_upload_id]
    file_version = FileVersion.where(file_upload_id: params[:file_upload_id]).count
    @file_version.file_version = file_version + 1
  end

  # GET /file_versions/1/edit
  def edit
    #raise "oe"
    file_version = @file_upload.file_type
    respond_to do |format|
      if (@file_upload.update(file_type: @file_version.file_type) && @file_version.update(file_type: file_version))
        format.html { redirect_to @file_upload, notice: 'File upload was successfully restored.' }
      end
    end
  end

  # POST /file_versions
  # POST /file_versions.json
  def create
    @file_version = FileVersion.new(file_version_params)
    @file_version.file_upload_id = params[:file_upload_id]

    respond_to do |format|
      if @file_version.save
        format.html { redirect_to @file_upload, notice: 'File version was successfully created.' }
        format.json { render :show, status: :created, location: @file_version }
      else
        format.html { render :new }
        format.json { render json: @file_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_versions/1
  # PATCH/PUT /file_versions/1.json
  def update
    respond_to do |format|
      if @file_version.update(file_version_params)
        format.html { redirect_to @file_version, notice: 'File version was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_version }
      else
        format.html { render :edit }
        format.json { render json: @file_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_versions/1
  # DELETE /file_versions/1.json
  def destroy
    @file_version.destroy
    respond_to do |format|
      format.html { redirect_to file_versions_url, notice: 'File version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_version
      @file_version = FileVersion.find(params[:id])
    end

    def set_file_upload
      @file_upload = FileUpload.find(params[:file_upload_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_version_params
      params.require(:file_version).permit(:file_upload_id, :file_version, :file_type)
    end
end
