
shared class Person(firstName, lastName, age, company, skills){
	
	shared String firstName;
	shared String lastName;
	shared String company;
	shared Integer age;
	shared Skill* skills;
	
	string => "Person ``firstName`` ``lastName`` (``company`` , ``age``):\n ``skills``\n";

	
	
}