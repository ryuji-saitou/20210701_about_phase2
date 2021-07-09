class SearchesController < ApplicationController

  def search
    @value = params["value"]  # 「"xx"」でも「:xx」でも可能
    @model = params[:model]
    @how = params[:how]
    @datas = search_for(@value, @model, @how)
  end

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

  def partial(model, value)
    if model == "user"
      User.where("name LIKE ?", "%#{value}%")
    elsif model == "book"
      Book.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(value, model, how) # テストとして参考コードと変更しています("記述位置"最下部"→"private最上部")
    case how
    when "match"
      match(model, value)
    when "forward"
      forward(model, value)
    when "backward"
      backward(model, value)
    when "partial"
      partial(model, value)
    end
  end

end
