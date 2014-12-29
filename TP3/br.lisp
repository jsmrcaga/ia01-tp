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

(glacage
	((sucre_glace 100)
		(eau 40))
	(glacage 140))

(glacage_a_millefeuille
	((chocolat_noir 20)
		(fondant_blanc 150)
		(eau 20))
	(glacage 170))

(glacage_vanille
	((glacage 140)
		(extrait_vanille 3))
	(glacage_vanille 140))

(glacage_chocolat
	((lait 60)
		(creme_au_beurre 500)
		(chocolat_noir 120))
	(glacage_chocolat 680))

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

(creme_patissiere_chocolat
	((chocolat_noir 120)
		(creme_patissiere 500)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(creme_patissiere_chocolat 620))

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
	((oeuf 3)
		(sucre 75)
		(farine 75)
		(extrait_vanille 5)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(genoise 1))

(genoise_chocolat
	((genoise 1)
		(poudre_cacao_amer 25)
		(+t_preparation 2)
		(+cout 1)
		(+difficulte 2))
	(genoise_chocolat 1))

(caramel_liquide
	((sucre 250)
		(jus_citron 20)
		(eau 150)
		(+t_preparation 2)
		(+cout 1)
		(+difficulte 2))
	(caramel_liquide 420)) ; quantité ? -> p21

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

(ratatouille
	((aubergine 175)
		(courgette 175)
		(poivron 175)
		(oignons 175)
		(tomates 250)
		(gousse_ail 2)
		(huile_olive 60)
		(brin_thym 1)
		(feuille_laurier 1)
		(+t_preparation 25)
		(+cout 1)
		(+difficulte 3))
	(ratatouille 1000))

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
	((creme_chantilly 250)
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
	((oeuf 2)
		(lait 250)
		(farine 125)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2)) ; XXX un peu difficile
	(pate_a_crepe 1))

(ficelle_picarde
	((sauce_bechamel 1)
		(pate_a_crepe 2)
		(gruyere 50)
		(champignon 150)
		(tranches_jambon 3)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 1))
	(ficelle_picarde 3))

