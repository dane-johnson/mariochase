.PHONY: all
GarrysMod/maps/mc_nintendoland.bsp: Hammer/mc_nintendoland.bsp
	mkdir -p $(dir $@)
	cp $< $@
