class PartieCartes

    attr :jeu, false
    attr :joueur, false
    attr :adversaire, false
    attr :score, false
    attr :niveau, false
    attr :historique, false
    attr :prochainCoupAdv, false

    private_class_method :new
    def PartieCartes.lancer(jeu, joueur)
        new(jeu, joueur)
    end

    def initialize(jeu, joueur)
        @jeu = jeu
        @joueur = joueur

        @adversaire = nil
        @score = 0
        @niveau = nil
        @prochainCoupAdv = nil
        @historique = nil
    end

    ##
    # Commence un nouveau niveau. Réinitialise le score et l'Historique. 
    # Cherche un nouveau prochain coup. Distribue les nouvelles mains.
    def passeAuNiveau(niveau)
        @niveau = niveau
        @score = 0
        @historique.reset
        self.chercheProchainCoup
        @niveau.donneMains(@joueur, @adversaire)
    end

    ##
    # Donne le résultat du coup du joueur.
    def donneResultat(carteJoueur)
        resultat = niveau.calculeResultat(carteJoueur,@prochainCoupAdv)
        
        if resultat < 0
            resultat_str = "Dommage !"
        elsif resultat == 0
            resultat_str = "Égalité"
        else
            resultat_str = "Bravo !"
        end
        
        partie.afficheResultat(resultat_str)
        score += resultat

    end

    ##
    # Modifie la valeur @prochainCoupAdv
    def chercheProchainCoup
        adversaire.donneProchainCoup
    end

end