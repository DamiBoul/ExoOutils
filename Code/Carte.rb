require 'gosu'

##
# Une carte a un nom et une image associée. Elles sont joué lors des parties.
# Classe abstraite, une carte est comparée à une autre carte pour savoir qui l'emporte.
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

##
# Les cartes simple ont une valeur associée, celle avec la plus grande valeur l'emporte.
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