class PartieCartes

    attr :jeu, false
    attr :joueur, false
    attr :adversaire, false
    attr :score, false
    attr :niveau, false
    attr :historique, false
    attr :prochainCoupAdv, false

    private_class_method :new
    def PartieCartes.lancer(jeu)
        new(jeu)
    end

    def initialize(jeu)
        @jeu = jeu

        @joueur = Joueur.inscrit(self)
        @adversaire = Adversaire.inscrit(self)

        @score = 0
        @niveau = nil
        @prochainCoupAdv = nil
        @historique = Historique.new()
    end

    def to_s
        str = "Partie"
    end

    ##
    # Commence un nouveau niveau. Réinitialise le score et l'Historique. 
    # Cherche un nouveau prochain coup. Distribue les nouvelles mains.
    def passeAuNiveau(niveau)
        @niveau = niveau
        @score = 0
        @historique.reset
        @niveau.donneMains(@joueur, @adversaire)
        self.chercheProchainCoup
    end

    ##
    # Joue jusqu'à ce que la partie soit terminée
    def joue
        charactereLu = ""
        nbCoupsRestants = @niveau.duree

        while (nbCoupsRestants > 0) & (charactereLu[0] != "q")
            puts "Votre main : "
            puts @joueur
            puts "L'adversaire compte jouer cette carte au coup suivant :"
            puts @prochainCoupAdv
            puts "Que voulez-vous faire ?"
            puts "h \t- afficher l'historique du niveau"
            puts "q \t- quitter la partie"
            puts "1-#{nbCoupsRestants} \t- jouer la carte correspondante"

            charactereLu = gets

            if charactereLu[0] == "h"
                puts "Affichage de l'historique :"
                puts @historique
                puts "Entrée pour continuer."
                gets
            elsif charactereLu[0] == "q"
                puts "Vous quittez la partie.\n"
            elsif charactereLu.to_i == 0
                puts "Charactère invalide (#{charactereLu})."
            elsif charactereLu.to_i > nbCoupsRestants
                puts "Indice trop grand (#{charactereLu} > #{nbCoupsRestants})."
            else
                carteJoueur = @joueur.joue(charactereLu.to_i)
                carteAdv = @adversaire.joue
                afficheCoup(carteJoueur,carteAdv)
                sleep(3)

                resultat = donneResultat(carteJoueur)
                @historique.ajout(carteJoueur,carteAdv,resultat)
                nbCoupsRestants -= 1
                sleep(2)

                puts "\nCoup suivant.\n"
                chercheProchainCoup

                sleep (2)
            end

        end

        puts "Fin du niveau."
        puts "Votre score : #{@score}"

    end

    ##
    # Affiche le coup joué
    def afficheCoup(carteJoueur,carteAdv)
        puts "______________\nvous\n"
        puts carteJoueur
        puts "\tvs."
        puts carteAdv
        puts "adversaire\n______________"
    end

    ##
    # Donne le résultat du coup du joueur et l'ajoute au score. (ne fait pas jouer l'adversaire)
    def donneResultat(carteJoueur)
        resultat = niveau.calculeResultat(carteJoueur,@prochainCoupAdv)
        
        if resultat < 0
            puts "Dommage !"
        elsif resultat == 0
            puts "Égalité"
        else
            puts "Bravo !"
        end
        
        @jeu.afficheResultat(resultat)
        @score += resultat
        return resultat
    end

    ##
    # Modifie la valeur @prochainCoupAdv
    def chercheProchainCoup
        @prochainCoupAdv = adversaire.donneProchainCoup
    end

end