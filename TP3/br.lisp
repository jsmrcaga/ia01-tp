; +t_preparation en minutes (sans compter cuisson ou refigération), cumulables
; +cout : ----> finalement, ne sert à rien
; + difficulte : 1 très facile, 2 facile, 3 un peu difficile/moyen, 4 difficile. Non-cumulable, on prend le maximum !
; +materiel : le cdr de ce champs en la liste du matos nécessaire
; +categorie : petit déj, entree, plat, gouter, dessert

; ingrédients solides en gr
; liquide en ml

; format des règles :
; (nom (liste d'ingrédients) qté)

(setq *BR* '(

; (oeuf
; 	((oeuf 1))
;	((jaune_oeuf 1)(blanc_oeuf 1))

	(sucre_glace
		((sucre 150)
		(moulin_a_cafe 1))
		150)

	(glacage_a_millefeuille
		((chocolat_noir 20)
			(fondant_blanc 150)
			(eau 20))
		170)

	(glacage_vanille
		((sucre_glace 100)
			(eau 40)
			(extrait_vanille 3))
		140)

	(glacage_chocolat
		((lait 60)
			(creme_au_beurre 500)
			(chocolat_noir 120))
		680)

	(pate_brisee
		((farine 250)
			(beurre 125)
			(sel 1)
			(jaune_oeuf 1)
			(+t_preparation 10)
			(+difficulte 1))
		1)

	(pate_sablee
		((farine 250)
			(beurre 125)
			(sel 1)
			(jaune_oeuf 1)
			(sucre 80)
			(+t_preparation 10)
			(+difficulte 2))
		1)

	(pate_feuilletee
		((farine 250)
			(eau 152)
			(sel 5)
			(sucre 185)
			(+t_preparation 45)
			(+difficulte 4))
		1)

	(creme_patissiere
		((lait 500)
			(gousse_vanille 1)
			(jaune_oeuf 4)
			(sucre 60)
			(maizena 20)
			(+t_preparation 15)
			(+difficulte 2))
		500)

	(creme_patissiere_chocolat
		((chocolat_noir 120)
			(creme_patissiere 500)
			(+t_preparation 5)
			(+difficulte 2))
		620)

	(pate_amande
		((poudre_amandes 150)
			(sucre_glace 150)
			(blanc_oeuf 4)
			(extrait_amande_amere 2)
			(+t_preparation 10)
			(+difficulte 2))
		300)

	(genoise
		((oeuf 3)
			(sucre 75)
			(farine 75)
			(extrait_vanille 5)
			(+t_preparation 15)
			(+difficulte 2))
		1)

	(genoise_chocolat
		((genoise 1)
			(poudre_cacao_amer 25)
			(+t_preparation 2)
			(+difficulte 2))
		1)

	(caramel_liquide
		((sucre 250)
			(jus_citron 20)
			(eau 150)
			(+t_preparation 2)
			(+difficulte 2))
		420) ; quantité ? -> p21

	(beurre
		((creme_liquide 200)
			(batteur_electrique 1)
			(passoire 1)
			(+t_preparation 15)
			(+difficulte 2))
		100)

	(creme_anglaise
		((gousse_vanille 1)
			(lait 400)
			(jaune_oeuf 4)
			(sucre 75)
			(film_alimentaire 1)
			(passoire 1)
			(+t_preparation 10)
			(+difficulte 2))
		500)

	(coulis_chocolat
		((chocolat_noir 200)
			(lait 100)
			(creme_liquide 150)
			(beurre 20)
			(+t_preparation 10)
			(+difficulte 2))
		500)

	(creme_au_beurre
		((eau 30)
			(sucre 125)
			(jaune_oeuf 3)
			(beurre 125)
			(+t_preparation 15)
			(+difficulte 3))
		500)

	(creme_chantilly
		((creme_liquide 250)
			(sucre_glace 30)
			(batteur_electrique 1)
			(+t_preparation 15)
			(+difficulte 2))
		250)

	(sauce_bechamel
		((beurre 20)
			(farine 20)
			(lait 200)
			(vin_blanc 50)
			(noix_muscade 1)
			(+t_preparation 15)
			(+difficulte 2))
		250)

	(pate_a_viennoiserie
		((levure_boulanger 20)
			(lait 125)
			(farine 500)
			(sucre 60)
			(sel 5)
			(eau 125)
			(beurre 300)
			(+t_preparation 80)
			(+difficulte 4))
		15)

	(croissants
		((pate_a_viennoiserie 15)
			(oeuf 1)
			(+t_preparation 10)
			(+difficulte 1)
			(+categorie petit_dejeuner))
		15)

	(pain_au_chocolat
		((pate_a_viennoiserie 15)
			(oeuf 1)
			(chocolat_noir 300)
			(+t_preparation 10)
			(+difficulte 1)
			(+categorie petit_dejeuner))
		15)



	(preparation_a_loignon
		((oignons 800)
			(beurre 20)
			(farine 10)
			(+t_preparation 10)
			(+difficulte 2))
		1)

	(tarte_a_loignon
		((pate_brisee 1)
			(preparation_a_loignon 1)
			(oeuf 3)
			(creme_liquide 200)
			(noix_muscade 1)
			(+t_preparation 15)
			(+difficulte 2)
			(+categorie entree))
		1)

	(appareil_omelette
		((oeuf 3); ? XXX
			(creme_liquide 100)
			(+t_preparation 5)
			(+difficulte 1))
		1)

	(omelette_aux_oignons
		((appareil_omelette 1)
			(preparation_a_loignon)
			(huile_olive 5)
			(+t_preparation 5)
			(+difficulte 1
			(+categorie plat)))
		2)

	(appareil_galettes
		((pomme_de_terre 500)
			(oignons 2)
			(persil 1)
			(appareil_omelette 1)
			(flocons_avoine 300)
			(farine 20)
			(huile_olive 5)
			(+t_preparation 10)
			(+difficulte 1))
		20)

	(galettes_pomme_de_terre
		((pomme_de_terre 500)
			(appareil_galettes 20)
			(+t_preparation 2)
			(+difficulte 1)
			(+categorie entree))
		20)

	(galettes_legumes
		((appareil_galettes 12)
			(ratatouille 600)
			(+t_preparation 2)
			(+difficulte 1)
			(+categorie entree))
		20)

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
			(+difficulte 3)
			(+categorie plat))
		1000)

	(glace_vanille
		((gousse_vanille 1)
			(lait 400)
			(jaune_oeuf 4)
			(sucre 75)
			(creme_liquide 150)
			(sorbetiere 1)
			(moule_rond 1)
			(+t_preparation 20)
			(+difficulte 3)
			(+categorie dessert))
		1000)

	(vacherin
		((creme_chantilly 250)
			(meringues 30)
			(glace_vanille 1000)
			(moule_rond 1)
			(+t_preparation 40)
			(+difficulte 3)
			(+categorie dessert))
		1)

	(quiche_lorraine
		((pate_brisee 1)
			(appareil_omelette 1)
			(creme_fraiche_epaisse 200)
			(lardons 150)
			(fromage 100)
			(moule_a_tarte 1)
			(+t_preparation 10)
			(+difficulte 2)
			(+categorie plat))
		1)

	(flammekueche
		((pate_brisee 1)
			(preparation_a_loignon 1)
			(creme_fraiche_epaisse 150)
			(lardons 200)
			(fromage 100)
			(papier_sulfurise 1)
			(+t_preparation 25)
			(+difficulte 3)
			(+categorie plat))
		1)

	(pate_a_crepe
		((oeuf 2)
			(lait 250)
			(farine 125)
			(+t_preparation 10)
			(+difficulte 2)
			(+categorie gouter))
		1)

	(ficelle_picarde
		((sauce_bechamel 1)
			(pate_a_crepe 2)
			(gruyere 50)
			(champignon 150)
			(tranches_jambon 3)
			(+t_preparation 10)
			(+difficulte 1)
			(+categorie plat))
		3)

	(appareil_clafoutis
		((appareil_omelette 1)
			(beurre 10)
			(farine 130)
			(lait 500)
			(+t_preparation 5)
			(+difficulte 2))
		1)

	(clafoutis_tomates_cerises
		((creme_liquide 200)
			(tomates_cerises 400)
			(parmesan 50)
			(appareil_clafoutis 1)
			(+t_preparation 5)
			(+difficulte 2)
			(+categorie plat))
		1)

	(clafoutis_cerises
		((sucre 100)
			(cerises 500)
			(appareil_clafoutis 1)
			(+t_preparation 5)
			(+difficulte 2)
			(+categorie dessert))
		1)

	(buchettes_fromage
		((pate_feuilletee 1)
			(jaune_oeuf 1)
			(beurre 10)
			(fromage 70)
			(sauce_bechamel 1)
			(maizena 5)
			(rouleaux_en_fer 1)
			(pinceau_alimentaire 1)
			(+t_preparation 30)
			(+difficulte 2)
			(+categorie plat))
		1)

	(puree
		((pomme_de_terre 400)
			(huile_olive 5)
			(lait 150)
			(+t_preparation 5)
			(+difficulte 2)
			(+categorie plat))
		400)

	(brandade_morue
		((morue_salee 400)
			(puree 400)
			(gousse_ail 1)
			(jus_citron 5)
			(+t_preparation 10)
			(+difficulte 2)
			(+categorie plat))
		2)

	(mascarpone
		((creme_liquide 500)
			(jus_citron 30)
			(thermometre_cuisine 1)
			(passoire 1)
			(gaze 1)
			(+t_preparation 15)
			(+difficulte 4)
			(+categorie fromage))
		500)

	(ricotta
		((lait 1000)
			(creme_liquide 100)
			(jus_citron 30)
			(sel 3)
			(thermometre_cuisine 1)
			(gaze 1)
			(passoire 1)
			(+t_preparation 20)
			(+difficulte 4)
			(+categorie fromage))
		300)

	(meringues
		((blanc_oeuf 2)
			(sucre 120)
			(extrait_vanille 2)
			(poche_a_douille 1)
			(batteur_electrique 1)
			(+t_preparation 15)
			(+difficulte 2)
			(+categorie gouter))
		30)

	(biscuits_a_la_cuiller
		((oeuf 3)
			(farine 50)
			(sucre 50)
			(sucre_glace 60)
			(poche_a_douille 1)
			(batteur_electrique 1)
			(+t_preparation 10)
			(+difficulte 2)
			(+categorie gouter))
		25)

	(pate_a_choux
		((eau 250)
			(sucre 20)
			(beurre 100)
			(farine 150)
			(oeuf 4)
			(+t_preparation 15)
			(+difficulte 2))
		500)

	(chouquettes
		((grains_de_sucre 50)
			(pate_a_choux 500)
			(oeuf 1) ; pour la dorure
			(+t_preparation 5)
			(+difficulte 2)
			(+categorie gouter))
		50)

	(eclairs_vanille
		((pate_a_choux 500)
			(creme_patissiere 500) ; fourrage vanille
			(glace_vanille 140)
			(oeuf 1) ; pour la dorure
			(poche_a_douille 1)
			(papier_sulfurise 1)
			(plaque_de_four 1)
			(+t_preparation 60)
			(+difficulte 3)
			(+categorie gouter))
		20)

	(religieuse_au_chocolat
		((glacage_chocolat 680)
			(chouquettes 50)
			(creme_patissiere_chocolat 620)
			(poche_a_douille 1)
			(+t_preparation 30)
			(+difficulte 3)
			(+categorie dessert))
		8)

	(profiteroles
		((glace_vanille 1000)
			(chouquettes 50)
			(coulis_chocolat 500)
			(+t_preparation 30)
			(+difficulte 3)
			(+categorie dessert))
		8)

	(paris_brest
		((creme_patissiere 500)
			(beurre 200)
			(praline 120)
			(pate_a_choux 500)
			(oeuf 1)
			(amandes_effilees 50)
			(+t_preparation 30)
			(+difficulte 3)
			(+categorie dessert))
		8)

	(sirop_orange
		((orange 1)
			(beurre 125)
			(sucre 75)
			(Grand_Marnier 80)
			(+t_preparation 5)
			(+difficulte 2))
		400)

	(crepes_suzette
		((pate_a_crepe 1)
			(sucre 5)
			(beurre 25)
			(sirop_orange 400)
			(+t_preparation 5)
			(+difficulte 2)
			(+categorie dessert))
		12)

	(iles_flottantes
		((creme_anglaise 500)
			(lait 250)
			(blanc_oeuf 5)
			(sucre 15)
			(caramel_liquide 420)
			(batteur_electrique 1)
			(coupelles 1)
			(+t_preparation 15)
			(+difficulte 4)
			(+categorie dessert))
		6)

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
			(+difficulte 2)
			(+categorie dessert))
		6)

	(foret_noire
		((creme_chantilly 500)
			(genoise_chocolat 2)
			(cerises_au_sirop 800)
			(kirsh 50)
			(chocolat_noir 100)
			(moule_a_manque 1)
			(+t_preparation 50)
			(+difficulte 2)
			(+categorie dessert))
		8)

	(brownie_chocolat
		((beurre 175)
			(sucre 150)
			(oeuf 2)
			(farine 125)
			(chocolat_noir 100)
			(moule_carre 1)
			(+t_preparation 10)
			(+difficulte 2)
			(+categorie dessert))
		4)

	(brownie_marbré_chocolat_ricotta
		((brownie_chocolat 4)
			(ricotta 300)
			(oeuf 1)
			(sucre 40)
			(moule_carre 1)
			(+t_preparation 10)
			(+difficulte 2)
			(+categorie dessert))
		6)

	(biscuits_sables
		((blanc_oeuf 1)
			(extrait_vanille 3)
			(sucre 40)
			(pate_sablee 1)
			(plaque_de_four 1)
			(+t_preparation 20)
			(+difficulte 1)
			(+categorie dessert))
		50) ; XXX attention ! yen a besoin que de 3 pr le cheesecake !

	(appareil_chocolat
		((chocolat_noir 200)
			(mascarpone 250) ; XXX 2x moins que la recette de base
			(fromage_blanc 150)
			(oeuf 4)
			(sucre 100)
			(noix_de_coco_rapee 50))
		1)

	(base_croustillante_noix_de_coco
		((biscuits_sables 8)
			(noix_de_coco_rapee 45)
			(beurre 90))
		6)

	(cheesecake_chocolat_noix_de_coco
		((base_croustillante_noix_de_coco 6)
			(appareil_chocolat 1)
			(moule_rond 1)
			(rouleau_a_patisserie 1)
			(+t_preparation 25)
			(+difficulte 2)
			(+categorie dessert))
		6)

	(millefeuille
		((pate_feuilletee 1)
			(creme_patissiere 500)
			(glacage_a_millefeuille 170)
			(+t_preparation 45)
			(+difficulte 3)
			(+categorie dessert))
		6)

	(sirop_framboise
		((gelee_framboise 150)
			(eau 200)
			(liqueur_framboise 20))
		370)

	(framboisier
		((creme_patissiere 500)
			(genoise 1)
			(sirop_framboise 370)
			(framboises 200)
			(pate_amande 200)
			(+t_preparation 60)
			(+difficulte 3)
			(+categorie dessert))
		8)

	(tarte_aux_fraises
		((creme_patissiere 500)
			(pate_sablee 1)
			(fraises 500)
			(gelee_fruits_rouges 50)
			(eau 20)
			(moule_a_tarte 1)
			(papier_sulfurise 1)
			(pinceau_alimentaire 1)
			(+t_preparation 20)
			(+difficulte 2)
			(+categorie dessert))
		8)

	(appareil_citron
		((citron 4)
			(maizena 15)
			(sucre 250)
			(oeuf 4)
			(beurre 80))
		1)

	(tarte_au_citron_meringuee
		((pate_sablee 1)
			(meringues 30)
			(appareil_citron 1)
			(+t_preparation 20)
			(+difficulte 2)
			(+categorie dessert))
		8)

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
			(+difficulte 2)
			(+categorie dessert))
		8)


	)

)