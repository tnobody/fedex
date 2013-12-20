
shared class Skill(name, level) {
	
	shared String name;
	shared Integer level;
	
	Boolean isValid() => level >= 0 && level <=5; 
	
	shared actual String string {
		if (isValid()){
			return "``name`` - Level ``level``"; 
		}
		return "";
	}	
	
	
	
}