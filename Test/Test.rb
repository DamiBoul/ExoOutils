require 'gosu'

load 'Code/Jeu.rb'
load 'Code/Fenetre.rb'
load 'Code/Carte.rb'
load 'Code/Niveau.rb'
load 'Code/Joueur.rb'
load 'Code/Adversaire.rb'
load 'Code/Partie.rb'
load 'Code/Historique.rb'

class Test

  def Test.testJeu
    isuele = Jeu.new
    isuele.lanceToi
  end

  def Test.testSimple
    c1 = CarteSimple.tirer("un",1)
    c2 = CarteSimple.tirer("deux",2)
    c3 = CarteSimple.tirer("trois",3)
    c4 = CarteSimple.tirer("quatre",4)
    c5 = CarteSimple.tirer("cinq",5)

    main1 = [c2,c3,c5,c4]
    main2 = [c1,c2,c5,c4]

    niv1 = Niveau.creer("nivSimple", self.method('regleSimple'), CarteSimple, main1, main2)

    puts c1
    puts c2
    puts main1
    puts niv1

    puts niv1.calculeResultat(c1,c2)
    puts niv1.calculeResultat(c5,c3)
  end

  def Test.testPartie
    jeu = Jeu.new

    c1 = CarteSimple.tirer("un",1)
    c2 = CarteSimple.tirer("deux",2)
    c3 = CarteSimple.tirer("trois",3)
    c4 = CarteSimple.tirer("quatre",4)
    c5 = CarteSimple.tirer("cinq",5)

    main1 = [c2,c3,c5,c4]
    main2 = [c1,c2,c5,c4]

    niv1 = Niveau.creer("nivSimple", self.method('regleSimple'), CarteSimple, main1, main2)

    partie = PartieCartes.lancer(jeu)

    partie.passeAuNiveau(niv1)
    partie.joue
  end

end

Test.testPartie()
