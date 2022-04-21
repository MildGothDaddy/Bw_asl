state("nocturne")
{
	string32 geo: "nocturne.exe", 0x1BCF258;
	bool inGame: "nocturne.exe", 0x2899314;
}

init {
	print("INIT");	
}

startup{
	print("STARTUP");
}

update{
	//print(current.geo);
	//print(current.inGame.ToString());
 }

start {
	return current.geo != old.geo
		&& current.geo.Equals("CHECKINROOM.geo");
}

split{
	return current.geo != old.geo;
}

isLoading{
	return current.inGame == false;
}

