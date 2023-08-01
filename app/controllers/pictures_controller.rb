class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    set_picture
  end

  def new
    @picture = Picture.new
  end

  def edit
    set_picture
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    render :new if params[:back]
    respond_to do |format|
      if @picture.save
        format.html { redirect_to picture_url(@picture), notice: "画像の保存に成功しました" }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_picture

    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to picture_url(@picture), notice: "画像の編集に成功しました." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def destroy
    set_picture
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "画像を削除しました." }
      format.json { head :no_content }
    end
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:image, :user_id, :image_cache, :comment)
    end
end
