import com.consol.skillapp.model { Person, Skill }
"Run the module `app`."
shared void run() {
	
	
	Person p = Person("Tobias","Schneck",26,"ConSol* Software", *{Skill("Java", 5), Skill("Ceylon", 0)});
	
	
	Person p2 = Person{firstName = "Tobias";
						lastName = "Schneck";
					age = 26;
				company = "ConSol* Software";
				//skills = *{Skill("Java", 5), Skill("Ceylon", 0)};
	};
			
				print({p,p2});
			
    
}