##
# Le joueur communique avec le jeu pour jouer
class Joueur

    private_class_method :new

    def Joueur.inscrit(partie)
        new(partie)
    end

    def initialize(partie)
        @partie = partie
        @main = Array.new()
    end

    def to_s
        i = 0
        strMain = @main.reduce("[ \n") {|str, carte| 
            i += 1
            str+(i.to_s)+" : "+carte.to_s+"\n"
        }
        strMain += "]"

        return "Joueur. Main actuelle :\n"+strMain
    end

    ##
    # attribue la main en paramètre au joueur
    def prendMain(main)
        @main = main
    end

    ##
    # renvoie la carte à l'indice indiqué et l'enlève de la main
    def joue(numCarte)
        if (1..(@main.length)).include?(numCarte)
            retour = @main.delete_at(numCarte-1)
        else
            raise "numéro de carte invalide (#{numCarte} pas dans [|1 ; #{@main.length}|])"
            retour = -1
        end
        
        return retour
    end

end
    