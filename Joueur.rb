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
        strMain = @main.reduce("[ ") {|str, carte| str+carte.to_s+"\n"}
        strMain += "]"

        return "Joueur. Main actuelle :\n"+strMain

    def prendMain(main)
        @main = main
    end

    def joue(numCarte)
        retour = main[numCarte]
        
        return retour
    end

end
    