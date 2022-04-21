state("nocturne")
{
	string32 geo: "nocturne.exe", 0x1BCF258;
	bool inGame: "nocturne.exe", 0x2899314;
}

init {
	print("INIT");	

    // The name of the first map, where to start.
    vars.StartMap = "CHECKINROOM.geo";

    /*
        Map names:
        CHECKINROOM.geo
        HQBW.geo
        BURKTOWN.geo
        ...
        ADD MORE HERE
    */
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

