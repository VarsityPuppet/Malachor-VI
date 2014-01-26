float Deg(float fRad = 0.0){ //Converts radians to degrees
	float fDeg = (fRad * 180.0 / PI);
	return fDeg;
}

float Rad(float fDeg = 0.0){ //Converts degrees to radians
	float fRad = (fDeg / 180.0 * PI);
	return fRad;
}

void SpawnObject(int nObjectType, string sTemplate, location lLocation, int bUseAppearAnimation=FALSE){
	CreateObject(nObjectType, sTemplate, lLocation, bUseAppearAnimation);
}

string TrimLine(string sString){ //Trims the line of the last character, which should be the one that starts a new line, which is there after using Int/FloatToString()
	return GetStringLeft(sString, GetStringLength(sString) - 1);
}

string NewLineChar(){
	return GetStringRight(FloatToString(0.0, 2, 2), 1);
}
string NEW_LINE = NewLineChar();

float RandomFloat(int n=2, float fMax=1.0, float fMin=0.0){ //Gets a random float between two floats with n decimal places
	float Malo = fMin;
	if(fMin>fMax) Malo=fMax;
	float fRandom = Malo + Random(FloatToInt(fabs(fMax-fMin)*(10^n)))/(10^n);
	return fRandom;
}

float RandomInt(int n=2, int iMax=1, int iMin=0){ //Gets a random float between two integers with n decimal places
	int Malo = iMin;
	if(iMin>iMax) Malo=iMax;
	float fRandom = IntToFloat(Malo) + IntToFloat(Random(FloatToInt(abs(iMax-iMin)*IntToFloat(10^n))))/IntToFloat(10^n);
	return fRandom;
}

int ChooseRandom10(int i0=-101010, int i1=-101010, int i2=-101010, int i3=-101010, int i4=-101010, int i5=-101010, int i6=-101010, int i7=-101010, int i8=-101010, int i9=-101010){//Randomly chooses a number from the maximum of ten numbers you specify.
	int iReturn;
	int j0 = 0;
	int j1 = 0;
	int j2 = 0;
	int j3 = 0;
	int j4 = 0;
	int j5 = 0;
	int j6 = 0;
	int j7 = 0;
	int j8 = 0;
	int j9 = 0;

	if(i0 != -101010) j0 = 1;
	else iReturn = 0;
	if(i1 != -101010) j1 = 1;
	if(i2 != -101010) j2 = 1;
	if(i3 != -101010) j3 = 1;
	if(i4 != -101010) j4 = 1;
	if(i5 != -101010) j5 = 1;
	if(i6 != -101010) j6 = 1;
	if(i7 != -101010) j7 = 1;
	if(i8 != -101010) j8 = 1;
	if(i9 != -101010) j9 = 1;

	switch(Random(j0+j1+j2+j3+j4+j5+j6+j7+j8+j9-1)){
		case 0:
			iReturn = i0;
		break;
		case 1:
			iReturn = i1;
		break;
		case 2:
			iReturn = i2;
		break;
		case 3:
			iReturn = i3;
		break;
		case 4:
			iReturn = i4;
		break;
		case 5:
			iReturn = i5;
		break;
		case 6:
			iReturn = i6;
		break;
		case 7:
			iReturn = i7;
		break;
		case 8:
			iReturn = i8;
		break;
		case 9:
			iReturn = i9;
		break;
	}
	return iReturn;
}