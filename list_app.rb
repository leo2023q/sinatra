require "./list.rb"
require "./item.rb"

# agregar un articulo
# remover un articulo
# ver todos los articulos
# marcar un articulo
# borrar los articulos
# salir dela aplicacion

class ListApp 
    attr_writer :lista
    def initialize
        @lista = List.new
    end
    def run 
        puts "esta es tu lista para compras"
        loop do # Eliminar el if de esta línea
            
            puts "a - agregar un articulo"
            puts "r - remover articulos"
            puts "v - mostrar los articulos"
            puts "m - marcar los ariculos"
            puts "b - borrar los articulos"
            puts "s - salir de la aplicacion"
            input = gets.chomp 

            case input 
            when 'a'
                puts "que producto quieres agregar"
                item = gets.chomp
                @lista.add_item(item)
                60.times {print "*"}
                puts "\n#{item} ha sido agregado exitosamente \n"
                60.times {print "*"}
                puts "\n"
            when 'v'
                @lista.show_all
                            
            when 'b'
                puts "desea borrar todos los articulos s/n"
                input = gets.chomp
                if input == 's'
                @lista.remove_all
                else
                     puts "cancelada la borracion"
                end
            when 'r'
                puts " digita el numero del producto que quieras remover"
                index = gets.chomp 
                item = @lista.remove_item(index.to_i)
                60.times {print "*"}
                puts "\n#{item.texto} ha sido removido exitosamente \n"
                60.times {print "*"}
                puts "\n"
            when 'm'
                puts "articulo a chaquear"
                index = gets.chomp
                item = @lista.checked_item(index.to_i)
                60.times {print "*"}
                puts "\n#{item.texto} ha sido marcado exitosamente \n"
                60.times {print "*"}
                puts "\n"
            when 's'
                break
            else

                
            puts "********operacion no recocida digita a ,b ,m ,v ,s o r *******"
            end
        end
    
       puts "********* utilizastes tu lista de compras , REGRESA PRONTO!!!! ***********"
        
    end
end
list_app = ListApp.new
list_app.run
