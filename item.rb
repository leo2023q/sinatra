
class Item 
    attr_accessor   :texto,:checked
  def initialize (texto="")
   @texto = texto
   @checked = false
  end
  def to_s 
    if @checked
        "[x] " + @texto
    else 
        "[] " + @texto
    end
  end
end
