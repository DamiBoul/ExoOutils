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

    def prendMain(main)
        @main = main
    end

    def donneProchainCoup
        main[0]
    end

    def joue
        return main.shift()
    end

end