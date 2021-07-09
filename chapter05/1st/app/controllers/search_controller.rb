class SearchController < ApplicationController
  def search
    @model = params["search"]["model"] #選択したモデルを@modelに代入
    @value = params["search"]["value"] #検索にかけた文字列(value)を@valueに代入
    @how = params["search"]["how"] #選択した検索方法(how)を@howに代入
    @datas = search_for(@how, @model, @value) #search_forの引数にインスタンス変数を定義
  end #@datasに最終的な検索結果が代入される

  private

  def match(model, value)
    if model == "user"
      User.where(name: value)
    elsif model == "book"
      Book.where(title: value)
    end
  end

  def forward(model, value)
    if model == "user"
      User.where("name LIKE ?", "#{value}%")
    elsif model == "book"
      Book.where("title LIKE ?", "#{value}%")
    end
  end

  def backward(model, value)
    if model == "user"
      User.where("name LIKE ?", "%#{value}")
    elsif model == "book"
      Book.where("title LIKE ?", "%#{value}")
    end
  end

  def partical(model, value)
    if model == "user"
      User.where("name LIKE ?", "%#{value}%")
    elsif model == "book"
      Book.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)
    case how
    when "match"
      match(model, value)
    when "forward"
      forward(model, value)
    when "backward"
      backward(model, value)
    when "partical"
      partical(model, value)
    end
  end

end
