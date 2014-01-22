tmplListaInfraccion ="""[
{% for inf in infracciones %}
  {% if forloop.counter0 > 0  %},{% endif %}
  {
  "id":"{{inf.id}}",
  "folio":"{{inf.folio}}",
  "delegacion":"{{inf.nombre_delegacion}}",
  "comandancia":"{{inf.nombre_comandancia}}",
  "fecha":"{{inf.fecha_infrac}}",
  "tipo_servicio":"{{inf.nombre_servicio}}",
  "articulos":
  [
   {% for art in  inf.lista_articulos %}
   		{% if forloop.counter0 > 0  %},{% endif %}
   			{
   			"articulo":"{{art.articulo}}",
   			"parrafo":"{{art.parrafo}}",
   			"concepto":"{{art.concepto}}"
			}
	 {%endfor%}
	]
 }
 {%endfor%}
]
"""