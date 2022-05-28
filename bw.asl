state("nocturne")
{
	string32 geo: "nocturne.exe", 0x1BCF258;
	bool inGame: "nocturne.exe", 0x2899314;
}

init {
	print("INIT");	

    // The name of the first map, where to start.
    vars.StartMap = "CHECKINROOM.geo";
}

startup {
	print("STARTUP");
}

update {
    // Debug for testing when the map changes
    if(current.geo != old.geo) {
        print("PREVIOUS MAP: " + old.geo);
        print("CURRENT MAP: " + current.geo);
        print("");
    }
}

start {
	return current.geo != old.geo               // If the map has changed
		&& current.geo.Equals(vars.StartRoom);  // And the current map is the first map of the run
}

split {
	return current.geo != old.geo;              // Split when we change maps
}

isLoading{
	return current.inGame == false;
}

/*
Map names:
Prologue
CHECKINROOM (spawn room)
HQBW (headquarters)

Day 1
BURKTOWN (main town)
M1INSIDE (inn keeper)
M2INSIDE (your motel room)
BURKTOWN
DNINSIDE (diner)
M2INSIDE
BURKTOWN
THALLINSIDE (town hall)
BURKTOWN
CHINSIDE (church)
BURKTOWN

Day 2
M2INSIDE
BURKTOWN
THALLINSIDE
BURKTOWN
DNINSIDE
BURKTOWN
THALLINSIDE
SCHINSIDE (school)
BURKTOWN
M2INSIDE
BURKTOWN
RWHOUSE (path between town and forest)
TOWNLOOP (forest entrance section)
GENLOOP (bottom right forest)
AZLOOP (asgaya/middle forest)
PARRLOOP (left forest)
PARRHOUSE (parrs house)
PARRLOOP
DKPLOOP (nighttime forest)
PARRLOOP
GENLOOP
AZLOOP
AZCABIN (asgaya cabin)
AZLOOP
PARRLOOP
AZLOOP
GENLOOP
TOWNLOOP
BURKTOWN (loading screen???)
RWHOUSE

Day 3
M2INSIDE
BURKTOWN
M1INSIDE
BURKTOWN
LIBINSIDE (library)
BURKTOWN
M1INSIDE
BURKTOWN
M2INSIDE
BURKTOWN
RWHOUSE
TOWNLOOP
GENLOOP
AZLOOP
AZCABIN
AZLOOP
PARRLOOP
NEVLOOP (forest after parrs twana)
NEVURGIVN (parrs house after parrs twana)
NEVLOOP
PARRLOOP
DKPLOOP
GENLOOP
AZLOOP
AZCABIN
AZLOOP
PARRLOOP
AZLOOP
AZCABIN
AZLOOP
GENLOOP
TOWNLOOP

Day 4
BURKTOWN
SCHINSIDE
BURKTOWN
CHINSIDE
BURKTOWN
RWHOUSE
BURKTOWN
RWHOUSE
TOWNLOOP
GENLOOP
AZLOOP
AZCABIN
AZLOOP
PARRLOOP
CHOONLOOP (final section)
PARRLOOP (cutscenes before credits)
*/