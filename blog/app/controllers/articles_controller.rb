class ArticlesController < ApplicationController
  before_action :authenticate_model!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]


  def index
     @articles = Article.all
   end

  def show
     @article = Article.find(params[:id])
   end

   def new
   @article = current_model.articles.build
 end

 def edit
   @article = Article.find(params[:id])

 end

 def create
   @article = current_model.articles.build(article_params)

   if @article.save
     redirect_to @article
   else
     render 'new'
   end
 end

 def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to articles_path
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

  private
    def article_params
      params.require(:article).permit(:title, :date, :text)
    end

    def correct_user
    @article = current_model.articles.find_by(id: params[:id])
    redirect_to welcome_index_path, notice: "Not authorized to edit this pin" if @article.nil?
end

end
