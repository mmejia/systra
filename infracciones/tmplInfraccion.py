tmplInfraccion="""{
    "folio_infraccion": "{{inf.folio}}",
    "nombreAgente": "{{inf.nombreAgente}}",
    "noCobro": "{{inf.num_cobro_agente}}",
    "servicio":"{{inf.servicio}}",
    "tipo_servicio": "{{inf.servicio_publico}}",
    "hora": "{{inf.hora_infrac}}",
    "fecha": "{{inf.fecha_infrac}}",
    "delegacion": "{{inf.delegacion}}",
    "comandancia": "{{inf.comandancia}}",
    "turno": "{{inf.turno}}",
    "calle1": "{{inf.Calle1}}",
    "calle2": "{{inf.Calle2}}",
    "colonia2": "{{inf.Colonia2}}",
    "referencia": "{{inf.frente_num}}",
    "latitud": "{{inf.latitud}}",
    "longitud": "{{inf.longitud}}",
    "tipo_operativo": "{{inf.tipo_operativo}}",
    "circulacion": "{{inf.circulacion}}",
    "certificado":
    {
      "certificado_numero":"{{certificado_medico}}",
      "ebriedad_incompleta":"{{ebriedad_incompleta}}",
      "ebriedad_completa":"{{ebriedad_completa}}",
      "influjo_droga":"{{influjo_droga}}",
      "normal":"{{normal}}",
      "aliento_alcoholico":"{{aliento_alcoholico}}"
    },
    "firmo": "{{inf.firma_conductor}}",
    "vehiculo": {
      "clas_vehiculo": "{{inf.vehiculo.clas_vehiculo}}",
      "marca": "{{inf.vehiculo.marca}}",
      "submarca": "{{inf.vehiculo.submarca}}",
      "modelo": "{{inf.vehiculo.modelo}}",
      "color": "{{inf.vehiculo.color}}",
      "detalle_color": "{{inf.vehiculo.detalle_color}}",
      "tipo_placa": "{{inf.vehiculo.tipo_placa}}",
      "placas": "{{inf.vehiculo.placas}}",
      "estado_placa": "{{inf.vehiculo.estado_placa}}",
      "serie": "{{inf.vehiculo.serie}}",
      "tipo": "{{inf.vehiculo.tipo}}",
      "empresa": "{{inf.vehiculo.empresa}}",
      "ruta": "{{inf.vehiculo.ruta}}",
      "no_economico": "{{inf.vehiculo.no_economico}}",
      "no_tarjeton": "{{inf.vehiculo.no_tarjeton}}"
    },
    "infractor": {
      "nombre": "{{inf.infractor.nombre}}",
      "appPat": "{{inf.infractor.appPat}}",
      "appMat": "{{inf.infractor.appMat}}",
      "sexo": "{{inf.infractor.sexo}}",
      "edad": "{{inf.infractor.edad}}",
      "domicilio": "{{inf.infractor.domicilio}}",
      "numero": "{{inf.infractor.numero}}",
      "colonia": "{{inf.infractor.colonia}}",
      "ciudad": "{{inf.infractor.ciudad}}",
      "estado": "{{inf.infractor.estado}}",
      "no_licencia": "{{inf.infractor.no_licencia}}"
    },
    "se_recoje": {
      "tipo": "{{inf.se_recogio}}",
      "datos": {
        "recoje_licencia_estado":"{{inf.recoje_licencia_estado}}",
        "recoje_licencia_no_conducir":"{{inf.recoje_licencia_no_conducir}}",
        "recoje_licencia_fecha_vencimiento":"{{inf.recoje_licencia_fecha_vencimiento}}",
        "recoje_licencia_tipo":"{{inf.recoje_licencia_tipo}}",
        "recoje_licencia_restricciones":"{{inf.recoje_licencia_restricciones}}",
        "recoje_vehiculo_no_inventario": "{{inf.recoje_vehiculo_no_inventario}}",
        "recoje_vehiculo_pension":"{{inf.recoje_vehiculo_pension}}"
      }
    },

    "articulos": [
     {% for art in inf.detalles.all %}
       {% if forloop.counter0 > 0  %}
        ,
      {% endif %}
      {
        "art": "{{art.articulo}}",
        "fracc": "{{art.parrafo}}",
        "descc": "{{art.concepto}}"
      }
      {%endfor%}
     ]
  }
"""