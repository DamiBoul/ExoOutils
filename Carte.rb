require 'gosu'

class Carte

    attr_reader :nom
    #attr :image, false

    def Carte.tirer(nom)
        new(nom)
    end

    def initialize(nom)
        @nom = nom
    end

    def to_s
        "#{self.class} #{self.nom}\t"
    end

end

class CarteSimple < Carte

    attr_reader :valeur

    include Comparable

    def CarteSimple.tirer(nom,valeur)
        new(nom,valeur)
    end

    def initialize(nom,valeur)
        super(nom)
        @valeur=valeur
    end

    def to_s
        return (super + " Valeur : #{valeur}")
    end

    def <=>(carte2)
        self.valeur<=>carte2.valeur
    end

end