(appareil_clafoutis
	((appareil_omelette 1)
		(beurre 10)
		(farine 130)
		(lait 500)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(appareil_clafoutis 1))

(clafoutis_tomates_cerises
	((creme_liquide 200)
		(tomates_cerises 400)
		(parmesan 50)
		(appareil_clafoutis 1)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(clafoutis_tomates_cerises 1))

(clafoutis_cerises
	((sucre 100)
		(cerises 500)
		(appareil_clafoutis 1)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(clafoutis_cerises 1))

(buchettes_fromage
	((pate_feuilletee 1)
		(jaune_oeuf 1)
		(beurre 10)
		(fromage 70)
		(sauce_bechamel)
		(maizena 5)
		(+materiel rouleaux_en_fer pinceau_alimentaire)
		(+t_preparation 30)
		(+cout 1)
		(+difficulte 2))
	(buchettes_fromage 1))

(puree
	((pomme_de_terre 400)
		(huile_olive 5)
		(lait 150)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(puree 400))

(brandade_morue
	((morue_salee 400)
		(puree 400)
		(gousse_ail 1)
		(jus_citron 5)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(brandade_morue 2))

(mascarpone
	((creme_liquide 500)
		(jus_citron 30)
		(+materiel thermometre_cuisine passoire gaze)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte )) ; XXX difficile
	(mascarpone 500))

(ricotta
	((lait 1000)
		(creme_liquide 100)
		(jus_citron 30)
		(sel 3)
		(+materiel thermometre_cuisine passoire gaze)
		(+t_preparation 20)
		(+cout 1)
		(+difficulte )) ; XXX difficile
	(ricotta 300))

(meringues
	((blanc_oeuf 2)
		(sucre 120)
		(extrait_vanille 2)
		(+materiel poche_a_douille batteur_electrique)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(meringues 30))

(biscuits_a_la_cuiller
	((oeuf 3)
		(farine 50)
		(sucre 50)
		(sucre_glace 60)
		(+materiel poche_a_douille batteur_electrique)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(biscuits_a_la_cuiller 25))

(pate_a_choux
	((eau 250)
		(sucre 20)
		(beurre 100)
		(farine 150)
		(oeuf 4)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte 2))
	(pate_a_choux 500))

(chouquettes
	((grains_de_sucre 50)
		(pate_a_choux 500)
		(oeuf 1) ; pour la dorure
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(chouquettes 50))

(eclairs_vanille
	((pate_a_choux 500)
		(creme_patissiere 500) ; fourrage vanille
		(glace_vanille 140)
		(oeuf 1) ; pour la dorure
		(+materiel poche_a_douille plaque_de_four papier_sulfurise)
		(+t_preparation 60)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile (<=> moyen ?)
	(eclairs_vanille 20))

(religieuse_au_chocolat
	((glacage_chocolat 680)
		(pate_a_choux 500)
		(creme_patissiere_chocolat 620)
		(+materiel poche_a_douille)
		(+t_preparation 30)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile
	(religieuse_au_chocolat 8))

(profiteroles
	((glace_vanille 1000)
		(pate_a_choux 500)
		(coulis_chocolat 500)
		(+t_preparation 30)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile
	(profiteroles 8))

(paris_brest
	((creme_patissiere 500)
		(beurre 200)
		(praline 120)
		(pate_a_choux 500)
		(oeuf 1)
		(amandes_effilees 50)
		(coulis_chocolat 500)
		(+t_preparation 30)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile
	(paris_brest 8))

(sirop_orange
	((orange 1)
		(beurre 125)
		(sucre 75)
		(Grand_Marnier 80)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(sirop_orange 400))

(crepes_suzette
	((pate_a_crepe 1)
		(sucre 5)
		(beurre 25)
		(sirop_orange 400)
		(+t_preparation 5)
		(+cout 1)
		(+difficulte 2))
	(crepes_suzette 12))

(iles_flottantes
	((creme_anglaise 500)
		(lait 250)
		(blanc_oeuf 5)
		(sucre 15)
		(caramel_liquide 420)
		(+materiel batteur_electrique coupelles)
		(+t_preparation 15)
		(+cout 1)
		(+difficulte )) ; XXX difficile
	(iles_flottantes 6))

(tiramisu
	((mascarpone 500)
		(biscuits_a_la_cuiller 25)
		(blanc_oeuf 3)
		(jaune_oeuf 5)
		(sucre 150)
		(cafe 100)
		(marsala 40)
		(poudre_cacao_amer 10)
		(+t_preparation 20)
		(+cout 1)
		(+difficulte 2))
	(tiramisu 6))

(foret_noire
	((creme_chantilly 500)
		(genoise_chocolat 2)
		(cerises_au_sirop 800)
		(kirsh 50)
		(chocolat_noir 100)
		(+materiel moule_a_manque)
		(+t_preparation 50)
		(+cout 1)
		(+difficulte 2))
	(foret_noire 8))

(brownie_chocolat
	((beurre 175)
		(sucre 150)
		(oeuf 2)
		(farine 125)
		(chocolat_noir 100)
		(+materiel moule_carre)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(brownie_chocolat 4))

(brownie_marbré_chocolat_ricotta
	((brownie_chocolat 4)
		(ricotta 300)
		(oeuf 1)
		(sucre 40)
		(+materiel moule_carre)
		(+t_preparation 10)
		(+cout 1)
		(+difficulte 2))
	(brownie_marbré_chocolat_ricotta 6))

(biscuits_sables
	((blanc_oeuf 1)
		(extrait_vanille 3)
		(sucre 40)
		(pate_sablee 1)
		(+materiel plaque_de_four)
		(+t_preparation 20)
		(+cout 1)
		(+difficulte 1))
	(biscuits_sables 50)) ; XXX attention ! yen a besoin que de 3 pr le cheesecake !

(appareil_chocolat
	((chocolat_noir 200)
		(mascarpone 250) ; XXX 2x moins que la recette de base
		(fromage_blanc 150)
		(oeuf 4)
		(sucre 100)
		(noix_de_coco_rapee 50))
	(appareil_chocolat 1))

(base_croustillante_noix_de_coco
	((biscuits_sables 8)
		(noix_de_coco_rapee 45)
		(beurre 90))
	(base_croustillante_noix_de_coco 6))

(cheesecake_chocolat_noix_de_coco
	((base_croustillante_noix_de_coco 6)
		(appareil_chocolat 1)
		(+materiel moule_rond rouleau_a_patisserie)
		(+t_preparation 25)
		(+cout 1)
		(+difficulte 2))
	(cheesecake_chocolat_noix_de_coco 6))

(millefeuille
	((pate_feuilletee 1)
		(creme_patissiere 500)
		(glacage_a_millefeuille 170)
		(+t_preparation 45)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile
	(millefeuille 6))

(sirop_framboise
	((gelee_framboise 150)
		(eau 200)
		(liqueur_framboise 20))
	(sirop_framboise 370))

(framboisier
	((creme_patissiere 500)
		(genoise 1)
		(sirop_framboise 370)
		(framboises 200)
		(pate_amande 200)
		(+t_preparation 60)
		(+cout 1)
		(+difficulte )) ; XXX un peu difficile
	(framboisier 8))

(tarte_aux_fraises
	((creme_patissiere 500)
		(pate_sablee 1)
		(fraises 500)
		(gelee_fruits_rouges 50)
		(eau 20)
		(+materiel moule_a_tarte pinceau_alimentaire papier_sulfurise)
		(+t_preparation 20)
		(+cout 1)
		(+difficulte 2))
	(tarte_aux_fraises 8))

(appareil_citron
	((citron 4)
		(maizena 15)
		(sucre 250)
		(oeuf 4)
		(beurre 80))
	(appareil_citron 1))

(tarte_au_citron_meringuee
	((pate_sablee 1)
		(meringues 30)
		(appareil_citron 1)
		(+t_preparation 20)
		(+cout 1)
		(+difficulte 2))
	(tarte_au_citron_meringuee 8))

(tarte_a_la_rhubarbe_meringuee
	((pate_sablee 1)
		(meringues 30)
		(rhubarbe 1000)
		(sucre 110)
		(oeuf 1)
		(jaune_oeuf 1)
		(creme_liquide 15)
		(farine 15)
		(+t_preparation 25)
		(+cout 1)
		(+difficulte 2))
	(tarte_a_la_rhubarbe_meringuee 8))






)