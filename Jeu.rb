

##
# Jeu gère le jeu, il connait le joueur, la partie et la liste de niveau
class Jeu

    attr :fenetre, false
    attr :joueur, false
    attr :partie, false
    attr :liste_niveaux, false

    def initialize
        @fenetre = Fenetre.new(1024,640,false,self)
    end

    def to_s
        "Lisuele"
    end

    def lanceToi
        @fenetre.donneTonJeu
        @fenetre.show
    end

    def traiteSignal(sig)
        
    end

end


