/obj/item/clothing/overwear/coat/winter
	name = "winter coat"
	icon = 'icons/obj/items/clothing/suit/winter_coat.dmi'

	defense_rating = list(
		BLADE = 15,
		BLUNT = 10,
		PIERCE = 10,
		LASER = -15,
		MAGIC = 25,
		HEAT = -75,
		COLD = 75
	)

	protection_cold = list(
		BODY_TORSO = 5,
		BODY_ARM_LEFT = 4,
		BODY_ARM_RIGHT = 4,
		BODY_GROIN = 2
	)

	additional_clothing = list(/obj/item/clothing/head/hood/winter)

	size = SIZE_3
	weight = WEIGHT_3

	value = 20

/obj/item/clothing/overwear/coat/winter/bomber
	name = "bomber jacket"
	desc = "Wait this actually protects agains bombs what the fuck."
	icon = 'icons/obj/items/clothing/suit/bomberjacket.dmi'
	additional_clothing = list() // no hood

	defense_rating = list(
		BLADE = 10,
		BLUNT = 15,
		PIERCE = 10,
		LASER = -10,
		MAGIC = 10,
		HEAT = -15,
		COLD = 50,
		BOMB = 25
	)

	size = SIZE_3
	weight = WEIGHT_3

	value = 20