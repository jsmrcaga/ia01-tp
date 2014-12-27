; +t_preparation en minutes (sans compter cuisson ou refigération), cumulables
; +cout : bon marché, moyen, cher. Non-cumulable !
; + difficulte : 1 très facile, 2 facile, X très difficile. Non-cumulable, on prend le maximum !
; +materiel : le cdr de ce champs en la liste du matos nécessaire

; ingrédients solides en gr
; liquide en ml

; attention ! si le résultat est une liste, c'est qu'il y
; en a plusieurs

; est-ce que je laisse une différence entre le nom de la recette et la
; partie résultat ? parce que si c'est identique, autant supprimer
; une des 2 répétitions. Ou alors avec un des deux on fait un joli
; string pour l'affichage

(

(oeuf
	((oeuf 1))
	((jaune_oeuf 1)(blanc_oeuf 1)))

(sucre_glace
	((sucre 5)
	(+materiel moulin_a_cafe))
	(sucre_glace 5))

(pate_brisee_maison
	((farine 250)
		(beurre 125)
		(sel 1)
		(jaune_oeuf 1)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1))
	(pate_brisee 1))

(pate_sablee_maison
	((farine 250)
		(beurre 125)
		(sel 1)
		(jaune_oeuf 1)
		(sucre 80)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(pate_sablee 1))

(pate_feuilletee_maison
	((farine 250)
		(eau 152)
		(sel 5)
		(sucre 185)
		(+t_preparation 45)
		(+cout 1)
		(+difficulte )) ; XXX difficulté difficile ???
	(pate_feuilletee 1))

(creme_patissiere
	((lait 500)
		(gousse_vanille 1)
		(jaune_oeuf 4)
		(sucre 60)
		(maizena 20)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(creme_patissiere 500))

(pate_amande
	((poudre_amandes 150)
		(sucre_glace 150)
		(blanc_oeuf 4)
		(extrait_amande_amere 2)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(pate_amande 300))

(genoise
	((oeuf 4)
		(sucre 100)
		(farine 100)
		(extrait_vanille 5)
		(+t_preparation 150)
		(+cout 1)
		(+difficulte 2))
	(genoise 1))

(caramel_liquide
	((sucre 250)
		(jus_citron 20)
		(eau 150)
		(+t_preparation 2)
		(+cout 1)
		(+difficulte 2))
	(caramel_liquide 1)) ; quantité ? -> p21

(beurre_maison
	((creme_liquide 200)
		(+materiel batteur_electrique passoire)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(beurre 100))

(creme_anglaise
	((gousse_vanille 1)
		(lait 400)
		(jaune_oeuf 4)
		(sucre 75)
		(+materiel film_alimentaire passoire)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(creme_anglaise 500))

(coulis_chocolat
	((chocolat_noir 200)
		(lait 100)
		(creme_liquide 150)
		(beurre 20)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(coulis_chocolat 500))

(coulis_framboise
	((eau 200)
		(sucre 150)
		(framboises 450)
		(jus_citron 20)
		(+materiel blender passoire_fine)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(coulis_framboise 500))

(creme_au_beurre
	((eau 30)
		(sucre 125)
		(jaune_oeuf 3)
		(beurre 125)
		(+t_preparation 15)
		(+cout 15)
		(+difficulte )) ; XXX
	(creme_au_beurre 500))

(creme_chantilly
	((creme_liquide 250)
		(sucre_glace 30)
		(+materiel batteur_electrique)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(creme_chantilly 250))

(sauce_bechamel
	((beurre 20)
		(farine 20)
		(lait 200)
		(vin_blanc 50)
		(noix_muscade 1)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(sauce_bechamel 250))

(confit_oignons
	((oignons 6)
		(sucre 100)
		(vinaigre_balsamique 80)
		(huile_olive 20)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(confit_oignons 1)) ; XXX 1 pot ? c'est pas ouf précis ^^

(pate_a_viennoiserie
	((levure_boulanger 20)
		(lait 125)
		(farine 500)
		(sucre 60)
		(sel 5)
		(eau 125)
		(beurre 300)
		(+t_preparation 80)
		(+cout 1)
		(+difficulte )) ; XXX
	(pate_a_viennoiserie 15))

(croissants
	((pate_a_viennoiserie 15)
		(oeuf 1)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1))
	(croissants 15))

(pain_au_chocolat
	((pate_a_viennoiserie 15)
		(oeuf 1)
		(chocolat_noir 300)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1))
	(pain_au_chocolat 15))



(preparation_a_loignon
	((oignons 800)
		(beurre 20)
		(farine 10)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(preparation_a_loignon 1))

(tarte_a_loignon
	((pate_brisee 1)
		(preparation_a_loignon 1)
		(oeuf 3)
		(creme_liquide 200)
		(noix_muscade 1)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(tarte_a_loignon 1))

(appareil_omelette
	((oeuf 3); ? XXX
		(creme_liquide 100)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 1)
	(appareil_omelette 1))

(omelette_aux_oignons
	((appareil_omelette 1)
		(preparation_a_loignon)
		(huile_olive 5)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 1))
	(omelette_aux_oignons 2))

(appareil_galettes
	((pomme_de_terre 500)
		(oignons 2)
		(persil 1)
		(appareil_omelette 1)
		(flocons_avoine 300)
		(farine 20)
		(huile_olive 5)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1))
	(appareil_galettes 20))

(galettes_pomme_de_terre
	((pomme_de_terre 500)
		(appareil_galettes 20)
		(+t_preparation 2)
		(+cout 1)
		(+difficulte 1))
	(galettes_pomme_de_terre 20))

(galettes_legumes
	((appareil_galettes 12)
		(ratatouille 600)
		(+t_preparation 2)
		(+cout 1)
		(+difficulte 1))
	(galettes_legumes 20))

; XXX ratatouille !!


(glace_vanille
	((gousse_vanille 1)
		(lait 400)
		(jaune_oeuf 4)
		(sucre 75)
		(creme_liquide 150)
		(+materiel sorbetiere moule_rond)
		(+t_preparation 20)
		(+cout 1)
		(+difficulte )) ; XXX
	(glace_vanille 1000))

(vacherin
	((chantilly 250)
		(meringues 30)
		(glace_vanille 1000)
		(+materiel moule_rond)
		(+t_preparation 40)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile
	(vacherin 1))

(quiche_lorraine
	((pate_brisee 1)
		(appareil_omelette 1)
		(creme_fraiche_epaisse 200)
		(lardons 150)
		(fromage 100)
		(+materiel moule_a_tarte)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1)) ; XXX un peu difficile
	(quiche_lorraine 1))

(flammekueche
	((pate_brisee 1)
		(preparation_a_loignon 1)
		(creme_fraiche_epaisse 150)
		(lardons 200)
		(fromage 100)
		(+materiel papier_sulfurise)
		(+t_preparation 25)
		(+cout 1)
		(+difficulte 2)) ; XXX un peu difficile
	(flammekueche 1))

(pate_a_crepe
	((oeuf 4)
		(lait 500)
		(farine 250)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2)) ; XXX un peu difficile
	(pate_a_crepe 1))

(ficelle_picarde
	((sauce_bechamel 1)
		(pate_a_crepe 1)
		(gruyere 50)
		(champignon 150)
		(tranches_jambon 3)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1))
	(ficelle_picarde 3))

)