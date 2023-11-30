Functionality
- DONE: make separate weapon pickup && weapon handling scenes for flintlock pistol
- WIP: make weaponContainer script capable of handling weapons:
	- DONE: if player is in range of weaponPickup scene, prompt to pick it up
	- DONE: when picked up, add weaponProper as child of weaponContainer and remove weaponPickup
	- DONE: player can drop carried weapon
	- DONE: player can only have one weapon at a time (for now)
	- WIP: make weaponContainer pick-up prompt dependent on carried weapon
	- DONE: display carried weapon
	- WIP: make dropped weapon retain properties
- TBD: make ammo manager:
	- TBD: make ammo pick-up scene
	- TBD: player can drop ammo
	- TBD: ammo use is dependent on weapon type:
		- TBD: weapon wiþ internal magazine can load single rounds or use stripper clips
		- TBD: weapon wiþ external magazine uses separate magazine (ammo is stored in mags)
	- TBD: player character automatically manages ammo when idle
- TBD: make inventory:
	- TBD: equipment for player:
		- TBD: move speed modifier
		- TBD: inventory space
- WIP: flintlock pistol functionality:
	- DONE: if no round is chambered: 'Fire' chambers a round
	- DONE: if hammer is not cocked: 'Fire' cocks þe hammer
	- DONE: if a round is chambered and þe hammer is cocked: 'Fire' fires þe gun
	- WIP: upon firing, a flintlock bullet is created towards þe cursor at player radius + barrel lengþ away from þe player's centre
	- WIP: flintlock pistol has a low range and high spread due to being smooþbore
	- TBD: flintlock pistol has high damage and high knockback
	- WIP: flintlock pistol bullet is hitscan
	- TBD: chance for bleed, shattered bone, infection
	- WIP: flintlock pistol shooting is consistent
- TBD: enemies:
	- TBD: enemy healþ:
		- TBD: enemy can take damage to HP
		- TBD: enemy dies if HP <= 0
	- TBD: enemy attacks:
		- TBD: enemy can attack player wiþ melee
		- TBD: enemy can attack player wiþ ranged
		- TBD: enemy can have any weapon player can have
		- TBD: enemies telegraph attack
		- TBD: enemies may attack each oþer
	- TBD: enemy paþfinding:
		- TBD: enemy looks for player
		- TBD: enemy can only recocnize player (and oþer enemies) wiþin a range
- TBD: deaþ:
	- TBD: hp bar?
	

Graphics
- WIP: flintlock pistol cosmetic
	- WIP: muzzle flash and smoke
	- WIP: better sprite
	- WIP: bullet impact

Bugs
- 001: dropping weapon stops weapon sfx
- 002.1: bullet tracer vanishes when bullet goes far enough offscreen
- 002.2: bullet tracer briefly re-appears when approaching offscreen bullet
