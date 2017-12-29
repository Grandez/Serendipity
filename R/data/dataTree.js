/*
 Tipo:
     Por codigo para evitar OPNEN/CLOSE y las combinaciones
     ABCD
     A:
        GG - Grupo/Area
        GA - Aplicacioon
        GC - Modulo
        GI - Copy

        M___ CDM
        C___
        I___
 */
var areaTree = [
  {
    "id": 0,
    "text": "Raiz",
    "parent": "#",
    "data": {},
    "tipo": 0,
    "aplicaciones": 33,
    "modulos": 44
  }
  ,{
    "id": 10,
    "text": "Area 10",
    "parent": 0,
    "data": {},
    "tipo": 10,
    "aplicaciones": 33,
    "modulos": 44
  }
  ,{
     "id": 20,
     "text": "Area 20",
     "parent": 0,
     "data": {},
     "tipo": 10,
     "aplicaciones": 33,
     "modulos": 44
  }
  ,{
    "id": 101,
    "text": "Appl 101",
    "parent": 10,
    "data": {},
    "tipo": 20,
    "aplicaciones": 33,
    "modulos": 44
  }
  ,{
    "id": 102,
    "text": "Appl 102",
    "parent": 10,
    "data": {},
    "tipo": 20,
    "aplicaciones": 33,
    "modulos": 44
  }
  ,{
    "id": 201,
    "text": "Appl 201",
    "parent": 20,
     "data": {},
     "tipo": 20,
     "aplicaciones": 33,
     "modulos": 44
  }
  ,{
    "id": 202,
    "text": "Appl 202",
    "parent": 20,
    "data": {},
    "tipo": 20,
    "aplicaciones": 33,
    "modulos": 44
  }
  ,{
    "id": 1011,
    "text": "Modulo 1011",
    "parent": 101,
    "data": {},
    "tipo": 40,
     "aplicaciones": 33,
     "modulos": 44
  }
  ,{
    "id": 1012,
    "text": "Modulo 1012",
    "parent": 101,
    "data": {},
    "tipo": 41,
    "aplicaciones": 33,
    "modulos": 44
  }

  ,{
    "id": 1013,
    "text": "Modulo 1013",
    "parent": 101,
    "data": {},
    "tipo": 42,
    "aplicaciones": 33,
    "modulos": 44
  }
  ,{
    "id": 1014,
    "text": "Modulo 1013",
    "parent": 101,
    "data": {},
    "tipo": 43,
    "aplicaciones": 33,
    "modulos": 44
  }

];