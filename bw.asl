/* The Blair Witch Volumes are three games written in the same engine (Nocturne)
   by three different developers. They all share a single page on speedrun.com
   and were all released in 2000.
   Volume 1: Rustin Parr                    [Terminal Reality]
   Volume 2: The Legend of Coffin Rock      [Human Head Studios]
   Volume 3: The Elly Kedward Tale          [Ritual Entertainment]
*/
state("nocturne", "Rustin Parr")
{
	string32 map: "nocturne.exe", 0x1BCF258;
    
    // All could be good candidates
    bool isLoading: "nocturne.exe", 0x191BD28;
    // bool isLoading: "nocturne.exe", 0x191BF4C;
    // bool isLoading: "nocturne.exe", 0x191BF6C;
    // bool isLoading: "nocturne.exe", 0x191C090;
}

state("blairwitch2", "Coffin Rock")
{
    // All could be good candidates (I believe these are the same values as in RP)
    bool isLoading: "blairwitch2.exe", 0x190300C;
    // bool isLoading: "blairwitch2.exe", 0x1903230;
    // bool isLoading: "blairwitch2.exe", 0x1903250;
    // bool isLoading: "blairwitch2.exe", 0x1903374; 
}

state("bw3", "Elly Kedward")
{
    bool isLoading: "bw3.exe", 0x1970AC4;
}

init 
{
    print("Nocturne game detected...");

    var mms = modules.First().ModuleMemorySize;
    print("MMS: " + mms.ToString("X"));

    // I'm not sure if other versions of each volume exist or could be used
    // for running
    switch(mms)
    {
        case 0x28BF000: 
            version = "Rustin Parr"; 
            vars.StartMap = "CHECKINROOM.geo";
            break;
        case 0x22A1000:
            version = "Coffin Rock";
            break;
        case 0x2945000:
            version = "Elly Kedward";
            break;
        default:
            version = "UNKNOWN";
            break;
    }

    print("Game \"" + version + "\" detected.");
}

update 
{
    if(version == "UNKNOWN") return;

    // Debug for testing
    if(version == "Rustin Parr" && current.map != old.map) 
    {
        print("map: " + old.map + " -> " + current.map);
    }

    if(old.isLoading != current.isLoading)
    {
        print("isLoading: " + old.isLoading + " -> " + current.isLoading);
    }
}

start 
{
    if(version == "Rustin Parr")
    {
        return old.isLoading && !current.isLoading  // If we just finished loading
            && current.map == vars.StartMap;        // and the current map is the first map of the run
    }
}

isLoading
{
    // Does not count loads that load the main menu, this is a separate
    // loading screen in all three games iirc
	return current.isLoading;
}

/*
RUSTIN PARR Map names:
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