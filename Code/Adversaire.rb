##
# Adversaire désigne le joueur de carte que le Joueur affronte.
# Il joue toujours les cartes de sa main dans un ordre prédéfini et le Joueur connait son prochain coup.
class Adversaire

    private_class_method :new

    def Adversaire.inscrit(partie)
        new(partie)
    end

    def initialize(partie)
        @partie = partie
        @main = Array.new()
    end

    def to_s
        strMain = @main.reduce("[ ") {|str, carte| str+carte.to_s+"\n"}
        strMain += "]"

        return "Adversaire. Main actuelle :\n"+strMain
    end

    ##
    # attribue la main en paramètre
    def prendMain(main)
        @main = main
        return self
    end

    ##
    # Indique son prochain coup
    def donneProchainCoup
        @main[0]
    end

    ##
    # Joue un coup, enlève la carte qu'il joue de sa main
    def joue
        return @main.shift()
    end

end