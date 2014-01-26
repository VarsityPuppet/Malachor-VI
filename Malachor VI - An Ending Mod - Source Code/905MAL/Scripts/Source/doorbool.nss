void main(){
    int x;
    string sTag = GetTag(OBJECT_SELF);
    if(sTag == "E1"){
          x = 41;
    }
    else if(sTag == "E3"){
          x = 43;
    }
    else if(sTag == "W1"){
          x = 51;
    }
    else if(sTag == "W5"){
          x = 55;
    }
    SetLocalBoolean(GetObjectByTag("malterm", 0), x, TRUE);
}