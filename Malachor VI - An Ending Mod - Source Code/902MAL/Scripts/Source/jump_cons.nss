
void main() {


	AssignCommand(GetObjectByTag("Remote"), ActionJumpToObject(GetObjectByTag("wp_cons_rem")));
	AssignCommand(GetFirstPC(), ActionJumpToObject(GetObjectByTag("wp_cons_pc")));
			
}