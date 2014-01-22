tmplListInventario="""[
{% for inv in inventarios %}
  {% if forloop.counter0 > 0  %},{% endif %}
  {
  "id_temp": "{{inv.id_temp}}",
  "fecha_incid":"{{inv.fecha_incid}}",
  "fecha_entrega":"{{inv.fecha_entrega}}",
  "id_inventario":"{{inv.id_inventario}}",
  "folio_acc":"{{inv.folio_acc}}",
  "folio_inf":"{{inv.folio_inf}}",
  "tipo_vehiculo":"{{inv.clas_vehiculo}}",
   "comandancia":"{{inv.comandancia}}",
   "turno":"{{inv.turno}}",
   "infrac_accid":"{{inv.infrac_accid}}"
   
 }
 {%endfor%}
]
"""