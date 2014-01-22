tmplAccidente="""{
    "id": "{{id}}",
    "id_unico": "{{id_unico}}",
    "croquis": "{{acc_croquis}}",
    "observaciones": "{{acc_observaciones}}",
    "investigaciones": "{{acc_investigaciones}}",
    "folio_accidente": "{{acc_folio_accidente}}",
    "delegacion": "{{acc_delegacion}}",
    "comandancia": "{{acc_comandancia}}",
    "turno": "{{acc_turno}}",
    "fecha": "{{acc_fecha}}",
    "hora": "{{acc_hora}}",
    "clasificacion": "{{acc_clasificacion}}",
    "tipo_choque": "{{acc_tipo_choque}}",
    "latitud": "{{acc_latitud}}",
    "longitud": "{{acc_longitud}}",
    "calle1": "{{acc_calle1}}",
    "calle2": "{{acc_calle2}}",
    "calle3": "{{acc_calle3}}",
    "frentea": "{{acc_frentea}}",
    "colonia": "{{acc_colonia}}",
    "estado": "{{acc_estado}}",
    "municipio": "{{acc_municipio}}",
    "simbologia_croquis": "{{acc_simbologia_croquis}}",
    "danos": [
    {% for dano in  acc_danos %}
      {% if forloop.counter0 > 0  %}
        ,
      {% endif %}
      {
        "obj": "{{dano.id_objeto}}",
        "tipo": "{{dano.tipo_objeto}}",
        "dueno": "{{dano.dueno_objeto}}",
        "monto": "{{dano.mongo_dano}}"
        }
       
    {%endfor%}
       
    ],
    "estado_calles": {
      "alineacion": "{{estado_calles_alineacion}}",
      "estado_pavimento": "{{estado_calles_estado_pavimento}}",
      "clima": "{{estado_calles_clima}}",
      "regulacion": "{{estado_calles_regulacion}}"
    },
    "otros": {
      "parte_dia": "{{otros_parte_dia}}",
      "tipo_calle": "{{otros_tipo_calle}}",
      "no_carriles": "{{otros_no_carriles}}",
      "sentido_calle": "{{otros_sentido_calle}}"
    },
    "articulos": [
    {% for art in acc_articulos %}
     {% if forloop.counter0 > 0 %}
        ,
       {% endif %}
    {
    "ART":"{{art.articulo}}",
    "FRACC":"{{art.parrafo}}",
    "DESCC":"{{art.concepto}}"
    }
   {%endfor%}
    ],
    "fotos":[
      {% for foto in acc_fotos %}
      {% if forloop.counter0 > 0 %}
        ,
       {% endif %}
       "{{foto}}"
       {%endfor%}
   
    ],
    "superviso": {
     "nombre": "{{nombre_superviso}}",
      "gafete": "{{gafete_supervisoe}}",
      "unidad": "{{unidad_superviso}}",
      "sector": "{{sector_superviso}}"
    },
    "intervino": {
      "nombre": "{{nombre_intervino}}",
      "gafete": "{{gafete_intervino}}",
      "unidad": "{{unidad_intervino}}",
      "sector": "{{sector_intervino}}"
    },
    "competenciaJudiciales": [
    {% for judicial in acc_competenciaJudiciales %}
       {% if forloop.counter0 > 0 %}
        ,
       {% endif %}
      {
        "nombre": "{{judicial.nombre}} {{judicial.conductor_apepaterno}}  {{judicial.conductor_apematerno}}",
        "edad": "{{judicial.edad}}",
        "domicilio":"{{judicial.calle}}",
        "se_encontraba":"{{judicial.intervino_como}}",
        "estado_herido":"{{judicial.estado_herido}}",
        "detenido_en":"{{judicial.nombre_detenido_en}}",
        "disposicion":"{{judicial.conductor_disposicion}}"
      } 
      {%endfor%}
    ],
    "saldoSangres": [
   {% for sangre in  acc_saldoSangres %}
         {% if forloop.counter0 > 0 %}
        ,
      {% endif %}
      {
        "nombre": "{{sangre.nombre}} {{sangre.conductor_apepaterno}}  {{sangre.conductor_apematerno}}",
        "edad": "{{sangre.edad}}",
        "domicilio": "{{sangre.calle}}",
        "se_encontraba": "{{sangre.intervino_como}}",
        "estado_herido": "{{sangre.estado_herido}}",
        "levantado_por": "{{sangre.nombre_levantado_por}}",
        "trasladado_a": "{{sangre.nombre_trasladado_por}}"
     }
      {%endfor%}
    ],
    "vehiculos": [
     {% for veh in acc_vehiculos %}
      {% if forloop.counter0 > 0 %}
        ,
      {% endif %}
      {
        "clas_vehiculo": "{{veh.clas_vehiculo}}",
        "intervino_como": "{{veh.intervino_como}}",
        "marca": "{{veh.marca}}",
        "submarca": "{{veh.submarca}}",
        "modelo": "{{veh.modelo}}",
        "tipo": "{{veh.tipo}}",
        "datos_adicionales": "{{veh.datos_adicionales}}",
        "placa": "{{veh.placa}}",
        "serie": "{{veh.serie}}",
        "num_economico": "{{veh.num_economico}}",
        "capacidad": "{{veh.capacidad}}",
        "num_grua": "{{veh.nom_grua}}",
        "pension": "{{veh.pension}}",
        "vehiculo_servicio": "{{veh.vehiculo_servicio}}",
        "color": "{{veh.color}}",
        "color_detalle": "{{veh.color_detalle}}",
        "estadov": "{{veh.estadov}}",
        "tipo_dueno": "{{veh.tipo_dueno}}",
        "dueno_nombre": "{{veh.dueno_nombre}}",
        "dueno_apepaterno": "{{veh.dueno_apepaterno}}",
        "dueno_apematerno": "{{veh.dueno_apematerno}}",
        "dueno_calle": "{{veh.dueno_calle}}",
        "dueno_tel": "{{veh.dueno_tel}}",
        "dueno_cp": "{{veh.dueno_cp}}",
        "dueno_colonia": "{{veh.dueno_colonia}}",
        "dueno_ciudad": "{{veh.dueno_ciudad}}",
        "dueno_estado": "{{veh.dueno_estado}}",
        "conductor_nombre": "{{veh.conductor_nombre}}",
        "conductor_apepaterno": "{{veh.conductor_apepaterno}}",
        "conductor_apematerno": "{{veh.conductor_apematerno}}",
        "conductor_calle": "{{veh.conductor_calle}}",
        "conductor_edad": "{{veh.conductor_edad}}",
        "conductor_tipo_edad": "{{veh.conductor_tipo_edad}}",
        "conductor_sexo": "{{veh.conductor_sexo}}",
        "conductor_colonia": "{{veh.conductor_colonia}}",
        "folio_infraccion": "{{veh.folio_infraccion}}",
        "folio_certificado_medico": "{{veh.folio_certificado_medico}}",
        "conductor_estado": "{{veh.conductor_estado}}",
        "conductor_estado_droga": "{{veh.conductor_estado_droga}}",
        "conductor_municipio": "{{veh.conductor_municipio}}",
        "estado_herido": "{{veh.estado_herido}}",
        "conductor_detenido_en": "{{veh.conductor_detenido_en}}",
        "conductor_custodia": "{{veh.conductor_custodia}}",
        "conductor_disposicion": "{{veh.conductor_disposicion}}",
        "conductor_se_encontraba": "{{veh.conductor_se_encontraba}}",
        "conductor_levantado_por": "{{veh.conductor_levantado_por}}",
        "conductor_trasladado_a": "{{veh.conductor_trasladado_a}}",
        "conductor_num_licencia": "{{veh.conductor_num_licencia}}",
        "conductor_rest_licencia": "{{veh.conductor_rest_licencia}}",
        "conductor_fecha_vigencia": "{{veh.conductor_fecha_vigencia}}",
        "conductor_edo_licencia": "{{veh.conductor_edo_licencia}}"
        }
        {%endfor%}
    ]
  }
"""