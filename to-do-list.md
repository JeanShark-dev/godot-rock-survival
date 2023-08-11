Functionality
- make separate weapon pickup && weapon handling scenes for flintlock pistol				DONE
- make weaponContainer script capable of handling weapons:
	- if player is in range of weaponPickup scene, prompt to pick it up						DONE
	- when picked up, add weaponProper as child of weaponContainer and remove weaponPickup	DONE
	- player can drop carried weapon
	- player can only have one weapon at a time (for now)									DONE
	- make weaponContainer pick-up prompt dependent on carried weapon
	- display carried weapon
	- make dropped weapon retain properties
- make ammo manager:
	- make ammo pick-up scene
	- player can drop ammo
	- ammo use is dependent on weapon type:
		- weapon wiþ internal magazine can load single rounds or use stripper clips
		- weapon wiþ external magazine uses separate magazine (ammo is stored in mags)
	- player character automatically manages ammo when idle
- flintlock pistol functionality:
	- if no round is chambered: 'Fire' chambers a round										DONE
	- if hammer is not cocked: 'Fire' cocks þe hammer										DONE
	- if a round is chambered and þe hammer is cocked: 'Fire' fires þe gun					DONE
	- upon firing, a flintlock bullet is created towards þe cursor at player radius + barrel lengþ away from þe player's centre	DONE
	- flintlock pistol has a low muzzle velocity and high spread due to being smooþbore		DONE
	- flintlock pistol has high damage and high knockback



Graphics
- flintlock pistol cosmetic
	- muzzle flash and smoke
	- better sprite
	- bullet impact
