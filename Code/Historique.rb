##
# Contient la liste des coups joué lors d'une partie, en distinguant qui a gagné, et qui a joué quelle carte
class Historique

    ##
    # Contient des coups défini de la manière suivante : (coupJoueur, coupAdversaire, gagnant)
    attr :listeCoups, false

    def initialize()
        @listeCoups = Array.new()
    end

    def to_s()
        #TODOTODOTODOTODOTODOTODOTODO
        return @listeCoups.to_s
    end

    ##
    # réinitialise la liste de coups
    def reset
        @listeCoups = Array.new()
    end

    ##
    # Ajoute un coup dans la liste
    def ajout(carteJoueur, carteAdv, gagnant)
        @listeCoups.push([carteJoueur,carteAdv,gagnant])
    end

end