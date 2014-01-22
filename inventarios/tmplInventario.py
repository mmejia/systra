tmplInventario="""
{
 "fotos": [
 {% for foto in inventario.fotos.all %}
 		{% if forloop.counter0 > 0  %}
        ,
      	{% endif %}
        {
            "id": "{{foto.id}}",
            "nombre": ""{{foto.nombre_archivo}}"
        }
    {%endfor%}
    ],
    "frente": {
        "id": "{{frente.id}}",
        "nombre": "{{frente.nombre_archivo}}"
    },

    "posterior": {
        "id": "{{posterior.id}}",
        "nombre": "{{posterior.nombre_archivo}}"
    },
    "folio_del_inventario": "{{inventario.folio_inventario}}",
    "delegacion": "{{inventario.delegacion}}",
    "tipo_servicio": "{{inventario.tipo_servicio}}",
    "comandancia": "{{inventario.comandancia}}",
    "turno": "{{inventario.turno}}",
    "corporacion": "{{inventario.corporacion}}",
    "motivo_de_recojimiento": "{{inventario.motivo_de_recojimiento}}",
    "folio_infraccion": "{{inventario.folio_infraccion}}",
    "folio_accidente": "{{inventario.folio_accidente}}",
    "fecha_incidente": "{{inventario.fecha_incid}}",
    "calle1": "{{inventario.calle1}}",
    "exterior": "{{inventario.exterior}}",
    "num_interior": "{{inventario.interior}}",
    "calle2": "{{inventario.calle2}}",
    "colonia": "{{inventario.colonia}}",
    "depositado_en": "{{inventario.depositado_en}}",
    "autoridad_competente": "{{inventario.autoridad_competente}}",
    "mp": "{{inventario.agencia_mp}}",
    "marca": "{{inventario.marca}}",
    "submarca": "{{inventario.submarca}}",
    "modelo": "{{inventario.veh_modelo}}",
    "color": "{{inventario.veh_color}}",
    "detalle": "{{inventario.veh_color_detalle}}",
    "placas": "{{inventario.veh_placas}}",
    "numero_economico": "{{inventario.numero_economico}}",
    "serie": "{{inventario.veh_serie}}",
    "clas_vehiculo": "{{inventario.clas_vehiculo}}",
    "tipoveh": "{{inventario.tipo}}",
    "conductor_nombre": "{{inventario.infractor_nombre}}",
    "apellido_paterno": "{{inventario.infractor_apepaterno}}",
    "apellido_materno": "{{inventario.infractor_apematerno}}",
    "lugar": "{{inventario.pension_lugar}}",
    "fecha_entrada": "{{inventario.pension_fecha}}",
    "hora_entrada": "{{inventario.pension_hora}}",
    "recibido_por": "{{inventario.pension_recibido_por}}",
    "vehiculo_transportado_por": "{{inventario.pension_transportado_por}}",
    "vehiculo_transportado_pension": "{{inventario.pension_transportado_pension}}",
    "vehiculo_transportado_unidad_transito": "{{inventario.pension_transportado_unidad_transito}}",
    "folio_agente": "{{inventario.folio_agente}}",
    "nombre_agente": "{{inventario.nombre_agente}}",

    "fecha_captura": "{{inventario.fecha_captura}}", 
    "fecha_modifica": "{{inventario.fecha_modifica}}",
    "pension_recibido_por": "{{inventario.pension_recibido_por}}",
    "usuario": "{{inventario.usuario}}", 
    "salida_nombre": "{{inventario.salida_nombre}}",
    "salida_apepaterno": "{{inventario.salida_apepaterno}}",
    "salida_apematerno": "{{inventario.salida_apematerno}}",
    "liberacion_fecha": "{{inventario.liberacion_fecha}}",
    "liberacion_hora": "{{inventario.liberacion_hora}}",  
    "liberacion_entrega": "{{inventario.liberacion_entrega}}",
    "liberacion_recibe": "{{inventario.liberacion_recibe}}", 
    "liberacion_lugar": "{{inventario.liberacion_lugar}}",
    "folio_consignacion": "{{inventario.folio_consignacion}}", 
    "activo": "{{inventario.activo}}",
    "persona_fisica": "{{inventario.persona_fisica}}",
    "persona_moral": "{{inventario.persona_moral}}",
    "recibo_pago": "{{inventario.recibo_pago}}"
}
"""