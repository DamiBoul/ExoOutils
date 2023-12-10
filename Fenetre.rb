require 'gosu'

class Fenetre < Gosu::Window

    attr :jeu



  def initialize(width=1024, height=640, fullscreen=false, jeu)
    super(width,height,fullscreen)
    self.caption = 'Lisuele'
    
    @message = Gosu::Image.from_text(
        self, 'Salut les amis!', Gosu.default_font_name, 30)

    @jeu = jeu
  end

  def draw
    @message.draw(300, 300, 0)
  end

  def donneTonJeu
    puts @jeu
  end
  
end
