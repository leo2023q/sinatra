require "./item.rb"
class List 
    attr_writer :items 
    def initialize
        @items = Array.new()
    end
    def add_item(texto)
        item = Item.new(texto)
        @items.push(item)
    end
    def remove_item(index)
        @items.delete_at(index)
    end
    def checked_item(index)
       @items[index].checked=true 
       @items[index]
    end
    def remove_all 
        @items.clear 
    end
    def show_all
        if @items.length == 0
            puts "no has seleccionado nada"
        else
            @items.each_index do |index|
                puts index.to_s + " - " +@items[index].to_s
            end
        end
    end
end